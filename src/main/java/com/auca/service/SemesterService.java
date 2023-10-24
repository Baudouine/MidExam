package com.auca.service;
import java.util.List;

import com.auca.model.SemesterModel;

public interface SemesterService {
	void saveSemester(SemesterModel semester);
	List<SemesterModel> findAllSemesters();
	SemesterModel findById(String id);
	void updateSemester(SemesterModel semester);
}
