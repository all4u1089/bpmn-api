package com.qlxdcb.clouvir.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.camunda.bpm.engine.ProcessEngineException;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.data.rest.webmvc.RepositoryRestController;
import org.springframework.hateoas.ResourceAssembler;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.qlxdcb.Application;
import com.qlxdcb.clouvir.enums.ApiErrorEnum;
import com.qlxdcb.clouvir.model.KeHoachNhuCauVon;
import com.qlxdcb.clouvir.model.medial.Medial_KeHoachNhuCauVon_Post;
import com.qlxdcb.clouvir.service.KeHoachNhuCauVonService;
import com.qlxdcb.clouvir.service.ProcessService;
import com.qlxdcb.clouvir.util.Utils;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import vn.greenglobal.core.model.common.BaseRepository;

@RestController
@RepositoryRestController
@Api(value = "keHoachNhuCauVons", description = "KeHoachNhuCauVons")
public class KeHoachNhuCauVonController extends ClouvirController<KeHoachNhuCauVon>{
	
	@Autowired
	private KeHoachNhuCauVonService keHoachNhuCauVonService;
	
	@Autowired
	RuntimeService runtimeService;	
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	ProcessService processService;
	
	public KeHoachNhuCauVonController(BaseRepository<KeHoachNhuCauVon, Long> repo) {
		super(repo);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method = RequestMethod.GET, value = "/keHoachNhuCauVons")
	@ApiOperation(value = "Get a list of KeHoachNhuCauVon", position = 1, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Object getList(@RequestHeader(value = "Authorization", required = true) String authorization,
			Pageable pageable, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "dateFrom", required = false) String dateFrom,
			@RequestParam(value = "dateTo", required = false) String dateTo,
			PersistentEntityResourceAssembler eass) {
		try {			
			List<KeHoachNhuCauVon> list = keHoachNhuCauVonService.findAllByNativeQuery(keyword, pageable.getOffset(), pageable.getPageSize(), pageable.getSort());
			int total = keHoachNhuCauVonService.countAllByNativeQuery(keyword);
			return assembler.toResource(new PageImpl<KeHoachNhuCauVon>(list, pageable, total), (ResourceAssembler) eass);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
		
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes"})
	@RequestMapping(method = RequestMethod.POST, value = "/keHoachNhuCauVons")
	@ApiOperation(value = "Add a new KeHoachNhuCauVon", position = 2, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Add new KeHoachNhuCauVon successful", response = KeHoachNhuCauVon.class),
			@ApiResponse(code = 201, message = "Add new KeHoachNhuCauVon successful", response = KeHoachNhuCauVon.class) })
	public ResponseEntity<Object> create(@RequestHeader(value = "Authorization", required = true) String authorization,
			@RequestBody Medial_KeHoachNhuCauVon_Post params, PersistentEntityResourceAssembler eass) {
		try {
			System.out.println("=========================create");
			if (params.getFlowId() == null || params.getFlowId().isEmpty()) {
				return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FLOWID_REQUIRED.name(),
						ApiErrorEnum.FLOWID_REQUIRED.getText(), ApiErrorEnum.FLOWID_REQUIRED.getText());
			}
			
			Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());

			
			try {
				return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
					@Override
					public Object doInTransaction(TransactionStatus arg0) {
						KeHoachNhuCauVon keHoach = keHoachNhuCauVonService.save(params.getKeHoachNhuCauVon(), userId);
						
						Map<String, Object> variables = new HashMap<>();
						variables.put("model", keHoach);
						variables.put("flow", params.getFlowId());
						variables.put("userId", userId);
						
						ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("taoKeHoachNhuCauVon", keHoach.businessKey(), variables);
							
						Task task = taskService
									.createTaskQuery()
					                .processInstanceId(processInstance.getId())
					                //.taskCandidateGroup("dev-managers")
					                .singleResult();
						taskService.complete(task.getId());
						return new ResponseEntity<>((KeHoachNhuCauVon) processService.getBusinessObject(processInstance.getId()), HttpStatus.OK);						
					}
				});
				
			} catch (ProcessEngineException e) {
				return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FLOWID_REQUIRED.name(),
						ApiErrorEnum.FLOWID_REQUIRED.getText(), ApiErrorEnum.FLOWID_REQUIRED.getText());
			}
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
		
	@RequestMapping(method = RequestMethod.GET, value = "/keHoachNhuCauVons/{id}")
	@ApiOperation(value = "Get a KeHoachNhuCauVon by id", position = 3, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 200, message = "Get the KeHoachNhuCauVon successful", response = KeHoachNhuCauVon.class) })
	public ResponseEntity<Object> getById(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") long id, PersistentEntityResourceAssembler eass) {
		try {
			KeHoachNhuCauVon KeHoachNhuCauVon = keHoachNhuCauVonService.findOne(id);
			if (KeHoachNhuCauVon == null) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(eass.toFullResource(KeHoachNhuCauVon), HttpStatus.OK);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	
	@SuppressWarnings({ "deprecation"})
	@RequestMapping(method = RequestMethod.DELETE, value = "/keHoachNhuCauVons/{id}")
	@ApiOperation(value = "Delete a KeHoachNhuCauVon", position = 5, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = { @ApiResponse(code = 204, message = "Delete the KeHoachNhuCauVon successful") })
	public ResponseEntity<Object> delete(@RequestHeader(value = "Authorization", required = true) String authorization,
			@PathVariable("id") Long id) {
		try {
			KeHoachNhuCauVon KeHoachNhuCauVon = keHoachNhuCauVonService.delete(id);
			if (KeHoachNhuCauVon == null) {
				return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
						ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
			}
			keHoachNhuCauVonService.save(KeHoachNhuCauVon,
					Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString()));
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
	
	@SuppressWarnings({"unchecked", "rawtypes", "deprecation" })
	@RequestMapping(method = RequestMethod.PUT, value = "/keHoachNhuCauVons/{id}")
	@ApiOperation(value = "Update the KeHoachNhuCauVon", position = 4, produces = MediaType.APPLICATION_JSON_VALUE)
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "Update the KeHoachNhuCauVon successful", response = KeHoachNhuCauVon.class) })
	public @ResponseBody ResponseEntity<Object> update(
			@RequestHeader(value = "Authorization", required = true) String authorization, @PathVariable("id") long id,
			@RequestBody Medial_KeHoachNhuCauVon_Post params, PersistentEntityResourceAssembler eass) {
		
		if (!keHoachNhuCauVonService.isExists(id)) {
			return Utils.responseErrors(HttpStatus.NOT_FOUND, ApiErrorEnum.DATA_NOT_FOUND.name(),
					ApiErrorEnum.DATA_NOT_FOUND.getText(), ApiErrorEnum.DATA_NOT_FOUND.getText());
		}
		
		try {
			Long userId = Long.valueOf(profileUtil.getCommonProfile(authorization).getAttribute("userId").toString());
			return (ResponseEntity<Object>) getTransactioner().execute(new TransactionCallback() {
				@Override
				public Object doInTransaction(TransactionStatus arg0) {
					params.getKeHoachNhuCauVon().setId(id);
					List<Task> listPage = Application.app.getTaskService()
							.createTaskQuery().processInstanceBusinessKey(params.getKeHoachNhuCauVon().businessKey())
							.orderByTaskCreateTime().desc().listPage(0, 1);
					Task task = listPage.isEmpty() ? null : listPage.get(0);
					if (task != null) {
						Map<String, Object> variables = new HashMap<>();
						variables.put("model", params.getKeHoachNhuCauVon());
						variables.put("flow", params.getFlowId());
						variables.put("userId", userId);
						taskService.complete(task.getId(), variables);
						return new ResponseEntity<>((KeHoachNhuCauVon) processService.getBusinessObject(task.getProcessInstanceId()), HttpStatus.OK);
					} else {
						return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
					}											
				}
			});
			
		} catch (ProcessEngineException e) {
			return Utils.responseErrors(HttpStatus.BAD_REQUEST, ApiErrorEnum.FLOWID_REQUIRED.name(),
					ApiErrorEnum.FLOWID_REQUIRED.getText(), ApiErrorEnum.FLOWID_REQUIRED.getText());
		} catch (Exception e) {
			return Utils.responseInternalServerErrors(e);
		}
	}
	
}
