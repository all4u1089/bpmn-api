package com.qlxdcb.clouvir.model;

import java.util.HashMap;

import org.apache.shiro.realm.AuthorizingRealm;

public class Power extends HashMap<String, Boolean> {

	private static final long serialVersionUID = 1L;

	public static final char SEPARATE_CHAR = ':';
	public static final String SEPARATE = SEPARATE_CHAR + "";

	private long id;
	private String resource = "";
	@SuppressWarnings("unused")
	private User createdPerson;

	public Power(AuthorizingRealm realm_) {
		realm = realm_;
	}

	public Power(AuthorizingRealm realm_, String resource_) {
		this(realm_);
		resource = resource_;
	}

	public Power(AuthorizingRealm realm_, String resource_, long id_, User createdPerson_) {
		this(realm_, resource_);
		resource = resource_;
		id = id_;
		createdPerson = createdPerson_;
	}

	private transient AuthorizingRealm realm;

	public AuthorizingRealm getRealm() {
		return realm;
	}

	@Override
	public Boolean get(Object key_) {
		if (key_ == null) {
			return false;
		}
		String key = key_.toString();
		if (!key.isEmpty() && key.charAt(0) == '_') {
			key = resource + key;
		}
		if (id != 0) {
			key += SEPARATE + id;
		}
		boolean result = realm.isPermitted(null, key.replace('_', SEPARATE_CHAR));
		return result;
	}

}
