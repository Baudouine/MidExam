package com.auca.dao;


import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.auca.model.StudentModel;

public class StudentDao {
	
	public void saveStudent(StudentModel student) {
		Session ss = HibernateUtil.getSession().openSession();

		Transaction tr = ss.beginTransaction();
		try {

			ss.save(student);

			tr.commit();

			ss.close();
		}catch(Exception e) {
			tr.rollback();
			e.printStackTrace();
		}
	}

	public List<StudentModel> getAllStudents() {
		Session ss = HibernateUtil.getSession().openSession();
		
		try {
			List<StudentModel> students = ss.createQuery("from StudentModel").list();
			return students;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public StudentModel findById(String id) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Query query = ss.createQuery("select student from StudentModel student where student.regNo = :id");
			query.setParameter("id", id);
			return (StudentModel) query.uniqueResult();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
