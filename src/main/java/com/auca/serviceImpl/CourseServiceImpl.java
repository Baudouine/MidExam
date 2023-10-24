package com.auca.serviceImpl;

import java.util.List;

import com.auca.dao.CourseDao;
import com.auca.model.CourseModel;
import com.auca.service.CourseService;

public class CourseServiceImpl implements CourseService{
	
	CourseDao courseDao = new CourseDao();

	@Override
	public void saveCourse(CourseModel course) {
		courseDao.saveCourse(course);
	}

	@Override
	public List<CourseModel> getAllCourses() {
		return courseDao.getAllCourses();
	}

	@Override
	public CourseModel findById(String id) {
		
		return courseDao.findById(id);
	}

}
