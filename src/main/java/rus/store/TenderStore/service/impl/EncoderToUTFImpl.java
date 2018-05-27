package rus.store.TenderStore.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class EncoderToUTFImpl {
	
	public String encode(String initStr) throws UnsupportedEncodingException {
	initStr = URLEncoder.encode( initStr, "ISO-8859-1" );
	initStr = URLDecoder.decode( initStr, "UTF-8" );
	return initStr;
	}
}
