package com.auca.service;

import java.util.List;

import com.auca.model.CourseModel;
import com.auca.model.StudentCourseModel;

public interface StudentCourseService {
	
	void saveStudentCourse(StudentCourseModel studentCourse);
	
	List<StudentCourseModel> getAllStudentCourses();
	
	List<StudentCourseModel> getAllStudentsByCourses(CourseModel course);
}
