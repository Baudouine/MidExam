 <%@page import="com.auca.model.StudentCourseModel"%>
<%@page import="com.auca.serviceImpl.StudentCourseServiceImpl"%>
<%@page import="com.auca.service.StudentCourseService"%>
<%@page import="com.auca.model.CourseModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.CourseServiceImpl"%>
<%@page import="com.auca.service.CourseService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students Per Course</title>
</head>
<body>
<%
	CourseService courseService = new CourseServiceImpl();
	List<CourseModel> courses = courseService.getAllCourses();
%>
<jsp:include page="index.jsp" />
<div class="d-flex">
	<form action="courseStudent.jsp" class="m-auto" id="academicUnitForm" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-12 p-3">
				<label for="name">Choose Course</label>
				<select name="course" id="course" class="form-control">
					<option value="none">-- Select Course --</option>
					<%
						for(CourseModel course : courses){
					%>
					<option value= <%= course.getCourseCode() %> > <%= course.getCourseName() %> </option>
					<% } %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary ms-3">Find Students</button>
	</form>
</div>
<%
	if("POST".equals(request.getMethod())){
		
		CourseModel course = courseService.findById(request.getParameter("course"));
		
		StudentCourseService studentCourseService = new StudentCourseServiceImpl();
		List<StudentCourseModel> studentCourses = studentCourseService.getAllStudentsByCourses(course);
		
%>
			<table class="table">
		<thead>
			<tr>
				<th>Student Id</th>
				<th>Student Name</th>
				<th>Course</th>
			</tr>
		</thead>
		<tbody>
		<% 	for(StudentCourseModel student : studentCourses){ %>
        <tr>
            <td><%= student.getStudent().getRegNo() %></td>
            <td><%= student.getStudent().getName() %></td>
            <td><%= student.getCourse().getCourseName() %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
<%} %>
</body>
</html>