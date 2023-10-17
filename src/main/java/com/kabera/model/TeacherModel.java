package com.kabera.model;

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
	

}
