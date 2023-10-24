package com.auca.dao;

import java.util.List;

import org.hibernate.query.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.auca.model.CourseModel;

public class CourseDao {

	public void saveCourse(CourseModel course) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Transaction tr = ss.beginTransaction();
			ss.save(course);
			tr.commit();
			ss.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<CourseModel> getAllCourses() {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			List<CourseModel> courses = ss.createQuery("from CourseModel").list();
			return courses;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}

	public CourseModel findById(String id) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Query query = ss.createQuery("select course from CourseModel course where course.courseCode = :id");
			query.setParameter("id", id);
			return (CourseModel) query.uniqueResult();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}
	
	

}
