package com.auca.dao;

import java.util.Properties;


import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.auca.model.*;



public class HibernateUtil {
	
	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSession() {
		
			try {
				Configuration configuration = new Configuration();

				Properties settings = new Properties();
				settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://localhost:3306/auca_db");
				settings.put(Environment.USER, "root");
				settings.put(Environment.PASS, "root");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");

				settings.put(Environment.SHOW_SQL, "true");

				settings.put(Environment.HBM2DDL_AUTO, "update");
				
				configuration.setProperties(settings);
				configuration.addAnnotatedClass(StudentModel.class);
				configuration.addAnnotatedClass(StudentRegistrationModel.class);
				configuration.addAnnotatedClass(TeacherModel.class);
				configuration.addAnnotatedClass(AcademicUnitModel.class);
				configuration.addAnnotatedClass(CourseModel.class);
				configuration.addAnnotatedClass(SemesterModel.class);
				configuration.addAnnotatedClass(StudentCourseModel.class);
				
				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(configuration.getProperties()).build();
				System.out.println("Hibernate Java Config serviceRegistry created");
				sessionFactory = configuration.buildSessionFactory(serviceRegistry);
				return sessionFactory;

			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return sessionFactory;
	}

}