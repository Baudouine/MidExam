package com.auca.dao;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.auca.model.SemesterModel;

public class SemesterDao {

	public void saveSemester(SemesterModel semester) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Transaction tr = ss.beginTransaction();
			ss.save(semester);
			tr.commit();
			ss.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<SemesterModel> findAllSemesters() {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			List<SemesterModel> semesters = ss.createQuery("from SemesterModel").list();
			return semesters;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}

	public SemesterModel findById(String id) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Query query = ss.createQuery("select semester from SemesterModel semester where semester.semId = :id");
			query.setParameter("id", id);
			return (SemesterModel) query.uniqueResult();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}

	public void updateSemester(SemesterModel semester) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Transaction tr = ss.beginTransaction();
			ss.update(semester);
			tr.commit();
			ss.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
