package com.auca.serviceImpl;

import java.util.List;

import com.auca.dao.StudentRegistrationDao;
import com.auca.model.SemesterModel;
import com.auca.model.StudentRegistrationModel;
import com.auca.service.StudentRegistrationService;

public class StudentRegistrationServiceImpl implements StudentRegistrationService {
	
	StudentRegistrationDao regDao = new StudentRegistrationDao();

	@Override
	public void saveRegistration(StudentRegistrationModel registration) {
		regDao.saveRegistration(registration);
	}

	@Override
	public List<StudentRegistrationModel> allRegistration() {
		return regDao.getAllRegistration();
	}

	@Override
	public List<StudentRegistrationModel> getStudentAndSemester(SemesterModel semester) {
		return regDao.getAllStudentAndSemester(semester);
	}

}
