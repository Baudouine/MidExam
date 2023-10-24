package com.auca.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.auca.model.SemesterModel;
import com.auca.model.StudentRegistrationModel;

public class StudentRegistrationDao {

	public void saveRegistration(StudentRegistrationModel registration) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Transaction tr = ss.beginTransaction();
			ss.save(registration);
			tr.commit();
			ss.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<StudentRegistrationModel> getAllRegistration() {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			List<StudentRegistrationModel> registration = ss.createQuery("from StudentRegistrationModel").list();
			return registration;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<StudentRegistrationModel> getAllStudentAndSemester(SemesterModel semester) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Query query = ss.createQuery("select reg from StudentRegistrationModel reg where reg.semester = :semester");
			query.setParameter("semester", semester);
			return query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
