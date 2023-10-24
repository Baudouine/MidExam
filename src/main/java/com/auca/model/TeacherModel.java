package com.auca.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_teacher")
public class TeacherModel {
	
	@Id
	@Column(name = "teacher_code")
	private String code;
	
	@Column(name = "name")
	private String name;
	
	@Enumerated(EnumType.STRING)
	private TeacherEnum qualification;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "tbl_teachers_courses",
		joinColumns = @JoinColumn(name = "teacher_code"),
		inverseJoinColumns = @JoinColumn(name = "course_code")
			)
	private List<CourseModel> courses = new ArrayList<>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public TeacherEnum getQualification() {
		return qualification;
	}

	public void setQualification(TeacherEnum qualification) {
		this.qualification = qualification;
	}

	public List<CourseModel> getCourses() {
		return courses;
	}

	public void setCourses(List<CourseModel> courses) {
		this.courses = courses;
	}
}
