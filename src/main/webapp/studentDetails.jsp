<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatterBuilder"%>
<%@page import="com.auca.model.StudentModel"%>
<%@page import="com.auca.serviceImpl.StudentServiceImpl"%>
<%@page import="com.auca.service.StudentService"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.auca.serviceImpl.AcademicUnitServiceImpl"%>
<%@page import="com.auca.model.AcademicUnitModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.service.AcademicUnitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student</title>
</head>
<body>

<%

	AcademicUnitService unitService = new AcademicUnitServiceImpl();
	List<AcademicUnitModel> units = unitService.findByUnitType("DEPARTMENT");

%>
	<jsp:include page="index.jsp" />
	<h1 class="text-center">Create Student</h1>
	
	<form action="studentDetails.jsp" method="POST" id="academicUnitForm">
		<div class="form-row align-items-center">
			<div class="form-group col-md-4 p-3">
				<label for="name">Student Name</label> <input type="text"
					class="form-control" name="name" id="name" required>
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Student Code</label> <input type="text"
					class="form-control" id="code" name="code" required>
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="dob">Date of Birth</label> <input type="date"
					class="form-control" id="dob" name="dob" required>
			</div>
			<div class="form-group col-md-4 p-3">
				<label>Department</label> <select name="dept"
					class="form-control" id="unitType">
					<option value="none">-- Select Department --</option>
					<%for(AcademicUnitModel unit : units){ %>
						<option value= <%= unit.getCode()%> > <%= unit.getName() %> </option>
					<%} %>
				</select>
			</div>
		</div>

		<button type="submit" class="btn btn-primary ms-3">Create Student</button>
	</form>
</body>
</html>

<%
	if("POST".equalsIgnoreCase(request.getMethod())){
		StudentService studentService = new StudentServiceImpl();
		StudentModel student = new StudentModel();
		
		String studentName = request.getParameter("name");
		String studentCode = request.getParameter("code");
		
		String dob = request.getParameter("dob");
		LocalDate localDate = LocalDate.parse(dob);
		
		String department = request.getParameter("dept");
		
		student.setName(studentName);
		student.setRegNo(studentCode);
		student.setDateOfBirth(localDate);
		
		AcademicUnitModel unit = unitService.findById(department);
		student.setDepartment(unit);
		
		studentService.saveStudent(student);
		
		response.sendRedirect("studentList.jsp");
	}

%>
















