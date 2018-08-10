package com.eazymation.clouvir;

import java.util.List;

import org.pac4j.core.authorization.authorizer.ProfileAuthorizer;
import org.pac4j.core.context.WebContext;
import org.pac4j.core.exception.HttpAction;
import org.pac4j.core.profile.CommonProfile;

public class CustomAuthorizer extends ProfileAuthorizer<CommonProfile> {

	@Override
	public boolean isAuthorized(final WebContext context, final List<CommonProfile> profiles) throws HttpAction {
		System.out.println("isAuthorized");
		System.out.println(context.getFullRequestURL());
		System.out.println(context.getPath());
		return isAnyAuthorized(context, profiles);
	}

	@Override
	public boolean isProfileAuthorized(final WebContext context, final CommonProfile profile) {
		System.out.println("isProfileAuthorized");
		if (profile == null) {
			return false;
		}
		System.out.println(context.getFullRequestURL());
		System.out.println(context.getPath());
		System.out.println(profile);
		System.out.println(profile.getRoles());
		System.out.println(profile.getPermissions());
		return true;
	}
}
