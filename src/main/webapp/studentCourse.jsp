<%@page import="com.auca.model.StudentRegistrationModel"%>
<%@page import="com.auca.serviceImpl.StudentRegistrationServiceImpl"%>
<%@page import="com.auca.service.StudentRegistrationService"%>
<%@page import="com.auca.service.StudentCourseService"%>
<%@page import="com.auca.serviceImpl.StudentCourseServiceImpl"%>
<%@page import="com.auca.model.StudentCourseModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.auca.model.CourseModel"%>
<%@page import="com.auca.serviceImpl.CourseServiceImpl"%>
<%@page import="com.auca.service.CourseService"%>
<%@page import="com.auca.model.StudentModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.StudentServiceImpl"%>
<%@page import="com.auca.service.StudentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	StudentRegistrationService studentRegService = new StudentRegistrationServiceImpl();
	List<StudentRegistrationModel> students = studentRegService.allRegistration();
	
	CourseService courseService = new CourseServiceImpl();
	List<CourseModel> courses = courseService.getAllCourses();
%>

<jsp:include page="index.jsp" />

<h1 class="text-center">Assign Student Courses</h1>
	<form action="studentCourse.jsp" id="studentCourse" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-5 p-3">
				<label for="name">Choose Student</label>
				<select name="students" id="students" class="form-control">
					<option value="none">-- Select Student --</option>
					<%
						for(StudentRegistrationModel student : students){
					%>
					<option value= <%= student.getStudent().getRegNo() %> > <%= student.getStudent().getName() %> </option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-5 p-3">
				<label for="name">Choose Course</label>
				<select name="courses" id="courses" class="form-control">
					<option value="none">-- Select Course --</option>
					<%
						for(CourseModel course : courses){
					%>
					<option value= <%= course.getCourseCode() %> > <%= course.getCourseName() %> </option>
					<% } %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary ms-3">Add Course to Student</button>
	</form>
</body>
</html>

<%
	if("POST".equals(request.getMethod())){
		
		StudentService studentService = new StudentServiceImpl();
		StudentModel student = studentService.findById(request.getParameter("students"));
		System.out.println(request.getParameter("students"));
		CourseModel course = courseService.findById(request.getParameter("courses"));
		System.out.println(request.getParameter("courses"));
		
		StudentCourseModel studentCourse = new StudentCourseModel();
		
		studentCourse.setResults(0.00);
		studentCourse.setStudent(student);
		studentCourse.setCourse(course);
		
		StudentCourseService studentCourseService = new StudentCourseServiceImpl();
		studentCourseService.saveStudentCourse(studentCourse);
		
		response.sendRedirect("studentCourseList.jsp");
	}
%>

















