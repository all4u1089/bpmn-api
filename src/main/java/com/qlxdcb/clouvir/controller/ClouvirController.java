package com.qlxdcb.clouvir.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.qlxdcb.clouvir.util.MessageByLocaleService;
import com.qlxdcb.clouvir.util.ProfileUtils;

import vn.greenglobal.core.model.common.BaseController;
import vn.greenglobal.core.model.common.BaseRepository;

public class ClouvirController<T> extends BaseController<T> {

	@Autowired
	ProfileUtils profileUtil;

	@Autowired
	MessageByLocaleService message;

	public ClouvirController(BaseRepository<T, ?> repo) {
		super(repo);
	}

	public ProfileUtils getProfileUtil() {
		return profileUtil;
	}

	public MessageByLocaleService getMessage() {
		return message;
	}
}
