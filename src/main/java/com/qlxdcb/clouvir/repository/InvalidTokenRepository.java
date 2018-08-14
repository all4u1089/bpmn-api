package com.qlxdcb.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.qlxdcb.clouvir.model.InvalidToken;

import vn.greenglobal.core.model.common.MutableRepo;

@RestResource(path = "invalidtokens")
public interface InvalidTokenRepository extends MutableRepo<InvalidToken> {

}
