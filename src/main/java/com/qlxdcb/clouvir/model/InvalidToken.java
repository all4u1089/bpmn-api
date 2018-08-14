package com.qlxdcb.clouvir.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.qlxdcb.clouvir.enums.InvalidTokenStatusEnum;

//import org.hibernate.annotations.Immutable;

import io.swagger.annotations.ApiModel;

@Entity
@Table(name = "invalidtoken")
@ApiModel
public class InvalidToken extends Model<InvalidToken> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7550664635055554646L;

	@Lob
	private String token = "";

	private boolean active = true;

	@ManyToOne
	private User user;
	
	@Column(length = 30)
	@Enumerated(EnumType.STRING)
	private InvalidTokenStatusEnum tokenStatus;
	
	public InvalidToken() {
		super();
	}

	public InvalidToken(String currentToken) {
		this.token = currentToken;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public InvalidTokenStatusEnum getTokenStatus() {
		return tokenStatus;
	}

	public void setTokenStatus(InvalidTokenStatusEnum tokenStatus) {
		this.tokenStatus = tokenStatus;
	}
}