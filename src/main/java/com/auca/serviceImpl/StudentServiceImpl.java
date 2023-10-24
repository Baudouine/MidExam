package com.auca.serviceImpl;

import java.util.List;

import com.auca.dao.StudentDao;
import com.auca.model.StudentModel;
import com.auca.service.StudentService;

public class StudentServiceImpl implements StudentService {
	
	public StudentDao studentDao = new StudentDao(); 

	@Override
	public boolean saveStudent(StudentModel student) {
		try {
			studentDao.saveStudent(student);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateStudent(StudentModel student) {
		return false;
	}

	@Override
	public boolean deleteStudent(StudentModel student) {
		return false;
	}

	@Override
	public List<StudentModel> getAllStudents() {
		return studentDao.getAllStudents();
	}

	@Override
	public StudentModel findById(String id) {
		return studentDao.findById(id);
	}

}
