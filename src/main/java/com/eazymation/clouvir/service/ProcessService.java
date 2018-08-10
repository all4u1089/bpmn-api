package com.eazymation.clouvir.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.engine.impl.RepositoryServiceImpl;
import org.camunda.bpm.engine.impl.bpmn.behavior.ExclusiveGatewayActivityBehavior;
import org.camunda.bpm.engine.impl.persistence.entity.ExecutionEntity;
import org.camunda.bpm.engine.impl.pvm.PvmScope;
import org.camunda.bpm.engine.impl.pvm.PvmTransition;
import org.camunda.bpm.engine.impl.pvm.process.ActivityImpl;
import org.camunda.bpm.engine.repository.ProcessDefinition;
import org.camunda.bpm.engine.runtime.Execution;
import org.camunda.bpm.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eazymation.clouvir.model.BaoCaoKeHoachVon;

@Component
public class ProcessService {
	
	@Autowired
	RepositoryService repositoryService;
	
	public void taoBaoCaoKeHoachVon(Execution execution) {
		System.out.println("================taoBaoCaoKeHoachVon: " + execution);
		
	}
	
	public void capNhatKeHoachVonDaPheDuyet(Execution execution) {
		System.out.println("================capNhatKeHoachVonDaPheDuyet");
		String businessKey = ((ExecutionEntity) execution).getBusinessKey();
		
	}
	
	public void validateDuLieu(Execution execution) {
		((ExecutionEntity) execution).setVariable("isValidate", true);
	}
	
	public void luuDuLieu(Execution execution) {
		System.out.println("============Luu du lieu");
//		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
//		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.LUU_TAM);
//		model.save();
//		if (((ExecutionEntity) execution).getBusinessKey() == null || ((ExecutionEntity) execution).getBusinessKey().isEmpty()) {
//			System.out.println("model.businessKey(): " + model.businessKey());
//			((ExecutionEntity) execution).setBusinessKey(model.businessKey());
//		}
//		Object object = ((ExecutionEntity) execution).getVariable("list");
//		String attr = (String) ((ExecutionEntity) execution).getVariable("attr");
//		if (object != null) {
//			BindUtils.postNotifyChange(null, null, object, attr);
//		}
	}
	
	public void luuDuLieuTruocPheDuyet(Execution execution) {
		System.out.println("============luuDuLieuTruocPheDuyet");
//		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
//		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.CHO_DUYET);
//		model.save();
//		if (((ExecutionEntity) execution).getBusinessKey() == null || ((ExecutionEntity) execution).getBusinessKey().isEmpty()) {
//			System.out.println("model.businessKey(): " + model.businessKey());
//			((ExecutionEntity) execution).setBusinessKey(model.businessKey());
//		}
//		Object object = ((ExecutionEntity) execution).getVariable("list");
//		String attr = (String) ((ExecutionEntity) execution).getVariable("attr");
//		if (object != null) {
//			BindUtils.postNotifyChange(null, null, object, attr);
//		}
	}
	
	public void luuDuLieuSauPheDuyet(Execution execution) {
		System.out.println("============luuDuLieuSauPheDuyet");
//		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
//		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.DA_DUYET);
//		model.save();
//		if (((ExecutionEntity) execution).getBusinessKey() == null || ((ExecutionEntity) execution).getBusinessKey().isEmpty()) {
//			System.out.println("model.businessKey(): " + model.businessKey());
//			((ExecutionEntity) execution).setBusinessKey(model.businessKey());
//		}
//		Object object = ((ExecutionEntity) execution).getVariable("list");
//		String attr = (String) ((ExecutionEntity) execution).getVariable("attr");
//		if (object != null) {
//			BindUtils.postNotifyChange(null, null, object, attr);
//		}
	}
	
	public void luuDuLieuKhongPheDuyet(Execution execution) {
		System.out.println("============luuDuLieuSauPheDuyet");
//		KeHoachNhuCauVon model = (KeHoachNhuCauVon) ((ExecutionEntity) execution).getVariable("model");
//		model.setTrangThaiKeHoach(TrangThaiKeHoachVonEnum.TU_CHOI_PHE_DUYET);
//		model.save();
//		if (((ExecutionEntity) execution).getBusinessKey() == null || ((ExecutionEntity) execution).getBusinessKey().isEmpty()) {
//			System.out.println("model.businessKey(): " + model.businessKey());
//			((ExecutionEntity) execution).setBusinessKey(model.businessKey());
//		}
//		Object object = ((ExecutionEntity) execution).getVariable("list");
//		String attr = (String) ((ExecutionEntity) execution).getVariable("attr");
//		if (object != null) {
//			BindUtils.postNotifyChange(null, null, object, attr);
//		}
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
}
