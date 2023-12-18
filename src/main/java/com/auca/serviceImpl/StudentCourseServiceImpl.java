package com.auca.serviceImpl;

import com.auca.dao.StudentCourseDao;
import com.auca.model.CourseModel;
import com.auca.model.StudentCourseModel;
import java.util.List;
import com.auca.service.StudentCourseService;

public class StudentCourseServiceImpl implements StudentCourseService{
	
	StudentCourseDao studentCourseDao = new StudentCourseDao();

	@Override
	public void saveStudentCourse(StudentCourseModel studentCourse) {
		studentCourseDao.saveStudentCourse(studentCourse);
	}

	@Override
	public List<StudentCourseModel> getAllStudentCourses() {
		return studentCourseDao.getAllStudentCourses();
	}

	@Override
	public List<StudentCourseModel> getAllStudentsByCourses(CourseModel course) {
		return studentCourseDao.getStudentsByCourses(course);
	}

}
