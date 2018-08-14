package com.qlxdcb.clouvir.service;

import java.math.BigInteger;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.qlxdcb.Application;
import com.qlxdcb.clouvir.model.KeHoachNhuCauVon;
import com.qlxdcb.clouvir.model.QKeHoachNhuCauVon;
import com.qlxdcb.clouvir.repository.KeHoachNhuCauVonRepository;
import com.qlxdcb.clouvir.util.Utils;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;

@Component
public class KeHoachNhuCauVonService {
	@Autowired
	private KeHoachNhuCauVonRepository repo;
	
	@Autowired
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Transactional
	public List<KeHoachNhuCauVon> findAllByNativeQuery(String keyword, int offset, int limit,
			Sort sort) {
		List<KeHoachNhuCauVon> list = new ArrayList<>();
		EntityManager em = Application.app.getEntityManager();
		String query = "SELECT DISTINCT khncv.* FROM kehoachnhucauvon AS khncv";
		query += getQueryFindAll(keyword);
		String sortStr = "createdDate DESC";
		if (sort == null) {
			sortStr = "createdDate DESC ";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query += " ORDER BY khncv." + sortStr + " LIMIT " + limit + " OFFSET " + offset + ";";
		list = (List<KeHoachNhuCauVon>) em.createNativeQuery(query, KeHoachNhuCauVon.class).getResultList();
		return list;
	}
	

	private String getQueryFindAll(String keyword) {
		String query = "";
		query += " WHERE khncv.deleted = false";
		if (keyword != null && StringUtils.isNoneBlank(keyword.trim())) {
			query += " AND khncv.ten like '%" + keyword.trim().toLowerCase() + "%'";
		}
		return query;
	}

	@Transactional
	public int countAllByNativeQuery(String keyword) {
		int count = 0;
		String query = "SELECT COUNT(DISTINCT khncv.id) FROM kehoachnhucauvon AS khncv";
		query += getQueryFindAll(keyword);
		count = ((BigInteger) em.createNativeQuery(query).getSingleResult()).intValue();
		return count;
	}

	public KeHoachNhuCauVon save(KeHoachNhuCauVon obj, Long userId) {
		return Utils.save(repo, obj, userId);
	}

	public ResponseEntity<Object> doSave(KeHoachNhuCauVon obj, Long userId, PersistentEntityResourceAssembler eass,
			HttpStatus status) {
		return Utils.doSave(repo, obj, userId, eass, status);
	}

	BooleanExpression base = QKeHoachNhuCauVon.keHoachNhuCauVon.deleted.eq(false);

	public Predicate predicateFindOne(Long id) {
		return base.and(QKeHoachNhuCauVon.keHoachNhuCauVon.id.eq(id));
	}

	public KeHoachNhuCauVon findOne(Long id) {
		return repo.findOne(predicateFindOne(id));
	}

	public KeHoachNhuCauVon delete(Long id) {
		KeHoachNhuCauVon help = repo.findOne(predicateFindOne(id));
		if (help != null) {
			help.setDeleted(true);
		}
		return help;
	}

	public boolean isExists(Long id) {
		if (id != null && id > 0) {
			Predicate predicate = base.and(QKeHoachNhuCauVon.keHoachNhuCauVon.id.eq(id));
			return repo.exists(predicate);
		}
		return false;
	}
}
