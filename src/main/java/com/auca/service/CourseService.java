package com.auca.service;
import java.util.List;

import com.auca.model.CourseModel;

public interface CourseService {
	
	void saveCourse(CourseModel course);
	List<CourseModel> getAllCourses();
	CourseModel findById(String id);

}
