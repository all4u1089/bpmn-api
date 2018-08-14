package com.qlxdcb.clouvir.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.qlxdcb.clouvir.model.QResetToken;
import com.qlxdcb.clouvir.model.ResetToken;
import com.qlxdcb.clouvir.repository.ResetTokenRepository;
import com.qlxdcb.clouvir.util.Utils;

@Component
public class ResetTokenService {
	BooleanExpression base = QResetToken.resetToken.deleted.isFalse();

	@Autowired
	private ResetTokenRepository repo;

	public Predicate predicateFindOne(Long id) {
		return base.and(QResetToken.resetToken.id.eq(id));
	}
	
	public ResetToken predFindToKenCurrentByToken(String token) {
		BooleanExpression predAll = base;
		predAll = predAll.and(QResetToken.resetToken.token.eq(token));
		if (repo.exists(predAll)) {
			return repo.findOne(predAll);
		}
		return null;
	}
	
	public ResetToken save(ResetToken obj, Long userId) {
		return Utils.save(repo, obj, userId);
	}

	public ResponseEntity<Object> doSave(ResetToken obj, Long userId, PersistentEntityResourceAssembler eass,
			HttpStatus status) {
		return Utils.doSave(repo, obj, userId, eass, status);
	}
}
