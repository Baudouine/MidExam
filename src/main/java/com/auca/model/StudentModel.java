package com.auca.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_student")
public class StudentModel {
	
	@Id
	@Column(name = "reg_number")
	private String regNo;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "dob")
	private LocalDate dateOfBirth;
	
	@OneToMany(mappedBy = "student")
	private List<StudentCourseModel> studentCourse = new ArrayList<>();
	
	@OneToMany(mappedBy = "student")
	private List<StudentRegistrationModel> studentRegistration = new ArrayList<>();
	
	@ManyToOne
	@JoinColumn(name = "department")
	private AcademicUnitModel department;

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public List<StudentCourseModel> getStudentCourse() {
		return studentCourse;
	}

	public void setStudentCourse(List<StudentCourseModel> studentCourse) {
		this.studentCourse = studentCourse;
	}

	public List<StudentRegistrationModel> getStudentRegistration() {
		return studentRegistration;
	}

	public void setStudentRegistration(List<StudentRegistrationModel> studentRegistration) {
		this.studentRegistration = studentRegistration;
	}

	public AcademicUnitModel getDepartment() {
		return department;
	}

	public void setDepartment(AcademicUnitModel department) {
		this.department = department;
	}

}
