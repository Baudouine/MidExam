<%@page import="com.auca.model.AcademicUnitModel"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.serviceImpl.AcademicUnitServiceImpl"%>
<%@page import="com.auca.service.AcademicUnitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.auca.model.EAcademicUnit"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Academic Unit</title>
</head>
<body>



	<jsp:include page="index.jsp" />
	<h1 class="text-center">Academic Unit Registration</h1>
	<form action="saveUnit.jsp" id="academicUnitForm">
		<div class="form-row align-items-center">
			<div class="form-group col-md-4 p-3">
				<label for="name">Unit Name</label> <input type="text"
					class="form-control" name="name" id="name">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Unit Code</label> <input type="text"
					class="form-control" id="code" name="code">
			</div>
			<div class="form-group col-md-4 p-3">
				<label>Academic Unit Type</label> <select name="unitType"
					class="form-control" id="unitType">
					<option value="none">-- Select Unit Type --</option>
					<c:forEach items="${EAcademicUnit.values()}" var="unitType">
						<option value="${unitType}">${unitType.label}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-md-4 p-3 divHide" id="FACULTY"
				style="display: none;">
				<label for="prog">Program Name</label> 
				<select name="prog" id="prog" class="form-control">
					<option value="none">-- Select Program --</option>
					<%
						AcademicUnitService unitService = new AcademicUnitServiceImpl();
						List<AcademicUnitModel> programs = unitService.findByUnitType("PROGRAM");
						for(AcademicUnitModel program : programs){
					%>
					<option value= <%= program.getCode() %> > <%= program.getName() %> </option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-4 p-3 divHide" id="DEPARTMENT"
				style="display: none;">
				<label for="dept">Faculty Name</label> 
				<select name="dept" id="dept" class="form-control">
					<option value="none">-- Select Faculty --</option>
					<%
						List<AcademicUnitModel> faculties = unitService.findByUnitType("FACULTY");
						for(AcademicUnitModel faculty : faculties){
					%>
					<option value= <%= faculty.getCode() %> > <%= faculty.getName() %> </option>
					<% } %>
				</select>
			</div>
			<div class="form-group col-md-4 p-3 divHide" id="DEFAULT"
				style="display: none;"></div>
		</div>

		<button type="submit" class="btn btn-primary ms-3">Save Unit</button>
	</form>


	<script>
	    const unitTypeSelect = document.getElementById("unitType");
	
	    unitTypeSelect.addEventListener("change", function () {
	    	
	    	const divs = document.querySelectorAll("div[class$='divHide']");
	        divs.forEach(function (div) {
	            div.style.display = "none";
	        });
	    	
	    	const selectedUnitType = unitTypeSelect.value;
	    	
	    	let selectedDiv;
	    	
	    	if(String(selectedUnitType) === "PROGRAM"){
	    		selectedDiv = document.getElementById("DEFAULT");
	    		selectedDiv.style.display = "inline";
	    	}else {
	    		selectedDiv = document.getElementById(String(selectedUnitType));
	    	}
	        
	        selectedDiv.style.display = "block";
	    });
	</script>
</body>
</html>