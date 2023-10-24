package com.auca.service;

import java.util.List;

import com.auca.model.StudentModel;

public interface StudentService {
	
	boolean saveStudent(StudentModel student);
	
	boolean updateStudent(StudentModel student);
	
	boolean deleteStudent(StudentModel student);
	
	List<StudentModel> getAllStudents();
	
	StudentModel findById(String id);

}
