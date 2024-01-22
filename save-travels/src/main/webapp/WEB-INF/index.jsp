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
<title>Save Travels AS AS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Save Travels</h1>
		<table class="table table-border">
			<thead>
				<tr class="border border-3 text-center">
					<!-- <th>Id</th> -->
					<th class="border border-dark border-right-3 border-3">Expense</th>
					<th class="border border-dark border-right-3 border-3">Vendor</th>
					<th class="border border-dark border-right-3 border-3">Amount</th>
					<th class="border border-dark border-right-3 border-3">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="saveTravel" items="${saveTravels}">
					<tr class="text-center">
						
						<td class="border border-right-3"> <a href="/expenses/${saveTravel.id}"><c:out value="${saveTravel.expenseName}"/></a>  </td>
						<td class="border border-right-3"> <c:out value="${saveTravel.vendor}"/> </td>
						<td class="border border-right-3">$ <c:out value="${saveTravel.amount}"/> </td>
						<td class="d-flex align-items-center justify-content-around"> <a href="/expenses/edit/${saveTravel.id}"> Edit </a> 
							<form action="/expenses/delete/${saveTravel.id}" method="post">
						    <input type="hidden" name="_method" value="delete">
						    <input class="btn btn-danger" type="submit" value="Delete">
							</form> 
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container mt-5">
		<h1>Add an expense:</h1>
		<form:form class="row g-3" action="/expenses" method="post" modelAttribute="newExpense">
			<div class="mb-4">
				<form:errors class="text-danger" path="expenseName"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="expenseName"> Expense Name:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="expenseName"/>
				</div>
			</div>
			<div class=" mb-4">
				<form:errors class="text-danger" path="vendor"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="vendor"> Vendor:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="vendor"/>
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="amount"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="amount"> Amount:</form:label>
					<form:input class="form-control form-control-sm w-75" type="number" step="any" path="amount"/>
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="description"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="description">Description:</form:label>
					<form:textarea class="form-control form-control-sm w-75" path="description"/>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-success" type="submit">Submit</button>
			</div>
		</form:form>
	</div>
</body>
</html>