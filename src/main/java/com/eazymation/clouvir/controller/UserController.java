package com.eazymation.clouvir.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.hateoas.ResourceAssembler;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.eazymation.clouvir.enums.ApiErrorEnum;
import com.eazymation.clouvir.enums.FileTypeEnum;
import com.eazymation.clouvir.enums.InspectionTimeEnum;
import com.eazymation.clouvir.enums.PowerEnum;
import com.eazymation.clouvir.enums.RoleTypeEnum;
import com.eazymation.clouvir.model.User;
import com.eazymation.clouvir.model.medial.Medial_DocumentFileContract;
import com.eazymation.clouvir.model.medial.Medial_Employee_Put;
import com.eazymation.clouvir.model.medial.Medial_Employer;
import com.eazymation.clouvir.model.medial.Medial_Employer_Post;
import com.eazymation.clouvir.model.medial.Medial_Employer_Put;
import com.eazymation.clouvir.model.medial.Medial_Employee_Post;
import com.eazymation.clouvir.service.UserService;
import com.eazymation.clouvir.util.CSVUtils;
import com.eazymation.clouvir.util.ExcelUtil;
import com.eazymation.clouvir.util.Utils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import vn.greenglobal.core.model.common.BaseRepository;

@RestController
@RepositoryRestController
@Api(value = "users", description = "User")
public class UserController extends ClouvirController<User> {
	
	@Autowired
	private UserService userService;
				
	public UserController(BaseRepository<User, Long> repo) {
		super(repo);
	}

	@SuppressWarnings({ "unchecked", "rawtypes", "deprecation" })
	@RequestMapping(method = RequestMethod.GET, value = "/employees")
	@ApiOperation(value = "Get a list of employee", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Object getListEmployee(@RequestHeader(value = "Authorization", required = true) String authorization,
			Pageable pageable, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "roleId", required = false) List<Long> roleIds, 
			@RequestParam(value = "typeDate", required = false) String typeDate,
			@RequestParam(value = "dateTo", required = false) String dateTo,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "projectId", required = false) Long projectId,
			@RequestParam(value = "haveSecurityPledge", required = false) boolean haveSecurityPledge,
			@RequestParam(value = "companyId", required = false) Long companyId,
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
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.EMPLOYEE_LIST) == null
					&& Utils.powerValidate(profileUtil, authorization, PowerEnum.EMPLOYEE_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}			
			String roleType = profileUtil.getCommonProfile(authorization).getAttribute("roleType").toString();
//			Long paId = null;
			if (RoleTypeEnum.PROJECT_MANAGER.toString().equals(roleType) || RoleTypeEnum.WORKER.toString().equals(roleType)) {
				companyId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("companyId").toString());
			} 
//			else if (RoleTypeEnum.PROJECT_ADMIN.toString().equals(roleType)) {
//				paId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
//			}
			Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
			List<User> list = userService.findAllByNativeQuery(keyword, false, roleIds, typeDate, dateFrom, dateTo, 
					projectId, haveSecurityPledge, companyId, userId, roleType, pageable.getOffset(), pageable.getPageSize(), pageable.getSort());
			int total = userService.countAllByNativeQuery(keyword, false, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPledge, companyId, userId, roleType);
			return assembler.toResource(new PageImpl<User>(list, pageable, total), (ResourceAssembler) eass);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/employees/exportExcel")
	@ApiOperation(value = "Export file excel employee", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public void exportExcel(HttpServletResponse response,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "roleId", required = false) List<Long> roleIds, 
			@RequestParam(value = "typeDate", required = false) String typeDate,
			@RequestParam(value = "dateTo", required = false) String dateTo,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "projectId", required = false) Long projectId,
			@RequestParam(value = "haveSecurityPledge", required = false) boolean haveSecurityPledge,
			@RequestParam(value = "companyId", required = false) Long companyId,
			@RequestParam(value = "roleType", required = false) String roleType,
			@RequestParam(value = "userId", required = false) Long userId) throws IOException {
		try {
//			if (roleType != null && roleType.equals(RoleTypeEnum.PROJECT_ADMIN.toString())) {				
//			} else {
//				userId = null;
//			}
			List<Object[]> objList = userService.findAllByNativeQueryForExport(keyword, false, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPledge, companyId, userId, roleType, null);
			ExcelUtil.exportExcelListUser(response, "EmployeeList", "list", objList, "직원 명단", em);
		} catch (Exception e) {
			Utils.responseInternalServerErrors(e);
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/employees/exportCSV")
	@ApiOperation(value = "Export file excel employee", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public void exportCSV(HttpServletResponse response,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "roleId", required = false) List<Long> roleIds, 
			@RequestParam(value = "typeDate", required = false) String typeDate,
			@RequestParam(value = "dateTo", required = false) String dateTo,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "projectId", required = false) Long projectId,
			@RequestParam(value = "haveSecurityPledge", required = false) boolean haveSecurityPledge,
			@RequestParam(value = "companyId", required = false) Long companyId,
			@RequestParam(value = "roleType", required = false) String roleType,
			@RequestParam(value = "userId", required = false) Long userId) throws IOException {
		try {
			List<Object[]> objList = userService.findAllByNativeQueryForExportCSV(keyword, false, roleIds, typeDate, dateFrom, dateTo, projectId, haveSecurityPledge, companyId, userId, roleType, null);
			CSVUtils.exportListEmployee(response, objList, em);
		} catch (Exception e) {
			Utils.responseInternalServerErrors(e);
		}
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/employers/exportExcel")
	@ApiOperation(value = "Export file excel employer", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public void exportExcelEmployer(HttpServletResponse response,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "roleId", required = false) List<Long> roleIds, 
			@RequestParam(value = "typeDate", required = false) String typeDate,
			@RequestParam(value = "dateTo", required = false) String dateTo,
			@RequestParam(value = "dateFrom", required = false) String dateFrom) throws IOException {
		try {
			List<Object[]> objList = userService.findAllByNativeQueryForExportEmployer(keyword, true, roleIds, typeDate, dateFrom, dateTo, null, false, null, null, null);
			ExcelUtil.exportExcelListEmployer(response, "EmployerList", "list", objList, "내부직원 명단", em);
		} catch (Exception e) {
			Utils.responseInternalServerErrors(e);
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/employers/exportCSV")
	@ApiOperation(value = "Export file excel employer", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public void exportCSVEmployer(HttpServletResponse response,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "roleId", required = false) List<Long> roleIds, 
			@RequestParam(value = "typeDate", required = false) String typeDate,
			@RequestParam(value = "dateTo", required = false) String dateTo,
			@RequestParam(value = "dateFrom", required = false) String dateFrom) throws IOException {
		try {
			List<Object[]> objList = userService.findAllByNativeQueryForExportCSVEmployer(keyword, true, roleIds, typeDate, dateFrom, dateTo, null, false, null, null, null);
			CSVUtils.exportListEmployer(response, objList, em);
		} catch (Exception e) {
			Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.GET, value = "/employers")
	@ApiOperation(value = "Get a list of employer", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Object getListEmployer(@RequestHeader(value = "Authorization", required = true) String authorization,
			Pageable pageable, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "roleId", required = false) List<Long> roleIds, 
			@RequestParam(value = "typeDate", required = false) String typeDate,
			@RequestParam(value = "dateTo", required = false) String dateTo,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
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
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.EMPLOYER_LIST) == null
					&& Utils.powerValidate(profileUtil, authorization, PowerEnum.EMPLOYER_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}			
			List<User> list = userService.findAllByNativeQuery(keyword, true, roleIds, typeDate, dateFrom, dateTo, null, false, null, null, null,
					pageable.getOffset(), pageable.getPageSize(), pageable.getSort());
			int total = userService.countAllByNativeQuery(keyword, true, roleIds, typeDate, dateFrom, dateTo, null, false, null, null, null);
			return assembler.toResource(new PageImpl<User>(list, pageable, total), (ResourceAssembler) eass);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST, value = "/employees")
	@ApiOperation(value = "Add a new employee", position = 2, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Add new employee successful", response = User.class),
			@ApiResponse(code = 201, message = "Add new employee successful", response = User.class) })
	public ResponseEntity<Object> create(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestBody Medial_Employee_Post params, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYEE_ADD) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (params != null) {
				User user = params.getEmployee();
				if (user.getEmail() == null || user.getEmail().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_REQUIRED.name(),
							ApiErrorEnum.EMAIL_REQUIRED.getText(), ApiErrorEnum.EMAIL_REQUIRED.getText());
				}
				
				if (user.getEmail() != null
						&& !Utils.isValidEmailAddress(user.getEmail())) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_INVALID.name(),
							ApiErrorEnum.EMAIL_INVALID.getText(), ApiErrorEnum.EMAIL_INVALID.getText());
				}

				if (user.getFullName() == null && user.getFullName().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FULLNAME_REQUIRED.name(),
							ApiErrorEnum.FULLNAME_REQUIRED.getText(), ApiErrorEnum.FULLNAME_REQUIRED.getText());
				}

				if (StringUtils.isNotBlank(user.getEmail())
						&& userService.checkExistsEmail(user)) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_EXISTS.name(),
							ApiErrorEnum.EMAIL_EXISTS.getText(), ApiErrorEnum.EMAIL_EXISTS.getText());
				}
				
				if (user.getInternalIP() == null || user.getInternalIP().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.INTERNAL_IP_REQUIRED.name(),
							ApiErrorEnum.INTERNAL_IP_REQUIRED.getText(), ApiErrorEnum.INTERNAL_IP_REQUIRED.getText());
				}
				
				if (user.isExternalIPRequired()) {
					if (user.getExternalIP() == null || user.getExternalIP().isEmpty()) {
						return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EXTERNAL_IP_REQUIRED.name(),
								ApiErrorEnum.EXTERNAL_IP_REQUIRED.getText(), ApiErrorEnum.EXTERNAL_IP_REQUIRED.getText());
					}
				}
				
				if (userService.checkExistsIP(user)) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.IP_EXISTS.name(),
							ApiErrorEnum.IP_EXISTS.getText(), ApiErrorEnum.IP_EXISTS.getText());
				}		
				
				return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
					@SuppressWarnings("deprecation")
					@Override
					public Object doInTransaction(TransactionStatus arg0) {
						Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
						//Save a new user
						user.setActive(true);
						user.updatePassword("11111111");
						User userNew = userService.save(user, userId);
						//Save new documents
						
						return new ResponseEntity<>(eass.toFullResource(userNew), HttpStatus.CREATED);
						
					}
				});
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(value = "/employees/import", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public ResponseEntity<?> importEmployee(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestPart(value = "file", required = true) MultipartFile file, HttpServletRequest req)
			throws IOException {
		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYEE_ADD) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (!file.isEmpty()) {
				if (file.getOriginalFilename().endsWith(".csv")) { 
					InputStream is = null;
					BufferedReader reader = null; 
					try { 
						 is = new ByteArrayInputStream(file.getBytes()); 
					} catch (Exception e) { 
						
					}
					  
					reader = new BufferedReader(new InputStreamReader(is)); 
					String line = reader.readLine(); 
					String arrTitle[] = line.split(",");
					if (arrTitle.length != 9 || !arrTitle[0].equals("Name") || !arrTitle[1].equals("Contact") || !arrTitle[2].equals("Email")
							 || !arrTitle[3].equals("Agency") || !arrTitle[4].equals("Department") || !arrTitle[5].equals("Role")
							 || !arrTitle[6].equals("Reference description") || !arrTitle[7].equals("Internal IP") || !arrTitle[8].equals("External IP")) {
						return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FILE_IMPORT_INCORRECT.name(),
								ApiErrorEnum.FILE_IMPORT_INCORRECT.getText(), ApiErrorEnum.FILE_IMPORT_INCORRECT.getText());
					}
					line = reader.readLine(); 
					List<User> listUserToAdd = new ArrayList<User>();
					while(line != null){
						String arr[] = line.split(",");
						int countField = StringUtils.countMatches(line, ",");
						if (countField == 8) { 
							String email = arr[2];
							if (email != null && Utils.isValidEmailAddress(email)) {
								String queryExistsEmail = "SELECT COUNT(*) FROM user WHERE deleted = FALSE AND email = '" + email + "'";								
								Long countExistsEmail = ((BigInteger) em.createNativeQuery(queryExistsEmail).getSingleResult()).longValue();
								if (countExistsEmail == null || countExistsEmail < 1) {
									String queryCompanyId = "SELECT id FROM company WHERE deleted = FALSE AND companyName = '" + arr[3] + "'";
									Long companyId = null;
									try {
										companyId = ((BigInteger) em.createNativeQuery(queryCompanyId).getSingleResult()).longValue();
									} catch (NoResultException e) {
										
									}
									if (companyId != null && companyId > 0) {
										String queryRoleId = "SELECT id FROM role WHERE deleted = FALSE AND name = '" + arr[5] + "'";
										Long roleId = null;
										try {
											roleId = ((BigInteger) em.createNativeQuery(queryRoleId).getSingleResult()).longValue();
										} catch (NoResultException e) {
											
										}
										if (roleId != null && roleId > 0) {
											User user = new User(arr[0], arr[1], email, companyId, arr[4], roleId, arr[6], arr[7], arr.length == 8 ? "" : arr[8]);
											if (user.getExternalIP() == null || user.getExternalIP().isEmpty()) {
												user.setExternalIPRequired(false);
											} else {
												user.setExternalIPRequired(true);
											}
											if (user.getInternalIP() != null && !user.getInternalIP().isEmpty()) {
												if (userService.checkExistsIP(user)) {
													return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.IP_EXISTS.name(),
															ApiErrorEnum.IP_EXISTS.getText(), 
															user.isExternalIPRequired() ? user.getExternalIP() + "/" + user.getInternalIP() : user.getInternalIP());
												} else {
													user.updatePassword("11111111");
													listUserToAdd.add(user);
												}
											}											
										} else {
											return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.ROLE_NOT_EXISTS.name(),
													ApiErrorEnum.ROLE_NOT_EXISTS.getText(), arr[5]);
										}
									} else {
										return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.COMPANY_NOT_EXISTS.name(),
												ApiErrorEnum.COMPANY_NOT_EXISTS.getText(), arr[3]);
									}
								} else {
									return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_EXISTS.name(),
											ApiErrorEnum.EMAIL_EXISTS.getText(), email);
								}								
							} else {
								return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_INVALID.name(),
										ApiErrorEnum.EMAIL_INVALID.getText(), email);
							}
						}
						line = reader.readLine();
					}
					Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
					for (User user : listUserToAdd) {
						if (!userService.checkExistsEmail(user)) {
							userService.save(user, userId);
						}
					}
				}
				
				return new ResponseEntity<>(new HttpHeaders(), HttpStatus.OK);
			}
			return new ResponseEntity<>(new HttpHeaders(), HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(value = "/employers/import", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public ResponseEntity<?> importEmployer(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestPart(value = "file", required = true) MultipartFile file, HttpServletRequest req)
			throws IOException {
		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYER_ADD) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (!file.isEmpty()) {
				if (file.getOriginalFilename().endsWith(".csv")) { 
					InputStream is = null;
					BufferedReader reader = null; 
					try { 
						 is = new ByteArrayInputStream(file.getBytes()); 
					} catch (Exception e) { 
						
					}
					  
					reader = new BufferedReader(new InputStreamReader(is)); 
					String line = reader.readLine(); 
					String arrTitle[] = line.split(",");
					if (arrTitle.length != 6 || !arrTitle[0].equals("Name") || !arrTitle[1].equals("Email") || !arrTitle[2].equals("Contact")
							 || !arrTitle[3].equals("Department") || !arrTitle[4].equals("Role")
							 || !arrTitle[5].equals("Reference description")) {
						return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FILE_IMPORT_INCORRECT.name(),
								ApiErrorEnum.FILE_IMPORT_INCORRECT.getText(), ApiErrorEnum.FILE_IMPORT_INCORRECT.getText());
					}
					line = reader.readLine(); 
					List<User> listUserToAdd = new ArrayList<User>();
					while(line != null){
						String arr[] = line.split(",");
						int countField = StringUtils.countMatches(line, ",");
						if (countField == 5) { 
							String email = arr[1];
							if (email != null && Utils.isValidEmailAddress(email)) {
								String queryExistsEmail = "SELECT COUNT(*) FROM user WHERE deleted = FALSE AND email = '" + email + "'";								
								Long countExistsEmail = ((BigInteger) em.createNativeQuery(queryExistsEmail).getSingleResult()).longValue();
								if (countExistsEmail == null || countExistsEmail < 1) {
									String queryRoleId = "SELECT id FROM role WHERE deleted = FALSE AND name = '" + arr[4] + "'";
									Long roleId = null;
									try {
										roleId = ((BigInteger) em.createNativeQuery(queryRoleId).getSingleResult()).longValue();
									} catch (NoResultException e) {
										
									}
									if (roleId != null && roleId > 0) {
										User user = new User(arr[0], email, arr[2], arr[3], roleId, arr.length == 5 ? "" : arr[5]);
										user.updatePassword("11111111");
										listUserToAdd.add(user);
									} else {
										return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.ROLE_NOT_EXISTS.name(),
												ApiErrorEnum.ROLE_NOT_EXISTS.getText(), arr[4]);
									}
								} else {
									return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_EXISTS.name(),
											ApiErrorEnum.EMAIL_EXISTS.getText(), email);
								}								
							} else {
								return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_INVALID.name(),
										ApiErrorEnum.EMAIL_INVALID.getText(), email);
							}
						}
						line = reader.readLine();
					}
					Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
					for (User user : listUserToAdd) {
						if (!userService.checkExistsEmail(user)) {
							userService.save(user, userId);
						}
					}
				}
				
				return new ResponseEntity<>(new HttpHeaders(), HttpStatus.OK);
			}
			return new ResponseEntity<>(new HttpHeaders(), HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST, value = "/employers")
	@ApiOperation(value = "Add a new employer", position = 2, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Add new employer successful", response = User.class),
			@ApiResponse(code = 201, message = "Add new employer successful", response = User.class) })
	public ResponseEntity<Object> createEmployer(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestBody Medial_Employer_Post params, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYER_ADD) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			
			if (params != null) {
				Medial_Employer me = params.getEmployer();
				User user = new User();
				user.setRole_id(me.getRole_id());
				user.setFullName(me.getFullName());
				user.setEmail(me.getEmail());
				user.setContact(me.getContact());
				user.setDepartment(me.getDepartment());
				user.setReferenceDescription(me.getReferenceDescription());
				if (user.getEmail() == null | user.getEmail().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_REQUIRED.name(),
							ApiErrorEnum.EMAIL_REQUIRED.getText(), ApiErrorEnum.EMAIL_REQUIRED.getText());
				}

				if (user.getEmail() != null
						&& !Utils.isValidEmailAddress(user.getEmail())) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_INVALID.name(),
							ApiErrorEnum.EMAIL_INVALID.getText(), ApiErrorEnum.EMAIL_INVALID.getText());
				}

				if (user.getFullName() == null && user.getFullName().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FULLNAME_REQUIRED.name(),
							ApiErrorEnum.FULLNAME_REQUIRED.getText(), ApiErrorEnum.FULLNAME_REQUIRED.getText());
				}

				if (StringUtils.isNotBlank(user.getEmail())
						&& userService.checkExistsEmail(user)) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_EXISTS.name(),
							ApiErrorEnum.EMAIL_EXISTS.getText(), ApiErrorEnum.EMAIL_EXISTS.getText());
				}
				
				return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
					@SuppressWarnings("deprecation")
					@Override
					public Object doInTransaction(TransactionStatus arg0) {
						Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
						//Save a new employer
						user.setActive(true);
						user.updatePassword("11111111");
						User userNew = userService.save(user, userId);									
						return new ResponseEntity<>(eass.toFullResource(userNew), HttpStatus.CREATED);
						
					}
				});
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/employees/{id}")
	@ApiOperation(value = "Get a employee by id", position = 3, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Get a employee by id successful", response = User.class) })
	public ResponseEntity<Object> getEmployeeById(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") long id, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYEE_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			User user = userService.findOne(id);
			if (user == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(eass.toFullResource(user), HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/employers/{id}")
	@ApiOperation(value = "Get a employer by id", position = 3, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Get a employer by id successful", response = User.class) })
	public ResponseEntity<Object> getEmployerById(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") long id, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYER_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			User user = userService.findOne(id);
			if (user == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(eass.toFullResource(user), HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.PUT, value = "/employees/{id}")
	@ApiOperation(value = "Update a employee", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Update a employee successful", response = User.class) })
	public @ResponseBody ResponseEntity<Object> update(
			@RequestHeader(value = "Authorization", required = true) String authorization, @PathVariable("id") long id,
			@RequestBody Medial_Employee_Put params, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYEE_UPDATE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			
			if (params != null) {
				User user = params.getEmployee();				
				user.setId(id);
				
				if (user.getEmail() == null || user.getEmail().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_REQUIRED.name(),
							ApiErrorEnum.EMAIL_REQUIRED.getText(), ApiErrorEnum.EMAIL_REQUIRED.getText());
				}
				
				if (user.getEmail() != null
						&& !Utils.isValidEmailAddress(user.getEmail())) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_INVALID.name(),
							ApiErrorEnum.EMAIL_INVALID.getText(), ApiErrorEnum.EMAIL_INVALID.getText());
				}
				
				if (StringUtils.isNotBlank(user.getEmail())
						&& userService.checkExistsEmail(user)) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_EXISTS.name(),
							ApiErrorEnum.EMAIL_EXISTS.getText(), ApiErrorEnum.EMAIL_EXISTS.getText());
				}
				
				if (user.getInternalIP() == null || user.getInternalIP().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.INTERNAL_IP_REQUIRED.name(),
							ApiErrorEnum.INTERNAL_IP_REQUIRED.getText(), ApiErrorEnum.INTERNAL_IP_REQUIRED.getText());
				}
				
				if (user.isExternalIPRequired()) {
					if (user.getExternalIP() == null || user.getExternalIP().isEmpty()) {
						return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EXTERNAL_IP_REQUIRED.name(),
								ApiErrorEnum.EXTERNAL_IP_REQUIRED.getText(), ApiErrorEnum.EXTERNAL_IP_REQUIRED.getText());
					}
				}
				
				if (userService.checkExistsIP(user)) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.IP_EXISTS.name(),
							ApiErrorEnum.IP_EXISTS.getText(), ApiErrorEnum.IP_EXISTS.getText());
				}

				if (user.getFullName() == null && user.getFullName().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FULLNAME_REQUIRED.name(),
							ApiErrorEnum.FULLNAME_REQUIRED.getText(), ApiErrorEnum.FULLNAME_REQUIRED.getText());
				}

				if (!userService.isExists(id)) {
					return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
							ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
				}
				
				
				return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
					@SuppressWarnings("deprecation")
					@Override
					public Object doInTransaction(TransactionStatus arg0) {
						Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
						//Get old
						User old = userService.findOne(id);
						
						
						//Save exists user	
						user.setPassword(old.getPassword());
						user.setSalkey(old.getSalkey());
						user.setActive(true);
						user.setRecentSignIn(old.getRecentSignIn());
						
						User userOld = userService.save(user, userId);						
						//Save new documents						
						return new ResponseEntity<>(eass.toFullResource(userOld), HttpStatus.OK);
					}
				});
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.PUT, value = "/employers/{id}")
	@ApiOperation(value = "Update a employer", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Update a employer successful", response = User.class) })
	public @ResponseBody ResponseEntity<Object> updateEmployer(
			@RequestHeader(value = "Authorization", required = true) String authorization, @PathVariable("id") long id,
			@RequestBody Medial_Employer_Put params, PersistentEntityResourceAssembler eass) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYER_UPDATE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			
			if (params != null) {
				Medial_Employer me = params.getEmployer();
				User user = new User();				
				user.setId(id);
				user.setRole_id(me.getRole_id());
				user.setFullName(me.getFullName());
				user.setContact(me.getContact());
				user.setEmail(me.getEmail());
				user.setDepartment(me.getDepartment());
				user.setReferenceDescription(me.getReferenceDescription());
				if (user.getEmail() != null
						&& !Utils.isValidEmailAddress(user.getEmail())) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_INVALID.name(),
							ApiErrorEnum.EMAIL_INVALID.getText(), ApiErrorEnum.EMAIL_INVALID.getText());
				}
				
				if (StringUtils.isNotBlank(user.getEmail())
						&& userService.checkExistsEmail(user)) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.EMAIL_EXISTS.name(),
							ApiErrorEnum.EMAIL_EXISTS.getText(), ApiErrorEnum.EMAIL_EXISTS.getText());
				}

				if (user.getFullName() == null && user.getFullName().isEmpty()) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FULLNAME_REQUIRED.name(),
							ApiErrorEnum.FULLNAME_REQUIRED.getText(), ApiErrorEnum.FULLNAME_REQUIRED.getText());
				}

				if (!userService.isExists(id)) {
					return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
							ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
				}
				
				return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
					@SuppressWarnings("deprecation")
					@Override
					public Object doInTransaction(TransactionStatus arg0) {
						Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
						User old = userService.findOne(id);
						
						//Save exists user
						user.setPassword(old.getPassword());
						user.setSalkey(old.getSalkey());
						user.setActive(true);
						user.setRecentSignIn(old.getRecentSignIn());
						User userOld = userService.save(user, userId);
						
						return new ResponseEntity<>(eass.toFullResource(userOld), HttpStatus.OK);
					}
				});
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.PUT, value = "/employees/{id}/resetPassword")
	@ApiOperation(value = "Reset password of employee", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Reset password of employee successful", response = User.class) })
	public @ResponseBody ResponseEntity<Object> resetPassword(
			@RequestHeader(value = "Authorization", required = true) String authorization, @PathVariable("id") long id) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYEE_UPDATE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
				@SuppressWarnings("deprecation")
				@Override
				public Object doInTransaction(TransactionStatus arg0) {
					Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
					//Get old
					User user = userService.findOne(id);
					user.updatePassword("11111111");
					userService.save(user, userId);
					return new ResponseEntity<>(HttpStatus.OK);
				}
			});
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.PUT, value = "/employers/{id}/resetPassword")
	@ApiOperation(value = "Reset password of employer", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Reset password of employee successful", response = User.class) })
	public @ResponseBody ResponseEntity<Object> resetPasswordEmployer(
			@RequestHeader(value = "Authorization", required = true) String authorization, @PathVariable("id") long id) {

		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYER_UPDATE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
				@SuppressWarnings("deprecation")
				@Override
				public Object doInTransaction(TransactionStatus arg0) {
					Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
					//Get old
					User user = userService.findOne(id);
					user.updatePassword("11111111");
					userService.save(user, userId);
					return new ResponseEntity<>(HttpStatus.OK);
				}
			});
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.DELETE, value = "/employees/{id}")
	@ApiOperation(value = "Delete a employee", position = 5, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 204, message = "Delete a employee successful") })
	public ResponseEntity<Object> delete(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") Long id) {
		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYEE_DELETE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (id.equals(1L)) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ADMIN_FORBIDDEN.name(),
						ApiErrorEnum.ADMIN_FORBIDDEN.getText(), ApiErrorEnum.ADMIN_FORBIDDEN.getText());
			}
			Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
			
			if (userId.equals(id) || userId == id) {
				return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.DATA_INVALID.name(),
						ApiErrorEnum.DATA_INVALID.getText(), ApiErrorEnum.DATA_INVALID.getText());
			}

			User user = userService.delete(id);
			if (user == null) {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
						ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
			}
			
			user = userService.save(user, userId);
						
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.DELETE, value = "/employers/{id}")
	@ApiOperation(value = "Delete a employer", position = 5, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 204, message = "Delete a employer successful") })
	public ResponseEntity<Object> deleteEmployer(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") Long id) {
		try {
			Map<String, Object> map = Utils.invalidToken(profileUtil, authorization);
			User tokenUser = null;
			if (map != null) {
				if ("OK".equals(map.get("status").toString())) {
					tokenUser = (User) map.get("value");
				} else if ("ERROR".equals(map.get("status").toString())) {
					return (ResponseEntity<Object>) map.get("value");
				}
			} else {
				return Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
						ApiErrorEnum.TOKEN_TIME_EXPIRED.getText(), ApiErrorEnum.TOKEN_TIME_EXPIRED.getText());
			}
			if (Utils.powerValidate(tokenUser, PowerEnum.EMPLOYER_DELETE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (id.equals(1L)) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ADMIN_FORBIDDEN.name(),
						ApiErrorEnum.ADMIN_FORBIDDEN.getText(), ApiErrorEnum.ADMIN_FORBIDDEN.getText());
			}

			User user = userService.delete(id);
			if (user == null) {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
						ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
			}
			Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
			userService.save(user, Long.valueOf(userId));
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/users/projectAdminSelect")
	@ApiOperation(value = "Get list of company for select", position = 11, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody ResponseEntity<Object> getParticipatingCompaniesForSelect(
			@RequestHeader(value = "Authorization", required = true) String authorization, 
			@RequestParam(value = "projectId", required = false) Long projectId,
			@RequestParam(value = "companyId", required = false) Long companyId,
			@RequestParam(value = "keyword", required = false) String keyword) {
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

		list = userService.getListProjectAdminForSelect(projectId, companyId, keyword);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
}
