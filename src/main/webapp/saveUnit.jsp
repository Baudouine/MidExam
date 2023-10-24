<%@page import="com.auca.serviceImpl.AcademicUnitServiceImpl"%>
<%@page import="com.auca.model.EAcademicUnit"%>
<%@page import="com.auca.model.AcademicUnitModel"%>
<%@page import="com.auca.service.AcademicUnitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<% 
	AcademicUnitService unitService = new AcademicUnitServiceImpl();
	AcademicUnitModel unit = new AcademicUnitModel();

	String unitName = request.getParameter("name");
	String unitCode = request.getParameter("code");
	String unitType = request.getParameter("unitType");
	EAcademicUnit unitValue = EAcademicUnit.valueOf(unitType);
	
	if(unitType.equals("FACULTY")){
		String parentName = request.getParameter("prog");
		unit.setProgram(unitService.findById(parentName));
	}else if(unitType.equals("DEPARTMENT")){
		String parentName = request.getParameter("dept");
		unit.setFaculty(unitService.findById(parentName));
	}

	unit.setCode(unitCode);
	unit.setName(unitName);
	unit.setAcademicUnit(unitValue);
	
	unitService.saveAcademicUnit(unit);
	response.sendRedirect("unitList.jsp");
	
%>