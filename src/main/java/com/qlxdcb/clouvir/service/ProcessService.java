package com.qlxdcb.clouvir.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.impl.RepositoryServiceImpl;
import org.camunda.bpm.engine.impl.bpmn.behavior.ExclusiveGatewayActivityBehavior;
import org.camunda.bpm.engine.impl.persistence.entity.ExecutionEntity;
import org.camunda.bpm.engine.impl.pvm.PvmTransition;
import org.camunda.bpm.engine.impl.pvm.process.ActivityImpl;
import org.camunda.bpm.engine.repository.ProcessDefinition;
import org.camunda.bpm.engine.runtime.Execution;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qlxdcb.clouvir.enums.TrangThaiKeHoachVonEnum;
import com.qlxdcb.clouvir.model.KeHoachNhuCauVon;


@Component
public class ProcessService {
	
	@Autowired
	RepositoryService repositoryService;
	
	@Autowired
	RuntimeService runtimeService;
	
	@Autowired
	KeHoachNhuCauVonService keHoachNhuCauVonService;
	
	@Autowired
	EntityManager em;
	
	public void taoBaoCaoKeHoachVon(Execution execution) {
		System.out.println("================taoBaoCaoKeHoachVon: " + execution);
		
	}
	
	public void capNhatKeHoachVonDaPheDuyet(Execution execution) {
		System.out.println("================capNhatKeHoachVonDaPheDuyet");
		
	}
	
	public void validateDuLieu(Execution execution) {
		System.out.println("validate du lieu");
		((ExecutionEntity) execution).setVariable("isValidate", true);
	}
	
	public void luuDuLieu(Execution execution) {
		System.out.println("============Luu du lieu");
		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
		Long userId = (Long) ((ExecutionEntity) execution).getVariable("userId");
		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.LUU_TAM);
		keHoachNhuCauVonService.save(model, userId);
	}
	
	public void luuDuLieuTruocPheDuyet(Execution execution) {
		System.out.println("============luuDuLieuTruocPheDuyet");
		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
		Long userId = (Long) ((ExecutionEntity) execution).getVariable("userId");
		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.CHO_DUYET);
		keHoachNhuCauVonService.save(model, userId);
	}
	
	public void luuDuLieuSauPheDuyet(Execution execution) {
		System.out.println("============luuDuLieuSauPheDuyet");
		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
		Long userId = (Long) ((ExecutionEntity) execution).getVariable("userId");
		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.DA_DUYET);
		keHoachNhuCauVonService.save(model, userId);
	}
	
	public void luuDuLieuKhongPheDuyet(Execution execution) {
		System.out.println("============luuDuLieuSauPheDuyet");
		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
		Long userId = (Long) ((ExecutionEntity) execution).getVariable("userId");
		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.TU_CHOI_PHE_DUYET);
		keHoachNhuCauVonService.save(model, userId);
	}
	
	public List<PvmTransition> getTransitions(Task task) {
		List<PvmTransition> result = new ArrayList<>();
		for (PvmTransition pvmTransition : ((RepositoryServiceImpl) repositoryService)
				.getDeployedProcessDefinition(task.getProcessDefinitionId())
				.findActivity(task.getTaskDefinitionKey())
				.getOutgoingTransitions()) {
			if (((ActivityImpl) pvmTransition
					.getDestination()).getActivityBehavior() instanceof ExclusiveGatewayActivityBehavior) {
				List<PvmTransition> outgoingTransitions = pvmTransition
						.getDestination().getOutgoingTransitions();
				if (outgoingTransitions.isEmpty()) {
					result.add(pvmTransition);
				} else {
					result.addAll(outgoingTransitions);
				}
			} else {
				result.add(pvmTransition);
			}
		}
		return result;
	}
	
	public List<PvmTransition> getTransitions2(String taskDefinitionKey, String processDefinitionId) {
		List<PvmTransition> result = new ArrayList<>();
		for (PvmTransition pvmTransition : ((RepositoryServiceImpl) repositoryService)
				.getDeployedProcessDefinition(processDefinitionId)
				.findActivity(taskDefinitionKey)
				.getOutgoingTransitions()) {
			if (((ActivityImpl) pvmTransition
					.getDestination()).getActivityBehavior() instanceof ExclusiveGatewayActivityBehavior) {
				List<PvmTransition> outgoingTransitions = pvmTransition
						.getDestination().getOutgoingTransitions();
				if (outgoingTransitions.isEmpty()) {
					result.add(pvmTransition);
				} else {
					result.addAll(outgoingTransitions);
				}
			} else {
				result.add(pvmTransition);
			}
		}
		return result;
	}
	
	public List<PvmTransition> getTransitions(String taskDefinitionKey, String processDefinitionKey) {
		List<ProcessDefinition> ls = repositoryService
				.createProcessDefinitionQuery()
				.processDefinitionKeyLike(processDefinitionKey)
				.latestVersion()
				.list();
		String processDefinitionId = ls.get(0).getId();
		List<PvmTransition> result = new ArrayList<>();
		for (PvmTransition pvmTransition : ((RepositoryServiceImpl) repositoryService)
				.getDeployedProcessDefinition(processDefinitionId)
				.findActivity(taskDefinitionKey)
				.getOutgoingTransitions()) {
			if (((ActivityImpl) pvmTransition
					.getDestination()).getActivityBehavior() instanceof ExclusiveGatewayActivityBehavior) {
				List<PvmTransition> outgoingTransitions = pvmTransition
						.getDestination().getOutgoingTransitions();
				if (outgoingTransitions.isEmpty()) {
					result.add(pvmTransition);
				} else {
					result.addAll(outgoingTransitions);
				}
			} else {
				result.add(pvmTransition);
			}
		}
		return result;
	}
	
	public Object getBusinessObject(String processId) {
		Object result = null;
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery().processInstanceId(processId)
				.singleResult();
		if (processInstance != null) {
			String businessKey = processInstance.getBusinessKey();
			if (businessKey != null) {
				String[] keyParts = businessKey.split("@");
				try {
					result = em.find(Class.forName(keyParts[0]),
									Long.parseLong(keyParts[1]));
				} catch (ClassNotFoundException ex) {
					ex.printStackTrace();
				}
			}
		}
		return result;
	}
}
