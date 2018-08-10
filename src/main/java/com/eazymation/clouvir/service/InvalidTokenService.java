package com.eazymation.clouvir.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.eazymation.clouvir.model.InvalidToken;
import com.eazymation.clouvir.model.User;
import com.eazymation.clouvir.repository.InvalidTokenRepository;
import com.eazymation.clouvir.util.Utils;
import com.eazymation.clouvir.model.QInvalidToken;

@Component
public class InvalidTokenService {
	BooleanExpression base = QInvalidToken.invalidToken.deleted.isFalse();

	@Autowired
	private InvalidTokenRepository repo;

	public Predicate predicateFindOne(Long id) {
		return base.and(QInvalidToken.invalidToken.id.eq(id));
	}
	
	public InvalidToken findOne(Predicate predicate) {
		return repo.findOne(predicate);
	}
	
	public Predicate predFindInVaidToKensByUser(List<User> users) {
		BooleanExpression predAll = base;
		predAll = predAll.and(QInvalidToken.invalidToken.user.in(users));
		return predAll;
	}
	
	public InvalidToken predFindToKenCurrentByUser(Long userId) {
		BooleanExpression predAll = base;
		predAll = predAll.and(QInvalidToken.invalidToken.user.id.eq(userId));
		if (repo.exists(predAll)) {
			return repo.findOne(predAll);
		}
		return null;
	}
	
	public InvalidToken predFindToKenCurrentByToken(String token) {
		BooleanExpression predAll = base;
		predAll = predAll.and(QInvalidToken.invalidToken.active.isTrue())
				.and(QInvalidToken.invalidToken.token.eq(token));
		if (repo.exists(predAll)) {
			return repo.findOne(predAll);
		}
		return null;
	}
	
	public InvalidToken save(InvalidToken obj, Long userId) {
		return Utils.save(repo, obj, userId);
	}

	public ResponseEntity<Object> doSave(InvalidToken obj, Long userId, PersistentEntityResourceAssembler eass,
			HttpStatus status) {
		return Utils.doSave(repo, obj, userId, eass, status);
	}
}
