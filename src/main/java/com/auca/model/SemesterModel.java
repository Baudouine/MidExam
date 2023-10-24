package com.auca.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class SemesterModel {
	
	@Id
	@Column(name = "sem_id")
	private String semId;
	
	@Column(name="semester_name")
	private String semName;
	
	@Column(name = "start_date")
	private LocalDate startDate;
	
	@Column(name = "end_date")
	private LocalDate endDate;
	
	@ManyToMany
	@JoinTable(name = "tbl_courses_semesters",
		joinColumns = @JoinColumn(name = "semester_id"),
		inverseJoinColumns = @JoinColumn(name = "course_id")
			)
	private List<CourseModel> courses = new ArrayList<CourseModel>();
	
	@OneToMany(mappedBy = "semester")
	private List<StudentRegistrationModel> students = new ArrayList<>();

	public String getSemId() {
		return semId;
	}

	public void setSemId(String semId) {
		this.semId = semId;
	}

	public String getSemName() {
		return semName;
	}

	public void setSemName(String semName) {
		this.semName = semName;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public List<CourseModel> getCourses() {
		return courses;
	}

	public void setCourses(List<CourseModel> courses) {
		this.courses = courses;
	}

	public List<StudentRegistrationModel> getStudents() {
		return students;
	}

	public void setStudents(List<StudentRegistrationModel> students) {
		this.students = students;
	}
	
	

}
