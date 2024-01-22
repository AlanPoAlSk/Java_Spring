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
<title>Save Travels edit AS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
	<div class="container mt-5">
	<div class="d-flex justify-content-between align-items-center">
		<h1 class="text-success">Edit Expense:</h1>
		<a href="/">Go Back</a>
	</div>
		<form:form class="row g-3" action="/expenses/edit/${expense.id}" method="POST" modelAttribute="expense">
			<input type="hidden" name="_method" value="put">
			<div class="mb-4">
				<form:errors class="text-danger" path="expenseName"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="expenseName"> Expense Name:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="expenseName" />
				</div>
			</div>
			<div class=" mb-4">
				<form:errors class="text-danger" path="vendor"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="vendor"> Vendor:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="vendor" />
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="amount"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="amount"> Amount:</form:label>
					<form:input class="form-control form-control-sm w-75" type="number" path="amount" />
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="description"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="description">Description:</form:label>
					<form:textarea class="form-control form-control-sm w-75" path="description" />
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-primary" type="submit">Submit</button>
			</div>
		</form:form>
	</div>
</body>
</html>