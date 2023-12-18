<%@page import="com.auca.model.CourseModel"%>
<%@page import="com.auca.serviceImpl.CourseServiceImpl"%>
<%@page import="com.auca.service.CourseService"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.StudentRegistrationServiceImpl"%>
<%@page import="com.auca.service.StudentRegistrationService"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.auca.model.StudentRegistrationModel"%>
<%@page import="com.auca.model.SemesterModel"%>
<%@page import="com.auca.serviceImpl.SemesterServiceImpl"%>
<%@page import="com.auca.service.SemesterService"%>
<%@page import="com.auca.serviceImpl.StudentServiceImpl"%>
<%@page import="com.auca.service.StudentService"%>
<%@page import="com.auca.model.StudentModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
</head>
<body>
<%
	StudentService studentService = new StudentServiceImpl();
	List<StudentModel> students = studentService.getAllStudents();
	
	SemesterService semesterService = new SemesterServiceImpl();
	List<SemesterModel> semesters = semesterService.findAllSemesters();
%>

	<jsp:include page="index.jsp" />
	<h1 class="text-center">Create Student Registration</h1>
	<form action="studentRegistration.jsp" id="registrationForm" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-4 p-3">
				<label for="id">Registration Id</label> <input type="text"
					class="form-control" name="id" id="id">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="regDate">Registration Date</label> <input type="date"
					class="form-control" id="regDate" name="regDate">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="student">Choose Student</label> 
				<select name="student" id="student" class="form-control">
					<option value="none">-- Select Student --</option>
					<%
						for(StudentModel student : students){
					%>
					<option value= <%= student.getRegNo() %> > <%= student.getName() %> </option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="semester">Choose Semester</label> 
				<select name="semester" id="semester" class="form-control">
					<option value="none">-- Select Semester --</option>
					<%
						for(SemesterModel semester : semesters){
					%>
					<option value= <%= semester.getSemId() %> > <%= semester.getSemName() %> </option>
					<% } %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary ms-3">Create Registration</button>
	</form>
</body>
</html>

<%
	if("POST".equals(request.getMethod())){
		String regId = request.getParameter("id");
		
		String regDate = request.getParameter("regDate");
		LocalDate date = LocalDate.parse(regDate);
		
		String studentCode = request.getParameter("student");
		String semCode = request.getParameter("semester");
		
		StudentModel student = studentService.findById(studentCode);
		
		SemesterModel semester = semesterService.findById(semCode);
		
		StudentRegistrationModel registration = new StudentRegistrationModel();
		registration.setRegId(regId);
		registration.setRegDate(date);
		registration.setSemester(semester);
		registration.setStudent(student);
		
		StudentRegistrationService regService = new StudentRegistrationServiceImpl();
		regService.saveRegistration(registration);
		
		response.sendRedirect("regList.jsp");
	}
%>
















