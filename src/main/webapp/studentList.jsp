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

		StudentService studentService = new StudentServiceImpl();
		List<StudentModel> students = studentService.getAllStudents();

	%>
	<jsp:include page="index.jsp" />
	<h1 class="text-center">AUCA Students</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Student Name</th>
				<th>Student Code</th>
				<th>D.O.B</th>
				<th>Faculty</th>
				<th>Department</th>
			</tr>
		</thead>
		<tbody>
		<% for (StudentModel student : students) { %>
        <tr>
            <td><%= student.getName() %></td>
            <td><%= student.getRegNo() %></td>
            <td><%= student.getDateOfBirth() %></td>
            <td><%= student.getDepartment().getFaculty().getName() %></td>
            <td><%= student.getDepartment().getName() %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
</body>
</html>