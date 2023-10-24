<%@page import="java.util.ArrayList"%>
<%@page import="com.auca.model.StudentRegistrationModel"%>
<%@page import="com.auca.serviceImpl.StudentRegistrationServiceImpl"%>
<%@page import="com.auca.service.StudentRegistrationService"%>
<%@page import="com.auca.model.AcademicUnitModel"%>
<%@page import="com.auca.serviceImpl.AcademicUnitServiceImpl"%>
<%@page import="com.auca.service.AcademicUnitService"%>
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
	AcademicUnitService unitService = new AcademicUnitServiceImpl();
	List<AcademicUnitModel> units = unitService.findByUnitType("DEPARTMENT");

	SemesterService semService = new SemesterServiceImpl();
	List<SemesterModel> semesters = semService.findAllSemesters();
%>

<div class="d-flex">
	<form action="studentDeptSem.jsp" class="m-auto" id="academicUnitForm" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-12 p-3">
				<label for="sem">Choose Semester</label>
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
		<div class="form-row align-items-center">
			<div class="form-group col-md-12 p-3">
				<label for="dept">Choose Department</label>
				<select name="dept" id="dept" class="form-control">
					<option value="none">-- Select Department --</option>
					<%
						for(AcademicUnitModel department : units){
					%>
					<option value= <%= department.getCode() %> > <%= department.getName() %> </option>
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
		AcademicUnitModel dept = unitService.findById(request.getParameter("dept"));
		
		
		List<StudentRegistrationModel> regs = regService.getStudentAndSemester(sem);
		List<StudentRegistrationModel> deptStudents = new ArrayList<>();
		
		for(StudentRegistrationModel reg : regs){
			if(reg.getStudent().getDepartment().getCode().equals(dept.getCode())){
				deptStudents.add(reg);
			}
		}
		
%>
			<table class="table">
		<thead>
			<tr>
				<th>Student Id</th>
				<th>Student Name</th>
				<th>Department</th>
				<th>Semester</th>
			</tr>
		</thead>
		<tbody>
		<% 	for(StudentRegistrationModel reg : deptStudents){ %>
        <tr>
            <td><%= reg.getStudent().getRegNo() %></td>
            <td><%= reg.getStudent().getName() %></td>
            <td><%= reg.getStudent().getDepartment().getName() %></td>
            <td><%= reg.getSemester().getSemName() %></td>
        </tr>
        <% } %>
		</tbody>
	</table>
<%} %>

</body>
</html>