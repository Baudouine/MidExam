<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student - Department</title>
</head>
<body>
	<form action="semester.jsp" id="academicUnitForm" method="POST">
		<div class="form-row align-items-center">
			<div class="form-group col-md-4 p-3">
				<label for="name">Semester Name</label> <input type="text"
					class="form-control" name="name" id="name">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Semester Id</label> <input type="text"
					class="form-control" id="code" name="code">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Semester Start Date</label> <input type="date"
					class="form-control" id="startDate" name="startDate">
			</div>
			<div class="form-group col-md-4 p-3">
				<label for="code">Semester End Date</label> <input type="date"
					class="form-control" id="endDate" name="endDate">
			</div>
		</div>
		<button type="submit" class="btn btn-primary ms-3">Create Semester</button>
	</form>
</body>
</html>