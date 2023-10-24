package com.auca.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_student_reg")
public class StudentRegistrationModel {

	@Id
	@Column(name = "reg_id")
	private String regId;
	
	@Column(name = "reg_date")
	private LocalDate regDate;
	
	@ManyToOne
	@JoinColumn(name = "student_id")
	private StudentModel student;
	
	@ManyToOne
	@JoinColumn(name = "semester_id")
	private SemesterModel semester;

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public LocalDate getRegDate() {
		return regDate;
	}

	public void setRegDate(LocalDate regDate) {
		this.regDate = regDate;
	}

	public StudentModel getStudent() {
		return student;
	}

	public void setStudent(StudentModel student) {
		this.student = student;
	}

	public SemesterModel getSemester() {
		return semester;
	}

	public void setSemester(SemesterModel semester) {
		this.semester = semester;
	}
}
