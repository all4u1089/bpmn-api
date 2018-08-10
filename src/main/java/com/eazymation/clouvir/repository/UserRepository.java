package com.eazymation.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.eazymation.clouvir.model.User;

import vn.greenglobal.core.model.common.MutableRepo;

@RestResource(path = "users")
public interface UserRepository extends MutableRepo<User> {
}
