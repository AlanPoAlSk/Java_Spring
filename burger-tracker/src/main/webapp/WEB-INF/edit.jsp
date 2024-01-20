<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Burger Tracker edit AS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
	<div class="container mt-5">
	<div class="d-flex justify-content-between align-items-center">
		<h1>Edit Burger:</h1>
		<a href="/">Go Back</a>
	</div>
		<form:form class="row g-3" action="/burgers/edit/${burger.id}" method="POST" modelAttribute="burger">
			<input type="hidden" name="_method" value="put">
			<div class="mb-4">
				<form:errors class="text-danger" path="burgerName"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="burgerName"> Burger Name:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="burgerName" />
				</div>
			</div>
			<div class=" mb-4">
				<form:errors class="text-danger" path="restaurantName"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="restaurantName"> Restaurant Name:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="restaurantName" />
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="rating"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="rating"> Rating:</form:label>
					<form:input class="form-control form-control-sm w-75" type="number" path="rating" />
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="notes"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="notes">Notes:</form:label>
					<form:textarea class="form-control form-control-sm w-75" path="notes" />
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-success" type="submit">Edit</button>
			</div>
		</form:form>
	</div>
</body>
</html>