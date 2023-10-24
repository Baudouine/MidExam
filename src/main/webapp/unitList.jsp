<%@page import="com.auca.model.AcademicUnitModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.AcademicUnitServiceImpl"%>
<%@page import="com.auca.service.AcademicUnitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Academic Units</title>
<link rel="stylesheet" href="css/bootstrap/dist/css/bootstrap.css">
</head>
<body>

<%

	AcademicUnitService unitService = new AcademicUnitServiceImpl();
	List<AcademicUnitModel> units = unitService.findAllUnits();

%>
	<jsp:include page="index.jsp" />
	<h1 class="text-center">Academic Units</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Unit Name</th>
				<th>Unit Type</th>
				<th>Program</th>
				<th>Faculty</th>
			</tr>
		</thead>
		<tbody>
		<% for (AcademicUnitModel academicUnit : units) { %>
        <tr>
            <td><%= academicUnit.getName() %></td>
            <td><%= academicUnit.getAcademicUnit() %></td>
            <td><%= academicUnit.getProgram() != null ? academicUnit.getProgram().getName() : "N/A" %></td>
            <td><%= academicUnit.getFaculty() != null ? academicUnit.getFaculty().getName() : "N/A" %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
</body>
</html>