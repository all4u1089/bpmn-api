package com.eazymation.clouvir;

import org.pac4j.core.config.Config;
import org.pac4j.springframework.security.web.CallbackFilter;
import org.pac4j.springframework.security.web.Pac4jEntryPoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

@EnableWebSecurity
@Configuration
@Order(1)
public class CasSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private Config config;
	
	protected void configure(final HttpSecurity http) throws Exception {

		final CallbackFilter callbackFilter = new CallbackFilter(config);
		callbackFilter.setMultiProfile(true);

		http.authorizeRequests().antMatchers("/cas/**").authenticated().anyRequest().permitAll().and()
				.exceptionHandling().authenticationEntryPoint(new Pac4jEntryPoint(config, "CasClient"))
				.and().addFilterBefore(callbackFilter, BasicAuthenticationFilter.class).csrf().disable()
				.logout().logoutSuccessUrl("/");
	}
	
}
