package com.auca.dao;

import org.hibernate.query.Query;

import com.auca.model.AcademicUnitModel;
import com.auca.model.EAcademicUnit;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.boot.jaxb.cfg.spi.JaxbCfgEventTypeEnum;

public class AcademicUnitDao {
	
	public void saveUnit(AcademicUnitModel unit) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Transaction tr = ss.beginTransaction();
			ss.save(unit);
			tr.commit();
			ss.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public AcademicUnitModel findUnitByName(String name) {
		Session ss = HibernateUtil.getSession().openSession();
		try {
			Query query = ss.createQuery("select unit from AcademicUnitModel unit where unit.name = :name");
			query.setParameter("name", name);
			AcademicUnitModel unit = (AcademicUnitModel) query.uniqueResult();
			ss.close();
			return unit;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<AcademicUnitModel> findAllUnits() {
		Session ss = HibernateUtil.getSession().openSession();
		List<AcademicUnitModel> units = ss.createQuery("from AcademicUnitModel").list();
		return units;
	}
	
	public List<AcademicUnitModel> findByUnitType(String type){
		Session ss = HibernateUtil.getSession().openSession();
		Query query = ss.createQuery("select unit from AcademicUnitModel unit where unit.academicUnit = :type");
		query.setParameter("type", EAcademicUnit.valueOf(type));
		return query.list();
	}

	public AcademicUnitModel findById(String id) {
		Session ss = HibernateUtil.getSession().openSession();
		Query query = ss.createQuery("select unit from AcademicUnitModel unit where unit.code = :id");
		query.setParameter("id", id);
		return (AcademicUnitModel) query.uniqueResult();
	}

}
