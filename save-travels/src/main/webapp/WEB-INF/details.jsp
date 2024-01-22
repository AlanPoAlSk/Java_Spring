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
<title>Save Travels AS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex justify-content-between">
			<h1>Expense Detail</h1>
			<a href="/"> Go Back</a>
		</div>
		<div class="mb-4">
			<p> Expense Name: <c:out value="${expense.expenseName}"></c:out> </p>
		</div>
		<div class="mb-4">
			<p> Expense Description: <c:out value="${expense.description}"></c:out> </p>	
		</div>
		<div class=" mb-4">
			<p> Vendor: <c:out value="${expense.vendor}"></c:out> </p>
		</div>
		<div class="mb-4">
			<p> Amount Spent: $<c:out value="${expense.amount}"></c:out> </p>
		</div>
		
	</div>
</body>
</html>