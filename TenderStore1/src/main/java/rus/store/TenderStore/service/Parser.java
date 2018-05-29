package rus.store.TenderStore.service;

import java.util.Date;

public interface Parser {
	String parseName();
	String parseCity();
	String parseStage();
	int parsePrice();
	int parseProcuring();
	String parseCite();
	Date parseDateTo();
	Date parseDateTender();
	int parseProcuringContract();
	String parseEmail();
}
