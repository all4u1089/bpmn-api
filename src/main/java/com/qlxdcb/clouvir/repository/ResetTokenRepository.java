package com.qlxdcb.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.qlxdcb.clouvir.model.ResetToken;

import vn.greenglobal.core.model.common.MutableRepo;

@RestResource(path = "resettokens")
public interface ResetTokenRepository extends MutableRepo<ResetToken> {

}
