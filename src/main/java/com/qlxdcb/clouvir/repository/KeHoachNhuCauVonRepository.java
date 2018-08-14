package com.qlxdcb.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.qlxdcb.clouvir.model.Help;
import com.qlxdcb.clouvir.model.KeHoachNhuCauVon;

import vn.greenglobal.core.model.common.MutableRepo;

@RestResource(path = "keHoachNhuCauVons")
public interface KeHoachNhuCauVonRepository extends MutableRepo<KeHoachNhuCauVon> {

}
