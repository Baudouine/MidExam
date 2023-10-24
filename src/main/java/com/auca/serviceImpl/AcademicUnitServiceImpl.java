package com.auca.serviceImpl;

import java.util.List;

import com.auca.dao.AcademicUnitDao;
import com.auca.model.AcademicUnitModel;
import com.auca.service.AcademicUnitService;

public class AcademicUnitServiceImpl implements AcademicUnitService{
	
	AcademicUnitDao unitDao = new AcademicUnitDao();

	@Override
	public void saveAcademicUnit(AcademicUnitModel unit) {
		unitDao.saveUnit(unit);
	}

	@Override
	public AcademicUnitModel findByUnitName(String name) {
		return unitDao.findUnitByName(name);
	}

	@Override
	public List<AcademicUnitModel> findAllUnits() {
		return unitDao.findAllUnits();
	}

	@Override
	public List<AcademicUnitModel> findByUnitType(String type) {
		return unitDao.findByUnitType(type);
	}

	@Override
	public AcademicUnitModel findById(String id) {
		
		return unitDao.findById(id);
	}

}
