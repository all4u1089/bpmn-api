package com.eazymation.clouvir.util;

//import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;

@Converter(autoApply = true)
public class LocalDateTimeAttributeConverter implements AttributeConverter<LocalDateTime, Date> {

	// private static Log log =
	// LogFactory.getLog(LocalDateTimeAttributeConverter.class);

	@Override
	public Date convertToDatabaseColumn(LocalDateTime locDateTime) {
		// log.info("from LDT "+locDateTime.toString());
		return (locDateTime == null ? null : Date.from(locDateTime.atZone(ZoneId.systemDefault()).toInstant()));
	}

	@Override
	public LocalDateTime convertToEntityAttribute(Date date) {
		// log.info("from D "+date.toString());
		return (date == null ? null : LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault()));
	}

}
