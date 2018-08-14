package com.qlxdcb.clouvir.service;

import java.math.BigInteger;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.qlxdcb.clouvir.enums.RoleTypeEnum;
import com.qlxdcb.clouvir.model.QUser;
import com.qlxdcb.clouvir.model.Role;
import com.qlxdcb.clouvir.model.User;
import com.qlxdcb.clouvir.repository.UserRepository;
import com.qlxdcb.clouvir.util.Utils;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;

@Component
public class UserService {
	
	@Autowired
	private UserRepository repo;
	
	@Autowired
	private EntityManager em;
	
	@Autowired
	private RoleService roleService;

	BooleanExpression base = QUser.user.deleted.eq(false);

	public Predicate predicateFindOne(Long id) {
		return base.and(QUser.user.id.eq(id));
	}
	
	public User findOne(Long id) {
		return repo.findOne(predicateFindOne(id));
	}
	
	public User findOne(Predicate predicate) {
		return repo.findOne(predicate);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<User> findAllByNativeQuery(String keyword, boolean isSystem, List<Long> roleIds, String typeDate, String dateFrom, 
			String dateTo, Long projectId, boolean haveSecurityPlegde, Long companyId, Long paId, String roleType, int offset, int limit, Sort sort) {
		List<User> list = new ArrayList<User>();
		String query = "SELECT DISTINCT user.* FROM user as user";
		query += getQueryFindAll(keyword, isSystem, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPlegde, companyId, paId, roleType);
		String sortStr = "";
		if (sort == null) {
			sortStr = "updatedDate DESC";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query +=	 " ORDER BY user." + sortStr + " LIMIT " + limit + " OFFSET " + offset + ";";
		list = (List<User>) em.createNativeQuery(query, User.class).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Object[]> findAllByNativeQueryForExport(String keyword, boolean isSystem, List<Long> roleIds, String typeDate, 
			String dateFrom, String dateTo, Long projectId, boolean haveSecurityPlegde, Long companyId, Long paId, String roleType, Sort sort) {
		List<Object[]> list = new ArrayList<Object[]>();
		String query = "SELECT DISTINCT user.fullName, user.company_id, user.department, user.role_id, user.createdDate, user.recentSignIn,"
						+ " user.internalIP, user.externalIP, user.securityViolationHistory"
					+ " FROM user as user";
		query += getQueryFindAll(keyword, isSystem, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPlegde, companyId, paId, roleType);
		String sortStr = "";
		if (sort == null) {
			sortStr = "updatedDate DESC";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query +=	 " ORDER BY user." + sortStr;
		list = (List<Object[]>) em.createNativeQuery(query).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Object[]> findAllByNativeQueryForExportCSV(String keyword, boolean isSystem, List<Long> roleIds, String typeDate, 
			String dateFrom, String dateTo, Long projectId, boolean haveSecurityPlegde, Long companyId, Long paId, String roleType, Sort sort) {
		List<Object[]> list = new ArrayList<Object[]>();
		String query = "SELECT DISTINCT user.fullName, user.contact, user.email, user.company_id, user.department, user.role_id,"
						+ " user.referenceDescription, user.internalIP, user.externalIP"
					+ " FROM user as user";
		query += getQueryFindAll(keyword, isSystem, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPlegde, companyId, paId, roleType);
		String sortStr = "";
		if (sort == null) {
			sortStr = "updatedDate DESC";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query +=	 " ORDER BY user." + sortStr;
		list = (List<Object[]>) em.createNativeQuery(query).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Object[]> findAllByNativeQueryForExportEmployer(String keyword, boolean isSystem, List<Long> roleIds, String typeDate, 
			String dateFrom, String dateTo, Long projectId, boolean haveSecurityPlegde, Long companyId, Long paId, Sort sort) {
		List<Object[]> list = new ArrayList<Object[]>();
		String query = "SELECT DISTINCT user.fullName, user.email, user.department, user.role_id, user.createdDate, user.recentSignIn"
					+ " FROM user as user";
		query += getQueryFindAll(keyword, isSystem, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPlegde, companyId, paId, null);
		String sortStr = "";
		if (sort == null) {
			sortStr = "updatedDate DESC";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query +=	 " ORDER BY user." + sortStr;
		list = (List<Object[]>) em.createNativeQuery(query).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Object[]> findAllByNativeQueryForExportCSVEmployer(String keyword, boolean isSystem, List<Long> roleIds, String typeDate, 
			String dateFrom, String dateTo, Long projectId, boolean haveSecurityPlegde, Long companyId, Long paId, Sort sort) {
		List<Object[]> list = new ArrayList<Object[]>();
		String query = "SELECT DISTINCT user.fullName, user.email, user.contact, user.department, user.role_id, user.referenceDescription"
					+ " FROM user as user";
		query += getQueryFindAll(keyword, isSystem, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPlegde, companyId, paId, null);
		String sortStr = "";
		if (sort == null) {
			sortStr = "updatedDate DESC";
		} else {
			sortStr = sort.toString().replaceFirst(":", "");
		}
		query +=	 " ORDER BY user." + sortStr;
		list = (List<Object[]>) em.createNativeQuery(query).getResultList();
		return list;
	}
	
	@Transactional
	public int countAllByNativeQuery(String keyword, boolean isSystem, List<Long> roleIds, String typeDate, 
			String dateFrom, String dateTo, Long projectId, boolean haveSecurityPlegde, Long companyId, Long paId, String roleType) {
		int count = 0;
		String query = "SELECT COUNT(DISTINCT user.id) FROM user as user";
		query += getQueryFindAll(keyword, isSystem, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPlegde, companyId, paId, roleType);
		count = ((BigInteger) em.createNativeQuery(query).getSingleResult()).intValue();
		return count;
	}
	
	private String getQueryFindAll(String keyword, boolean isSystem, List<Long> roleIds, String typeDate, 
			String dateFrom, String dateTo, Long projectId, boolean haveSecurityPlegde, Long companyId, Long userId, String roleType) {
		String query = " INNER JOIN role as r ON r.id = user.role_id";
		if (projectId != null && projectId > 0) {
			query += " INNER JOIN worker_do_contract AS wdc ON user.id = wdc.user_id"
				   + " INNER JOIN contract AS c ON wdc.contract_id = c.id";
		}
		if (keyword != null && StringUtils.isNotBlank(keyword.trim())) {
			query += " LEFT JOIN company AS com ON user.company_id = com.id";
		}
		if (roleType != null && RoleTypeEnum.PROJECT_ADMIN.toString().equals(roleType) && userId != null && userId > 0) {
			query += " INNER JOIN worker_do_contract AS wdc2 ON user.id = wdc2.user_id"
				   + " INNER JOIN contract AS c2 ON wdc2.contract_id = c2.id"
				   + " INNER JOIN project AS p2 ON c2.project_id = p2.id"
				   + " INNER JOIN project_admin AS pa2 ON pa2.project_id = p2.id";
		}
		query += 	 " WHERE user.deleted = false";
		if (roleType != null && RoleTypeEnum.PROJECT_ADMIN.toString().equals(roleType)) {
			if (userId != null && userId > 0) {
				query += 	" AND pa2.user_id = " + userId;
			}
		} 
		
		if (projectId != null && projectId > 0) {
			query += 	" AND c.project_id = " + projectId;
		}
		
		if (companyId != null && companyId > 0) {
			query += 	" AND user.company_id = " + companyId;
		}
		
		if (haveSecurityPlegde) {
			query += 	" AND (SELECT COUNT(*) FROM documentfile WHERE objectId = user.id AND objectType = 'USER' AND fileType = 'SECURITY_PLEDGE') > 0";
		}
		
		if (isSystem) {
			query += 	" AND r.roleType NOT IN ('PROJECT_MANAGER', 'WORKER', 'SUPER_ADMIN')";
		} else {
			if (roleType != null && RoleTypeEnum.PROJECT_MANAGER.toString().equals(roleType)) {
				query += 	" AND (r.roleType = 'WORKER' OR (r.roleType = 'PROJECT_MANAGER' AND user.id = " + userId + "))";
			} else {
				query += 	" AND r.roleType IN ('PROJECT_MANAGER', 'WORKER')";
			}
		}
		
		if (roleIds != null && roleIds.size() > 0) {
			query += 	" AND user.role_id in " + roleIds.toString().replace("]", ")").replace("[", "(");
		} else {
			query +=    " AND user.id = 0";
		}
		
		if (keyword != null && StringUtils.isNotBlank(keyword.trim())) {
			query += 	" AND (user.fullName like '%" + keyword.trim().toLowerCase() + "%'"
						+ " OR user.email like '%" + keyword.trim().toLowerCase() + "%'"
						+ " OR user.department like '%" + keyword.trim().toLowerCase() + "%'"
						+ " OR com.companyName like '%" + keyword.trim().toLowerCase() + "%')";
		}	
		return query;
	}
		
	public boolean isExists(Long id) {
		if (id != null && id > 0) {
			return repo.exists(base.and(QUser.user.id.eq(id)));
		}
		return false;
	}
	
	public boolean checkExistsByIP(String externalIP, String internalIP) {
		if (externalIP != null && StringUtils.isNotBlank(externalIP.trim()) && internalIP != null && StringUtils.isNotBlank(internalIP.trim())) {
			return repo.exists(base.and((QUser.user.externalIPRequired.eq(true).and(QUser.user.externalIP.eq(externalIP)).and(QUser.user.internalIP.eq(internalIP)))
					.or(QUser.user.externalIPRequired.eq(false).and(QUser.user.internalIP.eq(internalIP)))));
		}
		return false;
	}

	public boolean checkExistsEmail(User body) {
		BooleanExpression predAll = base;
		if (!body.isNew()) {
			predAll = predAll.and(QUser.user.id.ne(body.getId()));
		}
		predAll = predAll.and(QUser.user.email.eq(body.getEmail()));
		return repo.exists(predAll);
	}
	
	public boolean checkExistsIP(User body) {
		BooleanExpression predAll = base;
		if (!body.isNew()) {
			predAll = predAll.and(QUser.user.id.ne(body.getId()));
		}
		if (body.isExternalIPRequired()) {
			predAll = predAll.and(QUser.user.externalIP.eq(body.getExternalIP()).and(QUser.user.internalIP.eq(body.getInternalIP())));
		} else {
			predAll = predAll.and(QUser.user.internalIP.eq(body.getInternalIP()));
		}
		
		return repo.exists(predAll);
	}
	
	public User getUserByIP(String internalIP, String externalIP) {
		BooleanExpression predAll = base;
		predAll = predAll.and((QUser.user.externalIPRequired.eq(true).and(QUser.user.externalIP.eq(externalIP)).and(QUser.user.internalIP.eq(internalIP)))
				.or(QUser.user.externalIPRequired.eq(false).and(QUser.user.internalIP.eq(internalIP))));
		return repo.findOne(predAll);
	}
	
	public User save(User obj, Long userId) {
		return Utils.save(repo, obj, userId);
	}
	
	public ResponseEntity<Object> doSave(User obj, Long userId, PersistentEntityResourceAssembler eass, HttpStatus status) {
		return Utils.doSave(repo, obj, userId, eass, status);		
	}

	public Predicate predicateFindByTenVaIds(String fullName, List<Long> Ids) {
		BooleanExpression predAll = base.and(QUser.user.id.in(Ids));
		if (fullName != null && StringUtils.isNotBlank(fullName.trim())) {
			predAll = predAll.and(QUser.user.fullName.containsIgnoreCase(fullName.trim())
					.or(QUser.user.email.containsIgnoreCase(fullName.trim())));
		}
		
		return predAll;
	}
	
	public Predicate predicateFindByTen(String fullName) {
		BooleanExpression predAll = base;
		if (fullName != null && StringUtils.isNotBlank(fullName.trim())) {
			predAll = predAll.and(QUser.user.fullName.containsIgnoreCase(fullName.trim())
					.or(QUser.user.email.containsIgnoreCase(fullName.trim())));
		}
		
		return predAll;
	}
	
	public User delete(Long id) {
		User user = repo.findOne(predicateFindOne(id));

		if (user != null) {
			user.setDeleted(true);
		}

		return user;
	}

	@Transactional
	public void bootstrapUsers() {
		List<User> list = (List<User>) repo.findAll(base);
		if (list.size() == 0) {			
			User user = new User();
			user.setEmail("admin@eazymation.com");
			user.updatePassword("abc@123");
			user.setFullName("SuperAdmin");
			user.setActive(true);
			user = repo.save(user);
			
			em.createNativeQuery("ALTER TABLE role_power MODIFY powers LONGTEXT;").executeUpdate();
			
			Long userId = user.getId();
			
			Set<String> superAdminPowers = new HashSet<>(Arrays.asList(
					"role:list,role:add,role:update,role:view,role:delete",
					"message:list,message:add,message:view,message:delete",
					"messagereceiver:list,messagereceiver:view,messagereceiver:delete",
					"securitycheck:list,securitycheck:add,securitycheck:update,securitycheck:view,securitycheck:delete",
					"securityviolation:list,securityviolation:add,securityviolation:update,securityviolation:view,securityviolation:delete",
					"employee:list,employee:add,employee:update,employee:view,employee:delete",
					"employer:list,employer:add,employer:update,employer:view,employer:delete",
					"project:list,project:add,project:update,project:view,project:delete",
					"company:list,company:add,company:update,company:view,company:delete",
					"help:list,help:add,help:update,help:view,help:delete",
					"setting:view,setting:update",
					"equipmentkind:list,equipmentkind:add,equipmentkind:update,equipmentkind:view,equipmentkind:delete",
					"product:list,product:add,product:update,product:view,product:delete,product:confirm",
					"securityeducation:list,securityeducation:add,securityeducation:update,securityeducation:view,securityeducation:confirmcompletion,securityeducation:registercompletion,securityeducation:confirmrequest",
					"equipment:list,equipment:view,equipment:confirmusage,equipment:confirmtermination,equipment:add,equipment:update,equipment:view,equipment:delete,equipment:requesttermination"
					));
			Role superAdmin = new Role("Super Admin", superAdminPowers, RoleTypeEnum.SUPER_ADMIN);
			roleService.save(superAdmin, userId);
			
			Set<String> projectAdminPowers = new HashSet<>(Arrays.asList(
					"role:list,role:add,role:update,role:view,role:delete",
					"message:list,message:add,message:view,message:delete",
					"messagereceiver:list,messagereceiver:view,messagereceiver:delete",
					"securitycheck:list,securitycheck:add,securitycheck:update,securitycheck:view,securitycheck:delete",
					"securityviolation:list,securityviolation:add,securityviolation:update,securityviolation:view,securityviolation:delete",
					"employee:list,employee:add,employee:update,employee:view,employee:delete",
					"project:list,project:add,project:update,project:view,project:delete",
					"company:list,company:add,company:update,company:view,company:delete",
					"help:list,help:view",
					"product:list,product:add,product:update,product:view,product:delete,product:confirm",
					"equipmentkind:list,equipmentkind:add,equipmentkind:update,equipmentkind:view,equipmentkind:delete",
					"securityeducation:list,securityeducation:add,securityeducation:update,securityeducation:view,securityeducation:confirmcompletion,securityeducation:registercompletion,securityeducation:confirmrequest",
					"equipment:list,equipment:view,equipment:confirmusage,equipment:confirmtermination"
					));
			Role businessPlanner = new Role("사업계획자", projectAdminPowers, RoleTypeEnum.PROJECT_ADMIN);
			roleService.save(businessPlanner, userId);
			
			Role businessManager = new Role("사업관리자", projectAdminPowers, RoleTypeEnum.PROJECT_ADMIN);
			roleService.save(businessManager, userId);
			
			Role businessPlannerManager = new Role("사업계획/관리자", projectAdminPowers, RoleTypeEnum.PROJECT_ADMIN);
			roleService.save(businessPlannerManager, userId);
			
			Set<String> securityOfficerPowers = new HashSet<>(Arrays.asList(
					"role:list,role:add,role:update,role:view,role:delete",
					"message:list,message:add,message:view,message:delete",
					"messagereceiver:list,messagereceiver:view,messagereceiver:delete",
					"securitycheck:list,securitycheck:add,securitycheck:update,securitycheck:view,securitycheck:delete",
					"securityviolation:list,securityviolation:add,securityviolation:update,securityviolation:view,securityviolation:delete",
					"employee:list,employee:ad,employee:update,employee:view,employee:delete",
					"employer:list,employer:add,employer:update,employer:view,employer:delete",
					"project:list,project:add,project:update,project:view,project:delete",
					"company:list,company:add,company:update,company:view,company:delete",
					"help:list,help:add,help:update,help:view,help:delete",
					"equipmentkind:list,equipmentkind:add,equipmentkind:update,equipmentkind:view,equipmentkind:delete",
					"setting:view,setting:update",
					"product:list,product:add,product:update,product:view,product:delete,product:confirm",
					"securityeducation:list,securityeducation:add,securityeducation:update,securityeducation:view,securityeducation:delete,securityeducation:confirmcompletion",
					"equipment:list,equipment:view,equipment:confirmusage,equipment:confirmtermination"
					));
			Role securityOfficer = new Role("보안담당자(부서별 대표)", securityOfficerPowers, RoleTypeEnum.SECURITY_MANAGER);
			roleService.save(securityOfficer, userId);
			
			Set<String> projectManagerPowers = new HashSet<>(Arrays.asList(
					"message:list,message:add,message:view,message:delete",
					"messagereceiver:list,messagereceiver:view,messagereceiver:delete",
					"employee:list,employee:add,employee:update,employee:view,employee:delete",
					"equipment:list,equipment:add,equipment:update,equipment:view,equipment:delete,equipment:requesttermination",
					"securityeducation:list,securityeducation:view,securityeducation:confirmrequest,securityeducation:registercompletion",
					"securityviolation:list,securityviolation:doaction,securityviolation:view",
					"product:list,product:view,product:register",
					"help:list,help:view"
					));
			Role projectManager = new Role("관리자", projectManagerPowers, RoleTypeEnum.PROJECT_MANAGER);
			roleService.save(projectManager, userId);
			
			Set<String> workerPowers = new HashSet<>(Arrays.asList(
					"message:list,message:add,message:view,message:delete",
					"messagereceiver:list,messagereceiver:view,messagereceiver:delete",
					"securityviolation:list,securityviolation:doaction,securityviolation:view",
					"help:list,help:view"
					));
			Role developer = new Role("개발자", workerPowers, RoleTypeEnum.WORKER);
			roleService.save(developer, userId);
			
			Role designer = new Role("디자이너", workerPowers, RoleTypeEnum.WORKER);
			roleService.save(designer, userId);
			
			Role planner = new Role("기획자", workerPowers, RoleTypeEnum.WORKER);
			roleService.save(planner, userId);
			
			Role publisher = new Role("퍼블리셔", workerPowers, RoleTypeEnum.WORKER);
			roleService.save(publisher, userId);
			
			Role sales = new Role("세일즈", workerPowers, RoleTypeEnum.WORKER);
			roleService.save(sales, userId);
			
			user.setRole_id(superAdmin.getId());
			user = repo.save(user);
		}
	}
	
	public boolean isValidEmailAddress(String email) {
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);
        return m.matches();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Map<String, Object>> getListProjectAdminForSelect(Long projectId, Long companyId, String keyword) {		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String query = "SELECT DISTINCT u.id AS userId, u.fullName, u.department, r.name AS roleName, u.email, u.contact"
					+ " FROM user AS u"
					+ " INNER JOIN role AS r ON r.id = u.role_id";
		if (companyId != null && companyId > 0) {
			query += " INNER JOIN project_admin AS pa ON u.id = pa.user_id"
				   + " INNER JOIN project AS p ON p.id = pa.project_id"
				   + " INNER JOIN contract AS c ON c.project_id = p.id";
		}
		query 	   += " WHERE u.deleted = FALSE AND r.roleType = 'PROJECT_ADMIN'";
		if (companyId != null && companyId > 0) {
			query += 	" AND c.deleted = FALSE";
		}
		if (projectId != null && projectId > 0) {
			query += 	" AND u.id NOT IN (SELECT user_id FROM project_admin WHERE project_id = " + projectId + ")";
		}
		if (companyId != null && companyId > 0) {
			query += " AND c.company_id = " + companyId;
		}
		if (keyword != null && StringUtils.isNotBlank(keyword.trim())) {
			query += 	" AND (u.fullName like '%" + keyword.trim().toLowerCase() + "%'"
						+ " OR u.email like '%" + keyword.trim().toLowerCase() + "%')";
		}
		List<Object[]> listObjPAs = (List<Object[]>) em.createNativeQuery(query).getResultList();
		if (listObjPAs != null) {
			for (Object[] obj : listObjPAs) {
				Map<String, Object> user = new HashMap<>();
				user.put("id", obj[0]);
				user.put("fullName", obj[1]);
				user.put("department", obj[2]);
				user.put("role", obj[3]);
				user.put("email", obj[4]);
				user.put("contact", obj[5]);
				list.add(user);
			}
		}
		return list;
	} 
	
	public String getKeyById(Long id) {
		String key = "";
		String query = "SELECT externalIP, internalIP FROM user WHERE deleted = FALSE AND id = " + id;
		Object[] listObj = (Object[]) em.createNativeQuery(query).getSingleResult();
		if (listObj != null) {
			key = listObj[0] + "/" + listObj[1];
		}
		return key;
	}
}
