package com.auca.serviceImpl;

import java.util.List;

import org.hibernate.Session;

import com.auca.dao.HibernateUtil;
import com.auca.dao.SemesterDao;
import com.auca.model.SemesterModel;
import com.auca.service.SemesterService;

public class SemesterServiceImpl implements SemesterService{
	
	SemesterDao semesterDao = new SemesterDao();

	@Override
	public void saveSemester(SemesterModel semester) {
		semesterDao.saveSemester(semester);
	}

	@Override
	public List<SemesterModel> findAllSemesters() {
		return semesterDao.findAllSemesters();
	}

	@Override
	public SemesterModel findById(String id) {
		return semesterDao.findById(id);
	}

	@Override
	public void updateSemester(SemesterModel semester) {
		semesterDao.updateSemester(semester);
	}

}
