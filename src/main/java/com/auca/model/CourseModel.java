package com.auca.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_course")
public class CourseModel {
	
	@Id
	@Column(name = "course_code")
	private String courseCode;
	
	@Column(name = "course_name")
	private String courseName;
	
	@Column(name = "description")
	private String description;
	
	@OneToMany(mappedBy = "course")
	private List<StudentCourseModel> studentCourse = new ArrayList<>();
	
	@ManyToMany(mappedBy = "courses")
	private List<TeacherModel> teachers = new ArrayList<>();
	
	@ManyToMany(mappedBy = "courses")
	private List<SemesterModel> semesters = new ArrayList<>();
	
	@ManyToOne
	@JoinColumn(name = "department")
	private AcademicUnitModel department;

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<StudentCourseModel> getStudentCourse() {
		return studentCourse;
	}

	public void setStudentCourse(List<StudentCourseModel> studentCourse) {
		this.studentCourse = studentCourse;
	}

	public List<TeacherModel> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<TeacherModel> teachers) {
		this.teachers = teachers;
	}

	public List<SemesterModel> getSemesters() {
		return semesters;
	}

	public void setSemesters(List<SemesterModel> semesters) {
		this.semesters = semesters;
	}

	public AcademicUnitModel getDepartment() {
		return department;
	}

	public void setDepartment(AcademicUnitModel department) {
		this.department = department;
	}
	
	
}
