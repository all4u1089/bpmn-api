package com.eazymation.clouvir.model;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.transaction.Transactional;
import javax.validation.constraints.Size;

import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.hibernate.validator.constraints.NotBlank;
import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.eazymation.Application;
import com.eazymation.clouvir.enums.PowerEnum;
import com.fasterxml.jackson.annotation.JsonIgnore;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@Entity
@Table(name = "user")
@ApiModel
public class User extends Model<User> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6979954418350232111L;
			
	@NotBlank
	@Size(max=255)
	private String email = "";
	@NotBlank
	@Size(max=255)
	private String password = "";
	@Size(max=255)
	private String salkey = "";	
	@NotBlank
	@Size(max=255)
	private String fullName = "";
	@Size(max=20)
	private String contact = "";	
	@Size(max=255)
	private String department = "";
	@Size(max=15)
	private String internalIP = "";
	@Size(max=15)
	private String externalIP = "";
	@Size(max=255)
	private String referenceDescription = "";

	private boolean active;
	private boolean externalIPRequired;
	private boolean haveSecurityPledge;
	
	private long securityViolationHistory;
	
	private Long role_id;
	private Long company_id;
	
	private LocalDateTime recentSignIn;
		
	@Transient
	private Set<String> allPowers = new HashSet<>();	

	public User() {
		
	}
	
	public User(Long id) {
		setId(id);
	}
	
	public User(String fullName, String contact, String email, Long company_id, String department, Long role_id, String referenceDescription, String internalIP, String externalIP) {
		this.fullName = fullName;
		this.contact = contact;
		this.email = email;
		this.company_id = company_id;
		this.department = department;
		this.role_id = role_id;
		this.referenceDescription = referenceDescription;
		this.internalIP = internalIP;
		this.externalIP = externalIP;
		this.active = true;
	}
	
	public User(String fullName, String email, String contact, String department, Long role_id, String referenceDescription) {
		this.fullName = fullName;
		this.email = email;
		this.contact = contact;
		this.department = department;
		this.role_id = role_id;
		this.referenceDescription = referenceDescription;
		this.active = true;
	}

	public User(String email, String password, boolean active, boolean chuyenVienNhapLieu) {
		super();
		this.email = email;
		this.password = password;
		this.active = active;
	}

	public User(String email, String password, boolean active, boolean chuyenVienNhapLieu, Long role_id) {
		super();
		this.email = email;
		this.password = password;
		this.active = active;
		this.role_id = role_id;
	}
	
	public Long getRole_id() {
		return role_id;
	}

	public void setRole_id(Long role_id) {
		this.role_id = role_id;
	}
	
	public Long getCompany_id() {
		return company_id;
	}

	public void setCompany_id(Long company_id) {
		this.company_id = company_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@JsonIgnore
	public String getPassword() {
		return password;
	}

	public void setPassword(String matKhau) {
		this.password = matKhau;
	}

	@ApiModelProperty(hidden = true)
	@JsonIgnore
	public String getSalkey() {
		return salkey;
	}

	public void setSalkey(String salkey) {
		this.salkey = salkey;
	}

	@ApiModelProperty(hidden = true)
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public boolean isExternalIPRequired() {
		return externalIPRequired;
	}

	public void setExternalIPRequired(boolean externalIPRequired) {
		this.externalIPRequired = externalIPRequired;
	}
	
	public String getInternalIP() {
		return internalIP;
	}

	public void setInternalIP(String internalIP) {
		this.internalIP = internalIP;
	}

	public String getExternalIP() {
		return externalIP;
	}

	public void setExternalIP(String externalIP) {
		this.externalIP = externalIP;
	}

	@ApiModelProperty(hidden = true)
	public LocalDateTime getRecentSignIn() {
		return recentSignIn;
	}

	public void setRecentSignIn(LocalDateTime recentSignIn) {
		this.recentSignIn = recentSignIn;
	}

	public String getReferenceDescription() {
		return referenceDescription;
	}

	public void setReferenceDescription(String referenceDescription) {
		this.referenceDescription = referenceDescription;
	}

	@JsonIgnore
	public boolean isHaveSecurityPledge() {
		return haveSecurityPledge;
	}

	public void setHaveSecurityPledge(boolean haveSecurityPledge) {
		this.haveSecurityPledge = haveSecurityPledge;
	}
	
	@JsonIgnore
	public long getSecurityViolationHistory() {
		return securityViolationHistory;
	}

	public void setSecurityViolationHistory(long securityViolationHistory) {
		this.securityViolationHistory = securityViolationHistory;
	}

	@JsonIgnore
	public Set<String> getAllPowers() {
		if (allPowers.isEmpty()) {
			Role role = getRole();
			if (role != null) {
				allPowers.add(role.getName());
				for (String str : role.getPowers()) {
					allPowers.addAll(Arrays.asList(str.split(",")));
				}
			}			
		}
		return allPowers;
	}

	@Transient
	@ApiModelProperty(hidden = true)
	private Power power = new Power(new SimpleAccountRealm() {
		@Override
		protected AuthorizationInfo getAuthorizationInfo(final PrincipalCollection arg0) {
			final SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.setStringPermissions(getAllPowers());
			return info;
		}
	});

	public void updatePassword(String pass) {
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		BasicPasswordEncryptor encryptor = new BasicPasswordEncryptor();
		String salkey = getSalkey();
		if (salkey == null || salkey.equals("")) {
			salkey = encryptor.encryptPassword((new Date()).toString());
		}
		String passHash = md5PasswordEncoder.encodePassword(pass, salkey);
		setSalkey(salkey);
		setPassword(passHash);
	}

	@ApiModelProperty(hidden = true)
	public Power getPower() {
		return power = new Power(new SimpleAccountRealm() {
			@Override
			protected AuthorizationInfo getAuthorizationInfo(final PrincipalCollection arg0) {
				final SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
				info.setStringPermissions(getAllPowers());
				return info;
			}
		});
	}

	@Deprecated
	public boolean checkPower(String resource, String action) {
		return true;
	}

	public boolean checkPower(PowerEnum power) {
		return getPower().getRealm().isPermitted(null, power.name().toLowerCase().replace('_', ':'));
	}
	
	@Transient
	@Transactional
	@ApiModelProperty(hidden = true)
	public Map<String, Object> getRelationships() {
		Map<String, Object> map = new HashMap<>();
		//Show user id
		map.put("userId", getId());
				
		//Show role info
		Map<String, Object> roleInfo = new HashMap<>();
		if (getRole_id() != null && getRole_id() > 0) {
			Role role = getRole();
			roleInfo.put("roleName", role.getName());
			roleInfo.put("roleType", role.getRoleType());
		}
		map.put("roleInfo", roleInfo);			
		
		return map;
	}
	
	@Transient
	@Transactional
	@JsonIgnore
	public Role getRole() {
		Role role = null;
		if (getRole_id() != null && getRole_id() > 0) {
			EntityManager em = Application.app.getEntityManager();
			String query = "SELECT * FROM role where id = " + getRole_id();
			role = (Role) em.createNativeQuery(query, Role.class).getSingleResult();
		}
		return role;
	}
	
	public boolean checkPassword(String password) {
		Md5PasswordEncoder md5PasswordEncoder = new Md5PasswordEncoder();
		String salkey = getSalkey();
		if (salkey == null || salkey.equals("")) {
			return false;
		}
		return md5PasswordEncoder.isPasswordValid(getPassword(), password, getSalkey());
	}	
}