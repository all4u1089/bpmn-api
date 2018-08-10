package com.eazymation.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.eazymation.clouvir.model.ResetToken;

import vn.greenglobal.core.model.common.MutableRepo;

@RestResource(path = "resettokens")
public interface ResetTokenRepository extends MutableRepo<ResetToken> {

}
