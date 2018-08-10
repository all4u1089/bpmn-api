package com.eazymation.clouvir.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.eazymation.clouvir.model.ResetToken;
import com.eazymation.clouvir.repository.ResetTokenRepository;
import com.eazymation.clouvir.util.Utils;
import com.eazymation.clouvir.model.QResetToken;

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
