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
<title>Courses</title>
</head>
<body>
<%

	CourseService courseService = new CourseServiceImpl();
	List<CourseModel> courses = courseService.getAllCourses();

%>
	<jsp:include page="index.jsp" />
	<h1 class="text-center">Courses</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Course Code</th>
				<th>Course Name</th>
				<th>Description</th>
				<th>Faculty</th>
				<th>Department</th>
			</tr>
		</thead>
		<tbody>
		<% for (CourseModel course : courses) { %>
        <tr>
            <td><%= course.getCourseCode() %></td>
            <td><%= course.getCourseName() %></td>
            <td><%= course.getDescription() %></td>
            <td> <%= course.getDepartment().getFaculty().getName() %> </td>
            <td> <%= course.getDepartment().getName() %> </td>
        </tr>
        <% } %>
		</tbody>
	</table>
	<div class="d-flex">
		<a href="course.jsp" class="btn btn-success m-auto">Add Course</a>
	</div> 
</body>
</html>