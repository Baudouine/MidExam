package com.kabera.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
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
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private AcademicUnitModel program;
	
	@OneToMany(mappedBy = "program")
	private List<AcademicUnitModel> faculties;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private AcademicUnitModel faculty;
	
	@OneToMany(mappedBy = "faculty")
	private List<AcademicUnitModel> departments;

}
