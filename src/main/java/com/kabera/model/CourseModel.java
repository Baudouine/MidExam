package com.kabera.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
}
