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
<title>Burger Tracker AS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Burger Tracker</h1>
		<table class="table table-border">
			<thead>
				<tr class="border border-3 text-center">
					<!-- <th>Id</th> -->
					<th class="border border-dark border-right-3 border-3">Burger Name</th>
					<th class="border border-dark border-right-3 border-3">Restaurant Name</th>
					<th class="border border-dark border-right-3 border-3">Rating (out of 5)</th>
					<th class="border border-dark border-right-3 border-3">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="burger" items="${burgers}">
					<tr class="text-center">
						<%-- <td> <c:out value="${burger.id}"/> </td> --%>
						<td class="border border-right-3"> <c:out value="${burger.burgerName}"/> </td>
						<td class="border border-right-3"> <c:out value="${burger.restaurantName}"/> </td>
						<td class="border border-right-3"> <c:out value="${burger.rating}"/> </td>
						<td> <a href="/burgers/edit/${burger.id}"> Edit </a> </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container mt-5">
		<h1>Add a Burger:</h1>
		<form:form class="row g-3" action="/" method="post" modelAttribute="newBurgerReview">
			<div class="mb-4">
				<form:errors class="text-danger" path="burgerName"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="burgerName"> Burger Name:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="burgerName"/>
				</div>
			</div>
			<div class=" mb-4">
				<form:errors class="text-danger" path="restaurantName"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="restaurantName"> Restaurant Name:</form:label>
					<form:input class="form-control form-control-sm w-75" type="text" path="restaurantName"/>
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="rating"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="rating"> Rating:</form:label>
					<form:input class="form-control form-control-sm w-75" type="number" path="rating"/>
				</div>
			</div>
			<div class="mb-4">
				<form:errors class="text-danger" path="notes"/>
				<div class="d-flex justify-content-between">
					<form:label class="form-label" path="notes">Notes:</form:label>
					<form:textarea class="form-control form-control-sm w-75" path="notes"/>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-success" type="submit">Create review</button>
			</div>
		</form:form>
	</div>
</body>
</html>