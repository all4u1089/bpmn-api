package com.qlxdcb.clouvir.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.qlxdcb.clouvir.model.QSetting;
import com.qlxdcb.clouvir.model.Setting;
import com.qlxdcb.clouvir.repository.SettingRepository;
import com.qlxdcb.clouvir.util.Utils;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;

@Component
public class SettingService {
	@Autowired
	private SettingRepository repo;
	
	BooleanExpression base = QSetting.setting.deleted.eq(false);

	public Predicate predicateFindOne(Long id) {
		return base.and(QSetting.setting.id.eq(id));
	}
		
	public Setting save(Setting obj, Long userId) {
		return Utils.save(repo, obj, userId);
	}
	
	public Setting findOne(Long id) {
		return repo.findOne(predicateFindOne(id));
	}
	
	public ResponseEntity<Object> doSave(Setting obj, Long userId, PersistentEntityResourceAssembler eass, HttpStatus status){
		return Utils.doSave(repo, obj, userId, eass, status);
	}
	
	public boolean isExists(Long id) {
		if (id != null && id > 0) {
			Predicate predicate = base.and(QSetting.setting.id.eq(id));
			return repo.exists(predicate);
		}
		return false;
	}
	
	public Setting delete(Long id) {
		Setting setting = repo.findOne(predicateFindOne(id));

		if (setting != null) {
			setting.setDeleted(true);
		}
		return setting;
	}
}
