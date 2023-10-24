<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="css/bootstrap/dist/css/bootstrap.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand  ms-5" href="index.jsp">AUCA</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item active"><a class="nav-link" href="studentDetails.jsp">Students</a></li>
				<li class="nav-item"><a class="nav-link" href="course.jsp">Courses</a></li>
				<li class="nav-item active"><a class="nav-link" href="#">Teachers</a></li>
				<li class="nav-item"><a class="nav-link"
					href="academicUnit.jsp">Academic Units</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>