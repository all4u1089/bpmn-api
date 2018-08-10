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
import com.eazymation.clouvir.enums.PowerEnum;
import com.eazymation.clouvir.model.Help;
import com.eazymation.clouvir.model.medial.Medial_Help_Put;
import com.eazymation.clouvir.model.medial.Medial_Help_Post;
import com.eazymation.clouvir.service.HelpService;
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
@Api(value = "helps", description = "Helps")
public class HelpController extends ClouvirController<Help>{
	@Autowired
	private HelpService helpService;
	public HelpController(BaseRepository<Help, Long> repo) {
		super(repo);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.GET, value = "/helps")
	@ApiOperation(value = "Get a list of help", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Object getList(@RequestHeader(value = "Authorization", required = true) String authorization,
			Pageable pageable, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "dateTo", required = false) String dateTo,
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
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.HELP_LIST) == null
					&& Utils.powerValidate(profileUtil, authorization, PowerEnum.HELP_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			List<Help> list = helpService.findAllByNativeQuery(keyword, dateFrom, dateTo, pageable.getOffset(), pageable.getPageSize(), pageable.getSort());
			int total = helpService.countAllByNativeQuery(keyword, dateFrom, dateTo);
			return assembler.toResource(new PageImpl<Help>(list, pageable, total), (ResourceAssembler) eass);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/helps/exportExcel")
	@ApiOperation(value = "Export file excel help", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public void exportExcel(HttpServletResponse response,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "dateTo", required = false) String dateTo) throws IOException {
		try {
			List<Object[]> objList = helpService.findAllByNativeQueryForExport(keyword, dateFrom, dateTo, null);
			ExcelUtil.exportExcelListHelp(response, "HelpList", "list", objList, "도움말 목록", em);
		} catch (Exception e) {
			Utils.responseInternalServerErrors(e);
		}
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/helps/exportCSV")
	@ApiOperation(value = "Export file excel help", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public void exportCSV(HttpServletResponse response,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "dateTo", required = false) String dateTo) throws IOException {
		try {
			List<Object[]> objList = helpService.findAllByNativeQueryForExportCSV(keyword, dateFrom, dateTo, null);
			System.out.println("csv: " + objList.size());
			CSVUtils.exportListHelp(response, objList, em);
		} catch (Exception e) {
			Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.POST, value = "/helps")
	@ApiOperation(value = "Add a new help", position = 2, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Add new help successful", response = Help.class),
			@ApiResponse(code = 201, message = "Add new help successful", response = Help.class) })
	public ResponseEntity<Object> create(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestBody Medial_Help_Post params, PersistentEntityResourceAssembler eass) {
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
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.HELP_ADD) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			if (params != null) {
				
				if (StringUtils.isNotBlank(params.getHelp().getTitle()) && helpService.checkExistsData(params.getHelp())) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.TITLE_EXISTS.name(),
							ApiErrorEnum.DATA_EXISTS.getText(), ApiErrorEnum.TITLE_EXISTS.getText());
				}
				
				return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
					@Override
					public Object doInTransaction(TransactionStatus arg0) {
						Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
						//Save a new help
						Help help = helpService.save(params.getHelp(), userId);				
						return new ResponseEntity<>(eass.toFullResource(help), HttpStatus.CREATED);
					}
				});
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(value = "/helps/import", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public ResponseEntity<?> importEmployer(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestPart(value = "file", required = true) MultipartFile file, HttpServletRequest req)
			throws IOException {
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
					if (arrTitle.length != 2 || !arrTitle[0].equals("Title") || !arrTitle[1].equals("Contents")) {
						return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FILE_IMPORT_INCORRECT.name(),
								ApiErrorEnum.FILE_IMPORT_INCORRECT.getText(), ApiErrorEnum.FILE_IMPORT_INCORRECT.getText());
					}
					line = reader.readLine(); 
					List<Help> listHelpToAdd = new ArrayList<Help>();
					while(line != null){
						List<String> arr = Utils.parseLine(line);
						if (arr.size() == 2) { 
							String queryExistsTitle = "SELECT COUNT(*) FROM help WHERE deleted = FALSE AND title = '" + arr.get(0) + "'";								
							Long countExistsTitle = ((BigInteger) em.createNativeQuery(queryExistsTitle).getSingleResult()).longValue();
							if (countExistsTitle == null || countExistsTitle < 1) {
								Help help = new Help(arr.get(0), arr.get(1));
								listHelpToAdd.add(help);
							} else {
								return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.TITLE_EXISTS.name(),
										ApiErrorEnum.TITLE_EXISTS.getText(), arr.get(0));
							}	
						}
						line = reader.readLine();
					}
					Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
					for (Help help : listHelpToAdd) {
						if (!helpService.checkExistsData(help)) {
							helpService.save(help, userId);
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/helps/{id}")
	@ApiOperation(value = "Get a help by id", position = 3, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Get the help successful", response = Help.class) })
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
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.HELP_VIEW) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}
			Help help = helpService.findOne(id);
			if (help == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(eass.toFullResource(help), HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@RequestMapping(method = RequestMethod.DELETE, value = "/helps/{id}")
	@ApiOperation(value = "Delete a help", position = 5, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 204, message = "Delete the help successful") })
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
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.HELP_DELETE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			Help help = helpService.delete(id);
			if (help == null) {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
						ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
			}
			helpService.save(help,
					Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()));
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.PUT, value = "/helps/{id}")
	@ApiOperation(value = "Update the help", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Update the help successful", response = Help.class) })
	public @ResponseBody ResponseEntity<Object> update(
			@RequestHeader(value = "Authorization", required = true) String authorization, @PathVariable("id") long id,
			@RequestBody Medial_Help_Put params, PersistentEntityResourceAssembler eass) {

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
			if (Utils.powerValidate(profileUtil, authorization, PowerEnum.HELP_UPDATE) == null) {
				return Utils.responseErrors(HttpStatus.FORBIDDEN, ApiErrorEnum.ROLE_FORBIDDEN.name(),
						ApiErrorEnum.ROLE_FORBIDDEN.getText(), ApiErrorEnum.ROLE_FORBIDDEN.getText());
			}

			if (!helpService.isExists(id)) {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
						ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
			}
			
			
			if (params != null) {
				
				params.getHelp().setId(id);
				if (StringUtils.isNotBlank(params.getHelp().getTitle()) && helpService.checkExistsData(params.getHelp())) {
					return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.TITLE_EXISTS.name(),
							ApiErrorEnum.DATA_EXISTS.getText(), ApiErrorEnum.TITLE_EXISTS.getText());
				}
				
				return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
					@Override
					public Object doInTransaction(TransactionStatus arg0) {
						Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
						//Save a update help
						Help help = params.getHelp();
						help.setId(id);
						help = helpService.save(help, userId);
						//Save new documents
						return new ResponseEntity<>(eass.toFullResource(help), HttpStatus.OK);
					}
				});
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
}
