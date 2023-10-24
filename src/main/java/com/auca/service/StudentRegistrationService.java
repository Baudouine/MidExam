package com.auca.service;

import java.util.List;

import com.auca.model.SemesterModel;
import com.auca.model.StudentRegistrationModel;

public interface StudentRegistrationService {
	void saveRegistration(StudentRegistrationModel registration);
	List<StudentRegistrationModel> allRegistration();
	List<StudentRegistrationModel> getStudentAndSemester(SemesterModel semester);
}
