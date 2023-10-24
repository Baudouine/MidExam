<%@page import="com.auca.model.SemesterModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.SemesterServiceImpl"%>
<%@page import="com.auca.service.SemesterService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Semesters</title>
</head>
<body>
	<%

	SemesterService semService = new SemesterServiceImpl();
	List<SemesterModel> semesters = semService.findAllSemesters();

%>
	<jsp:include page="index.jsp" />
	<h1 class="text-center">Semesters</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Semester Name</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>
		</thead>
		<tbody>
		<% for (SemesterModel semester : semesters) { %>
        <tr>
            <td><%= semester.getSemName() %></td>
            <td><%= semester.getStartDate() %></td>
            <td><%= semester.getEndDate() %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
	<div class="d-flex">
		<a href="semCourse.jsp" class="btn btn-success m-auto">Add Courses</a>
	</div>
</body>
</html>