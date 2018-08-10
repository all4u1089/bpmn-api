package com.eazymation.clouvir.util;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

@Component
public class MessageByLocaleServiceImpl implements MessageByLocaleService {

	@Autowired
	private MessageSource messageSource;

	Locale locale = LocaleContextHolder.getLocale();

	@Override
	public String getMessage(String id) {
		return messageSource.getMessage(id, null, locale);
	}

	@Override
	public String getMessage(String id, Object[] params) {
		return messageSource.getMessage(id, params, locale);
	}

}
