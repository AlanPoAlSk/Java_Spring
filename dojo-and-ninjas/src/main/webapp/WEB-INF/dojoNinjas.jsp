<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dojo Ninjas </title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
   <div class="container mt-5">
   	<h1> <c:out value="${dojo.dojoName}"></c:out> Ninjas  </h1>
   	<table class="table">
   		<thead>
   			<tr>
   				<th>First Name</th>
   				<th>Last Name</th>
   				<th>Age</th>
   			</tr>
   		</thead>
   		<tbody>
   			<c:forEach var="ninja" items="${ninjaList}">
   				<tr>
   					<td> <c:out value="${ninja.ninjaFirstName}"/> </td>
   					<td> <c:out value="${ninja.ninjaLastName}"/> </td>
   					<td> <c:out value="${ninja.ninjaAge}"/> </td>
   				</tr>
   			</c:forEach>
   		</tbody>
   	</table>
   </div>
</body>
</html>