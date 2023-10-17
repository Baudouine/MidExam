package com.kabera.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table
public class SemesterModel {
	
	@Id
	@Column(name = "sem_id")
	private String semId;
	
	@Column(name = "start_date")
	private LocalDate startDate;
	
	@Column(name = "end_date")
	private LocalDate endDate;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "tbl_courses_semesters",
		joinColumns = @JoinColumn(name = "course_id"),
		inverseJoinColumns = @JoinColumn(name = "semester_id")
			)
	private List<CourseModel> courses = new ArrayList<CourseModel>();
	
	@OneToMany(mappedBy = "semester")
	private List<StudentRegistrationModel> students = new ArrayList<>();

}
