package com.eazymation.clouvir.service;

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

import com.eazymation.Application;
import com.eazymation.clouvir.model.Help;
import com.eazymation.clouvir.model.QHelp;
import com.eazymation.clouvir.repository.HelpRepository;
import com.eazymation.clouvir.util.Utils;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;

@Component
public class HelpService {
	@Autowired
	private HelpRepository repo;
	
	@Autowired
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Help> findAllByNativeQuery(String keyword, String dateFrom, String dateTo, int offset, int limit,
			Sort sort) {
		List<Help> list = new ArrayList<>();
		EntityManager em = Application.app.getEntityManager();
		String query = "SELECT DISTINCT help.* FROM help AS help";
		query += getQueryFindAll(keyword, dateFrom, dateTo);
		String sortStr = "createdDate DESC";
		if (sort == null) {
			sortStr = "createdDate DESC ";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query += " ORDER BY help." + sortStr + " LIMIT " + limit + " OFFSET " + offset + ";";
		list = (List<Help>) em.createNativeQuery(query, Help.class).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Object[]> findAllByNativeQueryForExport(String keyword, String dateFrom, String dateTo, Sort sort) {
		List<Object[]> list = new ArrayList<Object[]>();
		String query = "SELECT DISTINCT help.createdDate, help.title, help.content"
					+ " FROM help AS help";
		query += getQueryFindAll(keyword, dateFrom, dateTo);
		String sortStr = "";
		if (sort == null) {
			sortStr = "createdDate DESC";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query +=	" ORDER BY help." + sortStr;
		list = (List<Object[]>) em.createNativeQuery(query).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Object[]> findAllByNativeQueryForExportCSV(String keyword, String dateFrom, String dateTo, Sort sort) {
		List<Object[]> list = new ArrayList<Object[]>();
		String query = "SELECT DISTINCT help.title, help.content"
					+ " FROM help AS help";
		query += getQueryFindAll(keyword, dateFrom, dateTo);
		String sortStr = "";
		if (sort == null) {
			sortStr = "createdDate DESC";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query +=	" ORDER BY help." + sortStr;
		list = (List<Object[]>) em.createNativeQuery(query).getResultList();
		return list;
	}

	private String getQueryFindAll(String keyword, String dateFrom, String dateTo) {
		String query = "";
		query += " WHERE help.deleted = false";
		if (keyword != null && StringUtils.isNoneBlank(keyword.trim())) {
			query += " AND help.title like '%" + keyword.trim().toLowerCase() + "%'";
		}

		if (dateFrom != null && StringUtils.isNotBlank(dateFrom.trim()) && dateTo != null
				&& StringUtils.isNotBlank(dateTo.trim())) {
			LocalDateTime dateF = Utils.fixDateFrom(dateFrom);
			LocalDateTime dateT = Utils.fixDateTo(dateTo);
			query += " AND help.createdDate BETWEEN '" + dateF.toString() + "' AND '" + dateT.toString() + "'";
		} else if (dateFrom != null && StringUtils.isNotBlank(dateFrom.trim())) {
			LocalDateTime dateF = Utils.fixDateFrom(dateFrom);
			query += " AND (help.createdDate >= '" + dateF + "')";
		} else if (dateTo != null && StringUtils.isNotBlank(dateTo.trim())) {
			LocalDateTime dateT = Utils.fixDateTo(dateTo);
			query += " AND (help.createdDate < '" + dateT + "')";
		}
		return query;
	}

	@Transactional
	public int countAllByNativeQuery(String keyword, String dateFrom, String dateTo) {
		int count = 0;
		String query = "SELECT COUNT(DISTINCT help.id) FROM help AS help";
		query += getQueryFindAll(keyword, dateTo, dateFrom);
		count = ((BigInteger) em.createNativeQuery(query).getSingleResult()).intValue();
		return count;
	}

	public Help save(Help obj, Long userId) {
		return Utils.save(repo, obj, userId);
	}

	public ResponseEntity<Object> doSave(Help obj, Long userId, PersistentEntityResourceAssembler eass,
			HttpStatus status) {
		return Utils.doSave(repo, obj, userId, eass, status);
	}

	BooleanExpression base = QHelp.help.deleted.eq(false);

	public Predicate predicateFindOne(Long id) {
		return base.and(QHelp.help.id.eq(id));
	}

	public Help findOne(Long id) {
		return repo.findOne(predicateFindOne(id));
	}

	public Help delete(Long id) {
		Help help = repo.findOne(predicateFindOne(id));
		if (help != null) {
			help.setDeleted(true);
		}
		return help;
	}

	public boolean isExists(Long id) {
		if (id != null && id > 0) {
			Predicate predicate = base.and(QHelp.help.id.eq(id));
			return repo.exists(predicate);
		}
		return false;
	}
	
	public boolean checkExistsData(Help body) {
		BooleanExpression predAll = base;

		if (!body.isNew()) {
			predAll = predAll.and(QHelp.help.id.ne(body.getId()));
		}

		predAll = predAll.and(QHelp.help.title.eq(body.getTitle()));
		List<Help> helps = (List<Help>) repo.findAll(predAll);

		return helps != null && helps.size() > 0 ? true : false;
	}
}
