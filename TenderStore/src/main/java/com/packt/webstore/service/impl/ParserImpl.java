package com.packt.webstore.service.impl;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.packt.webstore.service.Parser;



public class ParserImpl implements Parser{
	//Creating String for accessing zakupki.gov and for pulling full html code. 
	String ur = "http://zakupki.gov.ru/epz/order/notice/ea44/view/common-info.html?regNumber=";
	String html;
	String result;
	String priceString;
	
	public ParserImpl(String tenderId) throws IOException {
		// TODO Auto-generated constructor stub
		Document doc = Jsoup.connect(ur+tenderId).get();
		html = doc.toString();
		Elements price = doc.select(".tdTotal");
		priceString = price.toString();
	}
	public String parseName() {
		try{
			result=html.substring(html.indexOf("Заказчик") );
			result=result.substring(result.indexOf("\">")+2, result.indexOf("</"));
			if (result.indexOf("\"") != 0)
				result = result.substring(result.indexOf("\"")+1);
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String parseCity() {
		try {
			result=html.substring(html.indexOf("Почтовый адрес"), html.indexOf("Место нахождения"));
			result=result.substring(0,result.indexOf(" г,"));
			int i =result.lastIndexOf(", ");
			result=result.substring(i+2).trim();
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String parseStage() {
		try {
			result=html.substring(html.indexOf("Этап закупки"));
			result=result.substring(0, result.indexOf("</tr>"));
			result=result.substring(result.indexOf("<td>")+4);
			result=result.substring(0,result.indexOf("</td>"));
			if(result.equals("Подача заявок"))
				return "filing";
			if(result.equals("Работа комиссии")) 
				return "consideration";
			if(result.equals("Закупка завершена")||result.equals("Определение поставщика завершено"))
				return "complited";
			else return null;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String parsePrice() {
		try{
			result=priceString.substring(priceString.indexOf("r\">")+3);
			result=result.substring(0,result.indexOf("</td>"));
			return result; 
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String parseProcuring() {
		try {
			result=html.substring(html.indexOf("Размер обеспечения заявок"), html.indexOf("&nbsp;Российский рубль</td>"));
			result=result.substring(result.indexOf("<td>")+4);
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String parseCite() {
		try {
			result=html.substring(html.indexOf("\"http://")+8);
			result=result.substring(0, result.indexOf("\""));
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public String parseDateTo() {
		try {
			result=html.substring(html.indexOf("окончания подачи заявок")+20);
			result=result.substring(0, result.indexOf("</tr>")-5);
			result=result.substring(result.indexOf("<td>")+4);
			result=result.substring(0,result.indexOf("</td> "));
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public String parseDateTender() {
		try {
			result=html.substring(html.indexOf("Дата проведения аукциона в электронной форме")+35);
			result=result.substring(result.indexOf("<td>")+4);
			result=result.substring(0, result.indexOf("</tr>")-5);
			result=result.substring(0,result.indexOf("</td> "));
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public String parseProcuringContract() {
		try {
			result=html.substring(html.indexOf("Размер обеспечения исполнения контракта")+30);
			result=result.substring(0, result.indexOf("</tr>")-5);
			result=result.substring(result.indexOf("<td>")+4);
			result=result.substring(0,result.indexOf("</td> "));				
			return result;
		}catch (StringIndexOutOfBoundsException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	

}
