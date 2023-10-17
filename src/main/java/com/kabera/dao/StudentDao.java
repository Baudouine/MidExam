package com.kabera.dao;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.kabera.model.StudentModel;

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

}
