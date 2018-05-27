package rus.store.TenderStore.service.impl;

import java.time.LocalDate;
import java.time.ZoneId;

import org.springframework.stereotype.Service;

@Service
public class DateUtilImpl {
	public LocalDate currDate() {
		ZoneId zonedId = ZoneId.of( "Europe/Moscow" );
		return LocalDate.now( zonedId );
	}
}
