<%@page import="com.auca.model.StudentCourseModel"%>
<%@page import="com.auca.model.SemesterModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.StudentCourseServiceImpl"%>
<%@page import="com.auca.service.StudentCourseService"%>
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

	StudentCourseService studentCourseService = new StudentCourseServiceImpl();
	List<StudentCourseModel> studentCourses = studentCourseService.getAllStudentCourses();

%>
	<jsp:include page="index.jsp" />
	<h1 class="text-center">Students & Courses</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Student Id</th>
				<th>Student Name</th>
				<th>Course Name</th>
			</tr>
		</thead>
		<tbody>
		<% for (StudentCourseModel studentCourse : studentCourses) { %>
        <tr>
            <td><%= studentCourse.getStudent().getRegNo() %></td>
            <td><%= studentCourse.getStudent().getName() %></td>
            <td><%= studentCourse.getCourse().getCourseName() %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
	<div class="d-flex">
		<a href="studentCourse.jsp" class="btn btn-success m-auto">Add Another Courses</a>
	</div>
</body>
</html>