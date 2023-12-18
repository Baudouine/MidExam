package com.auca.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.auca.model.CourseModel;
import com.auca.model.StudentCourseModel;

public class StudentCourseDao {
	
	public void saveStudentCourse(StudentCourseModel studentCourse) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Transaction tr = ss.beginTransaction();
			ss.save(studentCourse);
			tr.commit();
			ss.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<StudentCourseModel> getAllStudentCourses() {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			List<StudentCourseModel> studentCourses = ss.createQuery("from StudentCourseModel").list();
			return studentCourses;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}

	public List<StudentCourseModel> getStudentsByCourses(CourseModel course) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Query query = ss.createQuery("select studentCourse from StudentCourseModel studentCourse where studentCourse.course = :course");
			query.setParameter("course", course);
			return query.list();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return null;
	}

}
