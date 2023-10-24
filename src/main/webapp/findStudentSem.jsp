<%@page import="com.auca.serviceImpl.StudentRegistrationServiceImpl"%>
<%@page import="com.auca.service.StudentRegistrationService"%>
<%@page import="com.auca.model.StudentRegistrationModel"%>
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="index.jsp" />
<%
	SemesterService semService = new SemesterServiceImpl();
	List<SemesterModel> semesters = semService.findAllSemesters();
%>

<div class="d-flex">
	<form action="findStudentSem.jsp" class="m-auto" id="academicUnitForm" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-12 p-3">
				<label for="name">Choose Semester</label>
				<select name="sem" id="sem" class="form-control">
					<option value="none">-- Select Semester --</option>
					<%
						for(SemesterModel semester : semesters){
					%>
					<option value= <%= semester.getSemId() %> > <%= semester.getSemName() %> </option>
					<% } %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary ms-3">Find Students</button>
	</form>
</div>
<%
	if("POST".equals(request.getMethod())){
		StudentRegistrationService regService = new StudentRegistrationServiceImpl();
		
		SemesterModel sem = semService.findById(request.getParameter("sem"));
		
		
		List<StudentRegistrationModel> regs = regService.getStudentAndSemester(sem);
		
%>
			<table class="table">
		<thead>
			<tr>
				<th>Student Id</th>
				<th>Student Name</th>
				<th>Semester</th>
			</tr>
		</thead>
		<tbody>
		<% 	for(StudentRegistrationModel reg : regs){ %>
        <tr>
            <td><%= reg.getStudent().getRegNo() %></td>
            <td><%= reg.getStudent().getName() %></td>
            <td><%= reg.getSemester().getSemName() %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
<%} %>

</body>
</html>