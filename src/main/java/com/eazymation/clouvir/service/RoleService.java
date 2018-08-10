package com.eazymation.clouvir.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.eazymation.clouvir.enums.RoleTypeEnum;
import com.eazymation.clouvir.model.User;
import com.eazymation.clouvir.model.Role;
import com.eazymation.clouvir.repository.UserRepository;
import com.eazymation.clouvir.repository.RoleRepository;
import com.eazymation.clouvir.util.Utils;
import com.eazymation.clouvir.model.QRole;
import com.eazymation.clouvir.model.QUser;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;

@Component
public class RoleService {
	
	@Autowired
	private RoleRepository repo;
	
	@Autowired
	private EntityManager em;

	BooleanExpression base = QRole.role.deleted.eq(false);
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Role> findAllByNativeQuery(String keyword, int offset, int limit) {
		List<Role> list = new ArrayList<Role>();
		String query = "SELECT DISTINCT role.* FROM role as role";
		query += getQueryFindAll(keyword);		
		query +=	 " ORDER BY role.updatedDate DESC LIMIT " + limit + " OFFSET " + offset + ";";
		list = (List<Role>) em.createNativeQuery(query, Role.class).getResultList();
		return list;
	}
	
	@Transactional
	public int countAllByNativeQuery(String keyword) {
		int count = 0;
		String query = "SELECT COUNT(DISTINCT role.id) FROM role as role";
		query += getQueryFindAll(keyword);
		count = ((BigInteger) em.createNativeQuery(query).getSingleResult()).intValue();
		return count;
	}
	
	private String getQueryFindAll(String keyword) {
		String query = "";
		query += 	 " WHERE role.deleted = false";
		
		if (keyword != null && StringUtils.isNotBlank(keyword.trim())) {
			query += 	" AND role.name like '%" + keyword.trim().toLowerCase() + "%'";
		}		
		return query;
	}

	public Predicate predicateFindOne(Long id) {
		return base.and(QRole.role.id.eq(id));
	}
	
	public Role findOne(Long id) {
		return repo.findOne(predicateFindOne(id));
	}

	public boolean isExists(Long id) {
		if (id != null && id > 0) {
			Predicate predicate = base.and(QRole.role.id.eq(id));
			return repo.exists(predicate);
		}
		return false;
	}

	public Role delete(Long id) {
		Role role = repo.findOne(predicateFindOne(id));

		if (role != null) {
			role.setDeleted(true);
		}

		return role;
	}
	
	public List<Role> getListRoleForBusiness() {
		List<Role> list = new ArrayList<Role>();
		BooleanExpression predAll = base.and(QRole.role.roleType.eq(RoleTypeEnum.WORKER).or(QRole.role.roleType.eq(RoleTypeEnum.PROJECT_MANAGER)));
		list = (List<Role>) repo.findAll(predAll);
		return list;
	}
	
	public List<Role> getListRoleWorker() {
		List<Role> list = new ArrayList<Role>();
		BooleanExpression predAll = base.and(QRole.role.roleType.eq(RoleTypeEnum.WORKER));
		list = (List<Role>) repo.findAll(predAll);
		return list;
	}
	
	public List<Role> getListRoleForSystem() {
		List<Role> list = new ArrayList<Role>();
		BooleanExpression predAll = base.and(QRole.role.roleType.eq(RoleTypeEnum.SECURITY_MANAGER)
				.or(QRole.role.roleType.eq(RoleTypeEnum.PROJECT_ADMIN)));
		list = (List<Role>) repo.findAll(predAll);
		return list;
	}

	public boolean checkExistsData(Role body) {
		BooleanExpression predAll = base;

		if (!body.isNew()) {
			predAll = predAll.and(QRole.role.id.ne(body.getId()));
		}

		predAll = predAll.and(QRole.role.name.eq(body.getName()));
		predAll = predAll.and(QRole.role.roleType.eq(RoleTypeEnum.valueOf(body.getRoleType().toString())));
		List<Role> roles = (List<Role>) repo.findAll(predAll);

		return roles != null && roles.size() > 0 ? true : false;
	}

	public boolean checkUsedData(UserRepository userRepository, Long id) {
		List<User> userList = (List<User>) userRepository
				.findAll(QUser.user.deleted.eq(false).and(QUser.user.role_id.eq(id)));

		if (userList != null && userList.size() > 0) {
			return true;
		}

		return false;
	}
	
	public Role save(Role obj, Long userId) {
		return Utils.save(repo, obj, userId);
	}
	
	public ResponseEntity<Object> doSave(Role obj, Long userId, PersistentEntityResourceAssembler eass, HttpStatus status) {
		return Utils.doSave(repo, obj, userId, eass, status);		
	}

	public boolean initRoles(Long userId) {
		if (repo.count(base) == 0) {
			Set<String> superAdminPowers = new HashSet<>(Arrays.asList(
					"role:list", "role:add", "role:update", "role:view", "role:delete",
					"employee:list", "employee:add", "employee:update", "employee:view", "employee:delete",
					"employer:list", "employer:add", "employer:update", "employer:view", "employer:delete"
					));
			Role superAdmin = new Role("Super Admin", superAdminPowers, RoleTypeEnum.SUPER_ADMIN);
			save(superAdmin, userId);
			
			Set<String> projectAdminPowers = new HashSet<>(Arrays.asList(
					"role:list", "role:add", "role:update", "role:view", "role:delete",
					"message:list", "message:add", "message:view", "message:delete",
					"messagereceiver:list", "messagereceiver:view", "messagereceiver:delete",
					"securitycheck:list", "securitycheck:add", "securitycheck:update", "securitycheck:view", "securitycheck:delete",
					"securityviolation:list", "securityviolation:add", "securityviolation:update", "securityviolation:view", "securityviolation:delete",
					"employee:list", "employee:add", "employee:update", "employee:view", "employee:delete",
					"employer:list", "employer:add", "employer:update", "employer:view", "employer:delete",
					"project:list", "project:add", "project:update", "project:view", "project:delete",
					"company:list", "company:add", "company:update", "company:view", "company:delete",
					"help:list", "help:add", "help:update", "help:view", "help:delete",
					"product:list", "product:add", "product:update", "product:view", "product:delete", "product:confirm",
					"securityeducation:list", "securityeducation:update", "securityeducation:view", "securityeducation:confirmcompletion", "securityeducation:registercompletion", "securityeducation:confirmrequest",
					"equipment:list", "equipment:view", "equipment:confirmusage","equipment:confirmtermination"
					));
			Role businessPlanner = new Role("Business Planner", projectAdminPowers, RoleTypeEnum.PROJECT_ADMIN);
			save(businessPlanner, userId);
			
			Role businessManager = new Role("Business Manager", projectAdminPowers, RoleTypeEnum.PROJECT_ADMIN);
			save(businessManager, userId);
			
			Set<String> securityOfficerPowers = new HashSet<>(Arrays.asList(
					"role:list", "role:add", "role:update", "role:view", "role:delete",
					"message:list", "message:add", "message:view", "message:delete",
					"messagereceiver:list", "messagereceiver:view", "messagereceiver:delete",
					"securitycheck:list", "securitycheck:add", "securitycheck:update", "securitycheck:view", "securitycheck:delete",
					"securityviolation:list", "securityviolation:add", "securityviolation:update", "securityviolation:view", "securityviolation:delete",
					"employee:list", "employee:add", "employee:update", "employee:view", "employee:delete",
					"employer:list", "employer:add", "employer:update", "employer:view", "employer:delete",
					"project:list", "project:add", "project:update", "project:view", "project:delete",
					"company:list", "company:add", "company:update", "company:view", "company:delete",
					"help:list", "help:add", "help:update", "help:view", "help:delete",
					"product:list", "product:add", "product:update", "product:view", "product:delete", "product:confirm",
					"securityeducation:list", "securityeducation:add", "securityeducation:update", "securityeducation:view", "securityeducation:delete", "securityeducation:confirmcompletion",
					"equipment:list", "equipment:view", "equipment:confirmusage","equipment:confirmtermination"
					));
			Role securityOfficer = new Role("Security Manager", securityOfficerPowers, RoleTypeEnum.SECURITY_MANAGER);
			save(securityOfficer, userId);
			
			Set<String> projectManagerPowers = new HashSet<>(Arrays.asList(
					"message:list", "message:add", "message:view", "message:delete",
					"messagereceiver:list", "messagereceiver:view", "messagereceiver:delete",
					"employee:list", "employee:add", "employee:update", "employee:view", "employee:delete",
					"equipment:list", "equipment:add", "equipment:update", "equipment:view", "equipment:delete", "equipment:requesttermination",
					"securityeducation:list", "securityeducation:view", "securityeducation:confirmrequest", "securityeducation:registercompletion",
					"securityviolation:list", "securityviolation:doaction", "securityviolation:view",
					"product:list", "product:view", "product:register"
					));
			Role projectManager = new Role("Manager", projectManagerPowers, RoleTypeEnum.PROJECT_MANAGER);
			save(projectManager, userId);
			
			Set<String> workerPowers = new HashSet<>(Arrays.asList(
					"message:list", "message:add", "message:view", "message:delete",
					"messagereceiver:list", "messagereceiver:view", "messagereceiver:delete",
					"securityviolation:list", "securityviolation:doaction", "securityviolation:view"
					));
			Role developer = new Role("Developer", workerPowers, RoleTypeEnum.WORKER);
			save(developer, userId);
			
			Role designer = new Role("Designer", workerPowers, RoleTypeEnum.WORKER);
			save(designer, userId);
			
			Role planner = new Role("Planner", workerPowers, RoleTypeEnum.WORKER);
			save(planner, userId);
			
			Role publisher = new Role("Publisher", workerPowers, RoleTypeEnum.WORKER);
			save(publisher, userId);
			
			Role sales = new Role("Sales", workerPowers, RoleTypeEnum.WORKER);
			save(sales, userId);
			
			return true;
		}
		return false;
	}
}
