package com.eazymation.clouvir.model;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.jdo.annotations.Transactional;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.util.StringUtils;

import com.eazymation.Application;
import com.eazymation.clouvir.enums.RoleTypeEnum;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@Entity
@Table(name = "role")
@ApiModel
public class Role extends Model<Role> {

	private static final long serialVersionUID = -1541840816380863516L;

	public Role() {
		
	}
	
	public Role(String name, Set<String> powers, RoleTypeEnum roleType) {
		this.name = name;
		this.powers = powers;
		this.roleType = roleType;
	}

	@NotBlank
	@Size(max=255)
	private String name = "";
	
	@Transient
	private String power = "";

	@ElementCollection(targetClass = String.class, fetch = FetchType.EAGER)
	@CollectionTable(name = "role_power", joinColumns = { @JoinColumn(name = "role_id") })
	private Set<String> powers = new HashSet<>();
	
	@NotNull
	@Column(length = 30)
	@Enumerated(EnumType.STRING)
	private RoleTypeEnum roleType;

	@ApiModelProperty(position = 1, required = true)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@ApiModelProperty(position = 2, required = true)
	public String getPower() {
		power = StringUtils.collectionToCommaDelimitedString(getPowers());
		if (power != null && !power.isEmpty()) {
			power = power.toUpperCase().replaceAll(":", "_");
		}
		return power;
	}
	
	public void setPower(String power) {
		this.power = power;
		setPowers(power);
	}
	
	@ApiModelProperty(hidden = true)
	public Set<String> getPowers() {
		return powers;
	}
	
	public void setPowers(final Set<String> powers) {
		this.powers = powers;
	}

	@ApiModelProperty(position = 3)
	public RoleTypeEnum getRoleType() {
		return roleType;
	}

	public void setRoleType(RoleTypeEnum roleType) {
		this.roleType = roleType;
	}

	public void setPowers(String powers) {
		if (powers != null && !powers.isEmpty()) {
			Set<String> temp = new HashSet<>(Arrays.asList(powers.toLowerCase().replaceAll("_", ":")));
			setPowers(temp);
		}
	}

	@Transient
	@ApiModelProperty(hidden = true)
	public Long getRoleId() {
		return getId();		
	}
	
	@Transient
	@Transactional
	@ApiModelProperty(hidden = true)
	public Map<String, Object> getRelationships() {
		Map<String, Object> map = new HashMap<>();
		// productId
		map.put("roleId", getId());		

		// role info
		Map<String, Object> roleInfo = new HashMap<>();
		roleInfo.put("value", getRoleType().toString());
		roleInfo.put("text", getRoleType().getText());
		map.put("roleInfo", roleInfo);
		return map;
	}

}
