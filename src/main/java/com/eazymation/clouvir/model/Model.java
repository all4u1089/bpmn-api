package com.eazymation.clouvir.model;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;
import javax.transaction.Transactional;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.data.domain.Persistable;

import com.eazymation.Application;
import com.eazymation.clouvir.util.Utils;
import com.fasterxml.jackson.annotation.JsonIgnore;

import io.katharsis.resource.annotations.JsonApiId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@SuppressWarnings("rawtypes")
@MappedSuperclass
@ApiModel
public class Model<T extends Model<T>> implements Persistable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@JsonApiId
	private Long id;

	private LocalDateTime createdDate = Utils.localDateTimeNow();
	private LocalDateTime updatedDate = Utils.localDateTimeNow();

	private boolean deleted;
	
	@Column(name = "createdPerson_id")
	private Long createdPersonId;
	
	@Column(name = "updatedPerson_id")
	private Long updatedPersonId;

	public boolean equals(Object o) {
		return this == o || o != null && getClass().isAssignableFrom(o.getClass()) && getId() != null
				&& Objects.equals(getId(), ((Model) o).getId());
	}

	
	/*public int hashCode() {
		return 31;
	}*/

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}	

	@ApiModelProperty(hidden = true)
	@JsonIgnore
	public boolean isDeleted() {
		return deleted;
	}

	// @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS+0000")
	@ApiModelProperty(hidden = true)
	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	@ApiModelProperty(hidden = true)
	public LocalDateTime getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(LocalDateTime updatedDate) {
		this.updatedDate = updatedDate;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	@Transient
	@ApiModelProperty(hidden = true)
	public boolean isNew() {
		return id == null || id == 0;
	}

	@Override
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}

	@ApiModelProperty(hidden = true)
	public Long getCreatedPersonId() {
		return createdPersonId;
	}

	public void setCreatedPersonId(Long createdPersonId) {
		this.createdPersonId = createdPersonId;
	}

	@ApiModelProperty(hidden = true)
	public Long getUpdatedPersonId() {
		return updatedPersonId;
	}

	public void setUpdatedPersonId(Long updatedPersonId) {
		this.updatedPersonId = updatedPersonId;
	}
	
	@Transient
	private User createdPerson;
	
	@Transient
	private User updatedPerson;
	
	@JsonIgnore
	@Transactional
	@ApiModelProperty(hidden = true)
	public Map<String, Object> getCreatedPerson() {
		if (createdPerson == null && createdPersonId != null) {
			EntityManager em = Application.app.getEntityManager();
			String query = "select user.id as userId, user.fullName"
					+ " from user as user"
					+ " where user.deleted = 0 and user.id = " + createdPersonId;
			Object[] obj = (Object[]) em.createNativeQuery(query).getSingleResult();

			if (obj != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("userId", obj[0]);
				map.put("fullName", obj[1]);
				return map;
			}
		}
		return null;	
	}	
	
	public void setCreatedPerson(User createdPerson) {
		this.createdPerson = createdPerson;
		if (createdPerson != null) {
			createdPersonId = createdPerson.getId();		
		}
	}	
	
	@JsonIgnore
	@Transactional
	@ApiModelProperty(hidden = true)
	public Map<String, Object> getUpdatedPerson() {
		if (updatedPerson == null && updatedPersonId != null) {
			EntityManager em = Application.app.getEntityManager();
			String query = "select user.id as userId, user.fullName"
					+ " from user as user"
					+ " where user.deleted = 0 and user.id = " + updatedPersonId;
			Object[] obj = (Object[]) em.createNativeQuery(query).getSingleResult();

			if (obj != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("userId", obj[0]);
				map.put("fullName", obj[1]);
				return map;
			}
			
		}
		return null;	
	}	
	
	public void setUpdatedPerson(User updatedPerson) {
		this.updatedPerson = updatedPerson;
		if (updatedPerson != null) {
			updatedPersonId = updatedPerson.getId();
		}	
	}

}
