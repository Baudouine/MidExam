package com.auca.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_academic_unit")
public class AcademicUnitModel {
	
	@Id
	@Column(name = "unit_code")
	private String code;
	
	@Column(name = "unit_name")
	private String name;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "academic_unit")
	private EAcademicUnit academicUnit;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private AcademicUnitModel program;
	
	@OneToMany(mappedBy = "program")
	private List<AcademicUnitModel> faculties;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private AcademicUnitModel faculty;
	
	@OneToMany(mappedBy = "faculty")
	private List<AcademicUnitModel> departments;
	
	@OneToMany(mappedBy = "department")
	private List<StudentModel> students;
	
	@OneToMany(mappedBy = "department")
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

	public EAcademicUnit getAcademicUnit() {
		return academicUnit;
	}

	public void setAcademicUnit(EAcademicUnit academicUnit) {
		this.academicUnit = academicUnit;
	}

	public AcademicUnitModel getProgram() {
		return program;
	}

	public void setProgram(AcademicUnitModel program) {
		this.program = program;
	}

	public List<AcademicUnitModel> getFaculties() {
		return faculties;
	}

	public void setFaculties(List<AcademicUnitModel> faculties) {
		this.faculties = faculties;
	}

	public AcademicUnitModel getFaculty() {
		return faculty;
	}

	public void setFaculty(AcademicUnitModel faculty) {
		this.faculty = faculty;
	}

	public List<AcademicUnitModel> getDepartments() {
		return departments;
	}

	public void setDepartments(List<AcademicUnitModel> departments) {
		this.departments = departments;
	}

	public List<StudentModel> getStudents() {
		return students;
	}

	public void setStudents(List<StudentModel> students) {
		this.students = students;
	}

	public List<CourseModel> getCourses() {
		return courses;
	}

	public void setCourses(List<CourseModel> courses) {
		this.courses = courses;
	}

	@Override
	public String toString() {
		return "AcademicUnitModel [code=" + code + ", name=" + name + ", academicUnit=" + academicUnit + ", program="
				+ program + ", faculties=" + faculties + ", faculty=" + faculty + ", departments=" + departments
				+ ", student=" + students + ", courses=" + courses + "]";
	}
	
	
	

}
