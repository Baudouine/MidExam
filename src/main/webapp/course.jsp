<%@page import="com.auca.dao.CourseDao"%>
<%@page import="com.auca.model.CourseModel"%>
<%@page import="com.auca.model.AcademicUnitModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.AcademicUnitServiceImpl"%>
<%@page import="com.auca.service.AcademicUnitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Course</title>
</head>
<body>
	<jsp:include page="index.jsp" />
	
	<h1 class="text-center">Create a Course</h1>
	<form action="course.jsp" id="academicUnitForm" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-4 p-3">
				<label for="name">Course Name</label> <input type="text"
					class="form-control" name="name" id="name">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Course Code</label> <input type="text"
					class="form-control" id="code" name="code">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="descr">Course Description</label> 
				<input type="text" class="form-control" id="descr" name="descr">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="dept">Course Department</label> 
				<select name="dept" id="dept" class="form-control">
					<option value="none">-- Select Department --</option>
					<%
						AcademicUnitService unitService = new AcademicUnitServiceImpl();
						List<AcademicUnitModel> departments = unitService.findByUnitType("DEPARTMENT");
						for(AcademicUnitModel dept : departments){
					%>
					<option value= <%= dept.getCode() %> > <%= dept.getName() %> - <%= dept.getFaculty().getName() %> </option>
					<% } %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary ms-3">Create Course</button>
	</form>
</body>
</html>

<%
	if("POST".equals(request.getMethod())){
		
		String courseName = request.getParameter("name");
		String courseCode = request.getParameter("code");
		String description = request.getParameter("descr");
		String department = request.getParameter("dept");
		
		AcademicUnitService deptService = new AcademicUnitServiceImpl();
		AcademicUnitModel dept = deptService.findById(department);
		
		CourseModel course = new CourseModel();
		course.setCourseCode(courseCode);
		course.setCourseName(courseName);
		course.setDescription(description);
		course.setDepartment(dept);
		
		CourseDao courseDao = new CourseDao();
		courseDao.saveCourse(course);
		response.sendRedirect("courseList.jsp");
	}
%>






























