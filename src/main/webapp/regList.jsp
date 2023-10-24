<%@page import="com.auca.model.StudentRegistrationModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.StudentRegistrationServiceImpl"%>
<%@page import="com.auca.service.StudentRegistrationService"%>
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

	StudentRegistrationService regService = new StudentRegistrationServiceImpl();
	List<StudentRegistrationModel> registration = regService.allRegistration();

%>
	<jsp:include page="index.jsp" />
	<h1 class="text-center">Semesters</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Registration Id</th>
				<th>Registration Date</th>
				<th>Student</th>
				<th>Semester</th>
			</tr>
		</thead>
		<tbody>
		<% for (StudentRegistrationModel reg : registration) { %>
        <tr>
            <td><%= reg.getRegId() %></td>
            <td><%= reg.getRegDate() %></td>
            <td><%= reg.getStudent().getName() %></td>
            <td><%= reg.getSemester().getSemName() %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
	<div class="d-flex">
		<a href="stuCourse.jsp" class="btn btn-success m-auto">Add Courses</a>
	</div>
</body>
</html>