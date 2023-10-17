package com.kabera.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "tbl_student")
public class StudentModel {
	
	@Id
	@Column(name = "reg_number")
	private String regNo;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "dob")
	private Date dateOfBirth;
	
	@OneToMany(mappedBy = "student")
	private List<StudentCourseModel> studentCourse = new ArrayList<>();
	
	@OneToMany(mappedBy = "student")
	private List<StudentRegistrationModel> studentRegistration = new ArrayList<>();

}
