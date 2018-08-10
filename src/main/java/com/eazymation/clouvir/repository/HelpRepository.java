package com.eazymation.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.eazymation.clouvir.model.Help;
import vn.greenglobal.core.model.common.MutableRepo;

@RestResource(path = "helps")
public interface HelpRepository extends MutableRepo<Help> {

}
