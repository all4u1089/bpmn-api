package com.qlxdcb.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.qlxdcb.clouvir.model.Role;

import vn.greenglobal.core.model.common.MutableRepo;
@RestResource(path = "roles")
public interface RoleRepository extends MutableRepo<Role> {

}
