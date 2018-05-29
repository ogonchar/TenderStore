package rus.store.TenderStore.service.impl;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.function.Function;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import rus.store.TenderStore.service.Parser;

//The class used for requiring information from tender page on zakupki.gov.ru. The Jsoup download page from site to string and then parser process information through several functions. 
// Function<String,String> used here to eliminating verbose and repetitive code fragment when using standard approach. 

public class ParserImpl implements Parser{
	//Creating String for accessing zakupki.gov and for pulling full html code. 
	String ur = "http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=";
	String html;
	String result;
	String priceString;
	Logger log = Logger.getLogger(ParserImpl.class.getName());
	
			//Basic Functions
			Function<String,String> fromTd = str -> str.substring(str.indexOf("<td>")+4);
			Function<String,String> toTd = str -> str.substring(0,str.indexOf("</td>"));
			Function<String,String> fromQuot = str -> str.substring(str.indexOf("\"")+1);
			Function<String,String> toQuot = str -> str.substring(0,str.indexOf("\""));
			Function<String,String> fromQuotArrow = str -> str.substring(str.indexOf("\">")+2);
			Function<String,String> toQuotArrow = str -> str.substring(0, str.indexOf("</")-2);
			Function<String,String> toTr = str -> str.substring(0, str.indexOf("</tr>"));
			Function<String,String> cutNbsp = str -> str.replaceAll("&nbsp;", " ");
			Function<String,String> Trim = str -> str.trim();
			
			//Helpers for each methods
			Function<String,String> helpPhone = str-> str.substring(str.indexOf("Номер контактного телефона"),str.indexOf("Дополнительная информация"));
			Function<String,String> helpName = str -> str.substring(str.indexOf("Заказчик"));
			Function<String,String> helpStage = str -> str.substring(str.indexOf("Этап закупки"));
			Function<String,String> helpPrice = str -> str.substring(str.indexOf("r\">")+3);
			Function<String,String> helpProcuring =  str -> str.substring(str.indexOf("Размер обеспечения заявок"), html.indexOf("&nbsp;Российский рубль</td>"));
			Function<String,String> helpSite =  str -> str.substring(str.indexOf("\"http://")+8);
			Function<String,String> helpDate =  str -> str.substring(str.indexOf("окончания подачи заявок")+20);
			Function<String,String> helpDate2 =  str -> str.substring(0, str.indexOf("</tr>")-5);
			Function<String,String> helpDateTender = str -> str.substring(str.indexOf("Дата проведения аукциона в электронной форме")+35);
			Function<String,String> helpProcuringContract = str -> str.substring(str.indexOf("Размер обеспечения исполнения контракта")+30, html.indexOf("&nbsp;Российский рубль</td>"));
			Function<String,String> helpAddress = str -> str.substring(html.indexOf("Почтовый адрес")+29,html.indexOf("Место нахождения"));
			Function<String,String> helpEmail = str -> str.substring(html.indexOf("Адрес электронной почты")+30,html.indexOf("Номер контактного телефона"));
			Function<String,String> helpObjectOfPurchase = str -> str.substring(str.indexOf("Наименование объекта закупки"), str.indexOf("Этап закупки"));
			
			//Queuing the functions to then pass to methods
			Function<String,String> Phone = helpPhone.andThen(fromTd).andThen(toTd).andThen(Trim);
			Function<String,String> Name = helpName.andThen(fromQuotArrow).andThen(toQuotArrow).andThen(Trim);
			Function<String,String> Stage = helpStage.andThen(toTr).andThen(fromTd).andThen(toTd).andThen(Trim);
			Function<String,String> Price = helpPrice.andThen(toTd).andThen(cutNbsp).andThen(Trim);
			Function<String,String> Procuring = helpProcuring.andThen(fromTd).andThen(cutNbsp).andThen(Trim);
			Function<String,String> Site = helpSite.andThen(toQuot).andThen(Trim);
			Function<String,String> Date = helpDate.andThen(helpDate2).andThen(fromTd).andThen(toTd).andThen(Trim);
			Function<String,String> DateTender = helpDateTender.andThen(fromTd).andThen(helpDate2).andThen(toTd).andThen(Trim);
			Function<String,String> ProcuringContract = helpProcuringContract.andThen(helpDate2).andThen(fromTd).andThen(toTd).andThen(cutNbsp).andThen(Trim);
			Function<String,String> Address = helpAddress.andThen(fromTd).andThen(toTd).andThen(Trim);
			Function<String,String> Email = helpEmail.andThen(fromTd).andThen(toTd).andThen(Trim);
			Function<String,String> ObjectOfPurchase = helpObjectOfPurchase.andThen(fromTd).andThen(toTd).andThen(Trim);
					
	public ParserImpl(String tenderId) throws IOException {
		// TODO Auto-generated constructor stub
		Document doc = Jsoup.connect(ur+tenderId).get();
		html = doc.toString();
		Elements price = doc.select(".tdTotal");
		priceString =price.toString();
	}
	
	public String parseName() {
		if(html.contains("Заказчик")) {
		return parse((html) -> {String result = Name.apply(html);
		if (result.indexOf("\"") != 0) return fromQuot.apply(result); 
		return null;});
		}return null;
	}

	public String parseCity() {
		try {
			result=html.substring(html.indexOf("Почтовый адрес"), html.indexOf("Место нахождения"));
			result=result.substring(0,result.indexOf(" г,"));
			int i =result.lastIndexOf(", ");
			result=result.substring(i+2).trim();
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			log.warn("Unable to parse city");
			return null;
		}
	}

	public String parseStage() {
		result =  parse((html) -> Stage.apply(html));
		if(result.equals("Подача заявок"))	return "filing";
		if(result.equals("Работа комиссии")) return "consideration";
		if(result.equals("Закупка завершена")||result.equals("Определение поставщика завершено")) return "complited";
		else return null;
	}

	public int parsePrice() {
		result = parse((html) -> Price.apply(priceString));
		int i = toInt(result);
		return i;
	}

	public int parseProcuring() {
		result =  parse((html) -> Procuring.apply(html));
		int i = toInt(result);
		return i;
	}
	
	public String parseCite() {
		result =  parse((html) -> Site.apply(html));
		if(result.length() <20)
		return result;
		return null;
	}
	
	public Date parseDateTo() {
		result = parse((html) -> Date.apply(html));
		result = result.substring(0, result.indexOf(" "));
		DateFormat format = new SimpleDateFormat("dd.MM.yyyy", Locale.ENGLISH);
		Date date;
		try {
			date = format.parse(result);
			return date;
		} catch (Exception e) {
			return null;
		}
	}
	
	public Date parseDateTender() {
		result = parse((html) -> DateTender.apply(html));
		if(result.contains(" "))
		result = result.substring(0, result.indexOf(" "));
		DateFormat format = new SimpleDateFormat("dd.MM.yyyy", Locale.ENGLISH);
		Date date;
		try {
			date = format.parse(result);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int parseProcuringContract() {
		result = parse((html) -> ProcuringContract.apply(html));
		int i = toInt(result);
		return i;
	}
	
	public String parseAddress() {
		return parse((html) -> Address.apply(html));
	}
	
	public String parsePhone() {
		return parse((html) -> Phone.apply(html));
	}
	public String parseEmail() {
		return parse((html) -> Email.apply(html));
	}
	
	public String parsePurchase() {
		return result = ObjectOfPurchase.apply(html);
	}
	
	public long  parseInn() throws IOException {
		try{
			result=html.substring(html.indexOf("Общая информация о закупке"),html.indexOf("Информация об организации, осуществляющей"));
			if(result.contains("Уполномоченное учреждение")||result.contains("Уполномоченный орган")){
				result=result.substring(result.indexOf("k\" href=\"")+9);
				result = result.substring(0, result.indexOf("\">"));
				Document doc1;
				
				doc1 = Jsoup.connect(result).get();
				String html1 = doc1.toString();
				result = html1.substring(html1.indexOf("ИНН"));
				result = result.substring(0,result.indexOf("</tr>"));
				result = result.substring(result.indexOf("<td>")+4, result.lastIndexOf("</td>"));
				long  res = Long.parseLong(result);
				return res;
			}else if(result.contains("Заказчик")){
				result=html.substring(html.indexOf("Заказчик") );
				result=result.substring(result.indexOf("\" ")+8);
				result = result.substring(0, result.indexOf("\""));
				Document doc1;
				doc1 = Jsoup.connect(result).get();
				String html1 = doc1.toString();
				result = html1.substring(html1.indexOf("ИНН"));
				result = result.substring(0,result.indexOf("</tr>"));
				result = result.substring(result.indexOf("<td>")+4, result.lastIndexOf("</td>"));
				long  res = Long.parseLong(result);
				return res;
			} else return 0;
			}catch (StringIndexOutOfBoundsException e) {
				log.warn("String out of index while parcing");
				return 0;
			}
		}
	
	@FunctionalInterface
	public interface Parser {
	String process(String html) throws IOException;
	}
	public String parse(Parser p) {
		try {
			String res = p.process(html);
			return res;
		}catch (IOException e) {
			log.warn("IOException while parcing");
		}catch (StringIndexOutOfBoundsException e) {
			log.warn("String out of index while parcing");
		}catch (Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	
	int toInt(String str) {
		try {
			if(str !=null) {
			str = str.replaceAll(" ", "");
			str= str.substring(0,str.indexOf(","));
			int i = Integer.parseInt(str);
			return i;
			}
		} catch (NumberFormatException e) {
			log.warn("Fainled to convert string to int, NumberFormatException.  String was: " + str);
		}catch(StringIndexOutOfBoundsException e) {
			log.warn("Fainled to convert string to int, StringIndexOutOfBoundsException");
		}
		return 0;
	}
}