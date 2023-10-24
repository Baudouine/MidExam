package com.auca.service;

import java.util.List;

import com.auca.model.AcademicUnitModel;

public interface AcademicUnitService {
	void saveAcademicUnit(AcademicUnitModel unit);
	AcademicUnitModel findByUnitName(String name);
	List<AcademicUnitModel> findAllUnits();
	List<AcademicUnitModel> findByUnitType(String type);
	AcademicUnitModel findById(String id);
}
