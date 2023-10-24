<%@page import="com.auca.serviceImpl.SemesterServiceImpl"%>
<%@page import="com.auca.service.SemesterService"%>
<%@page import="com.auca.model.SemesterModel"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Semester</title>
</head>
<body>
	<jsp:include page="index.jsp" />
	
	<h1 class="text-center">Create a Semester</h1>
	<form action="semester.jsp" id="academicUnitForm" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-4 p-3">
				<label for="name">Semester Name</label> <input type="text"
					class="form-control" name="name" id="name">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Semester Id</label> <input type="text"
					class="form-control" id="code" name="code">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Semester Start Date</label> <input type="date"
					class="form-control" id="startDate" name="startDate">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Semester End Date</label> <input type="date"
					class="form-control" id="endDate" name="endDate">
			</div>
		</div>
		<button type="submit" class="btn btn-primary ms-3">Create Semester</button>
	</form>
</body>
</html>

<% 
	if("POST".equals(request.getMethod())){
		String semName = request.getParameter("name");
		String semId = request.getParameter("code");
		LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
		LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
		
		SemesterModel semester = new SemesterModel();
		
		semester.setSemName(semName);
		semester.setSemId(semId);
		semester.setStartDate(startDate);
		semester.setEndDate(endDate);
		
		SemesterService semesterService = new SemesterServiceImpl();
		semesterService.saveSemester(semester);
		response.sendRedirect("semList.jsp");
	}
%>