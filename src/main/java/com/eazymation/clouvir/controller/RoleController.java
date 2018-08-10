package com.eazymation.clouvir.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.hateoas.ResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.eazymation.clouvir.enums.ApiErrorEnum;
import com.eazymation.clouvir.enums.PowerEnum;
import com.eazymation.clouvir.model.Role;
import com.eazymation.clouvir.repository.UserRepository;
import com.eazymation.clouvir.service.RoleService;
import com.eazymation.clouvir.util.Utils;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import vn.greenglobal.core.model.common.BaseRepository;

@RestController
@RepositoryRestController
@Api(value = "roles", description = "Roles")
public class RoleController extends ClouvirController<Role> {

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserRepository userRepository;	
	
	public RoleController(BaseRepository<Role, Long> repo) {
		super(repo);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.GET, value = "/roles")
	@ApiOperation(value = "Get a list of role", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Object getList(@RequestHeader(value = "Authorization", required = true) String authorization,
			Pageable pageable, @RequestParam(value = "keyword", required = false) String keyword,
			PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
				if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.ROLE_LIST) == null
					&& Utils.powerValidate(profileUtil, authorization, PowerEnum.ROLE_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			List<Role> list = roleService.findAllByNativeQuery(keyword, pageable.getOffset(), pageable.getPageSize());
			int total = roleService.countAllByNativeQuery(keyword);
			return assembler.toResource(new PageImpl<Role>(list, pageable, total), (ResourceAssembler) eass);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.POST, value = "/roles")
	@ApiOperation(value = "Add a new role", position = 2, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Add new role successful", response = Role.class),
			@ApiResponse(code = 201, message = "Add new role successful", response = Role.class) })
	public ResponseEntity<Object> create(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestBody Role role, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
				if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.ROLE_ADD) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			if (StringUtils.isNotBlank(role.getName()) && roleService.checkExistsData(role)) {
				return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.NAME_EXISTS.name(),
						ApiErrorEnum.DATA_EXISTS.getText(), ApiErrorEnum.NAME_EXISTS.getText());
			}
			
			return roleService.doSave(role,
					Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()), eass,
					HttpStatus.CREATED);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/roles/{id}")
	@ApiOperation(value = "Get a role by id", position = 3, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Get the role successful", response = Role.class) })
	public ResponseEntity<Object> getById(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") long id, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
				if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.ROLE_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			Role role = roleService.findOne(id);
			if (role == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(eass.toFullResource(role), HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.PUT, value = "/roles/{id}")
	@ApiOperation(value = "Update the role", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Update the role successful", response = Role.class) })
	public @ResponseBody ResponseEntity<Object> update(
			@RequestHeader(value = "Authorization", required = true) String authorization, @PathVariable("id") long id,
			@RequestBody Role role, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
			if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.ROLE_UPDATE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			role.setId(id);
			if (StringUtils.isNotBlank(role.getName()) && roleService.checkExistsData(role)) {
				return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.NAME_EXISTS.name(),
						ApiErrorEnum.DATA_EXISTS.getText(), ApiErrorEnum.NAME_EXISTS.getText());
			}

			if (!roleService.isExists(id)) {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
						ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
			}
			return roleService.doSave(role,
					Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()), eass,
					HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.DELETE, value = "/roles/{id}")
	@ApiOperation(value = "Delete a role", position = 5, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 204, message = "Delete the role successful") })
	public ResponseEntity<Object> delete(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") Long id) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
				if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.ROLE_DELETE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			if (roleService.checkUsedData(userRepository, id)) {
				return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.DATA_USED.name(),
						ApiErrorEnum.DATA_USED.getText(), ApiErrorEnum.DATA_USED.getText());
			}

			Role role = roleService.delete(id);
			if (role == null) {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
						ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
			}

			roleService.save(role,
					Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()));
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings({"unchecked" })
	@RequestMapping(method = RequestMethod.GET, value = "/roles/business")
	@ApiOperation(value = "Get list of role for business", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getRolesForBusiness(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
		if (map != null) {
			if ("ERROR".equals(map.get("status").toString())) {
				return (ResponseEntity<Object>) map.get("value");
			}
		} else {
			return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
					ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
		}
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = null;
		
//		String roleType = profileUtil.getCommonProfile(authorization).getAttribute("roleType").toString();
		
//		if (roleType.equals(RoleTypeEnum.PROJECT_MANAGER.toString())) {
//			for (Role role : roleService.getListRoleWorker()) {
//				object = new HashMap<>();
//				object.put("roleName", role.getName());
//				object.put("type", role.getRoleType().toString());
//				object.put("roleId", role.getId());
//				list.add(object);
//			}
//		} else {
			for (Role role : roleService.getListRoleForBusiness()) {
				object = new HashMap<>();
				object.put("roleName", role.getName());
				object.put("type", role.getRoleType().toString());
				object.put("roleId", role.getId());
				list.add(object);
			}
//		}						
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/roles/system")
	@ApiOperation(value = "Get list of role for business", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getRolesForSystem(
			@RequestHeader(value = "Authorization", required = true) String authorization) {
		Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
		if (map != null) {
			if ("ERROR".equals(map.get("status").toString())) {
				return (ResponseEntity<Object>) map.get("value");
			}
		} else {
			return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
					ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
		}
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> object = null;

		for (Role role : roleService.getListRoleForSystem()) {
			object = new HashMap<>();
			object.put("roleName", role.getName());
			object.put("type", role.getRoleType().toString());
			object.put("roleId", role.getId());
			list.add(object);
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.POST, value = "/roles/init")
	@ApiOperation(value = "Init roles", position = 2, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Init roles successful", response = Role.class),
			@ApiResponse(code = 201, message = "Init roles successful", response = Role.class) })
	public ResponseEntity<Object> createMaTranAuto(@RequestHeader(value = "Authorization", required = true) String authorization) {
		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			if (map != null) {
				if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.ROLE_ADD) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (roleService.initRoles(Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()))) {
				return new ResponseEntity<>(HttpStatus.OK);
			}			
			return new ResponseEntity<>(HttpStatus.NOT_MODIFIED);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
}
