package com.qlxdcb.clouvir.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.transaction.Transactional;
import javax.validation.constraints.Size;

import org.camunda.bpm.engine.task.IdentityLink;
import org.camunda.bpm.engine.task.Task;

import com.qlxdcb.Application;
import com.qlxdcb.clouvir.enums.TrangThaiKeHoachVonEnum;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@Entity
@Table(name = "kehoachnhucauvon")
@ApiModel
public class KeHoachNhuCauVon extends Model<KeHoachNhuCauVon> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5175290274105967518L;
	@Size(max=255)
	private String ten = "";
	@Enumerated(EnumType.STRING)
	private TrangThaiKeHoachVonEnum trangThaiKeHoach;

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	@ApiModelProperty(hidden = true)
	public TrangThaiKeHoachVonEnum getTrangThaiKeHoach() {
		return trangThaiKeHoach;
	}

	public void setTrangThaiKeHoach(TrangThaiKeHoachVonEnum trangThaiKeHoach) {
		this.trangThaiKeHoach = trangThaiKeHoach;
	}
	
	@Transient
	@Transactional
	@ApiModelProperty(hidden = true)
	public Map<String, Object> getRelationships() {
		Map<String, Object> map = new HashMap<>();
		List<Task> listPage = Application.app.getTaskService()
				.createTaskQuery().processInstanceBusinessKey(businessKey())
				.orderByTaskCreateTime().desc().listPage(0, 1);
		Task task = listPage.isEmpty() ? null : listPage.get(0);
		Map<String, Object> taskMap = new HashMap<>();
		List<String> listIdentity = new ArrayList<String>();
		if (task != null) {
			taskMap.put("taskDefinitionKey", task.getTaskDefinitionKey());
			taskMap.put("processDefinitionId", task.getProcessDefinitionId());
			taskMap.put("name", task.getName());
			taskMap.put("id", task.getId());
			List<IdentityLink> identities = Application.app.getTaskService().getIdentityLinksForTask(task.getId());
			for (IdentityLink identity : identities) {
				listIdentity.add(identity.getGroupId());
			}
		}
		map.put("task", taskMap);
		map.put("identities", listIdentity);
		return map;
	}
}