<%@page import="java.util.ArrayList"%>
<%@page import="com.auca.model.CourseModel"%>
<%@page import="com.auca.serviceImpl.CourseServiceImpl"%>
<%@page import="com.auca.service.CourseService"%>
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
<title>Semester - course</title>
</head>
<body>
<%

	SemesterService semService = new SemesterServiceImpl();
	List<SemesterModel> semesters = semService.findAllSemesters();
	
	CourseService courseService = new CourseServiceImpl();
	List<CourseModel> courses = courseService.getAllCourses();
%>
<jsp:include page="index.jsp" />
	<h1 class="text-center">Add Course to Semester</h1>
	
	<form action="semCourse.jsp" method="POST" id="semesterCourseForm">
		<div class="form-row align-items-center">
			<div class="form-group col-md-4 p-3">
				<label>Choose Semester</label> 
				<select name="sem" class="form-control" id="sem">
					<option value="none">-- Select Semester --</option>
					<%for(SemesterModel semester : semesters){ %>
						<option value= <%= semester.getSemId() %> > <%= semester.getSemName() %> </option>
					<%} %>
				</select>
			</div>
			<div class="form-group col-md-4 p-3">
				<label>Choose Course</label> 
				<select name="courseCode" class="form-control" id="courseCode">
					<option value="none">-- Select Course --</option>
					<%for(CourseModel course : courses){ %>
						<option value=<%= course.getCourseCode() %>> <%= course.getCourseName() %> </option>
					<%} %>
				</select>
			</div>
		</div>

		<button type="submit" class="btn btn-primary ms-3">Create Student</button>
	</form>
</body>
</html>

<%
	if("POST".equals(request.getMethod())){
		
		System.out.println(request.getParameter("sem"));	
		System.out.println(request.getParameter("courseCode"));
		
		SemesterModel sem = semService.findById(request.getParameter("sem"));
		CourseModel course = courseService.findById(request.getParameter("courseCode"));
		
		System.out.println(sem.toString());
		System.out.println(course.toString());
		
		List<CourseModel> coursesForSem = new ArrayList<>();
		coursesForSem.add(course);
		sem.setCourses(coursesForSem);
		
		semService.updateSemester(sem);
	}
%>















