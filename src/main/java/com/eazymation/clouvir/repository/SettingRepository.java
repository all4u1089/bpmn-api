package com.eazymation.clouvir.repository;

import org.springframework.data.rest.core.annotation.RestResource;

import com.eazymation.clouvir.model.Setting;

import vn.greenglobal.core.model.common.MutableRepo;

@RestResource(path = "settings")
public interface SettingRepository extends MutableRepo<Setting> {
}
