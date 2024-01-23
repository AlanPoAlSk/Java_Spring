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
    <title>Dojo Ninjas</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
   <div class="container mt-5">
   <h1>New Ninja</h1>
   <div>Selected Dojo ID: ${newNinja.dojo.id}</div>
<div>Ninja First Name: ${newNinja.ninjaFirstName}</div>
   <form:form action="/ninjas/new" method="POST" modelAttribute="newNinja">
   		<div class="d-flex mt-3">
   			<form:errors path="dojo" class="text-danger"></form:errors>
   			<form:label path="dojo" class="form-label">Dojo:</form:label>
   			<form:select path="dojo" class="form-select">
   				<c:forEach var="dojo" items="${dojoList}">
   					<option value="${dojo.id}" class="form-option"> <c:out value="${dojo.dojoName}"/> </option>
   				</c:forEach>	
   			</form:select>
   		</div>
   		<div class="d-flex mt-3">
   			<form:label path="ninjaFirstName" class="form-label">First Name:</form:label>
   			<div>
   				<form:input path="ninjaFirstName" type="text" class="form-control"/>
	   			<form:errors path="ninjaFirstName" class="text-danger"></form:errors>
   			</div>
   		</div>
   		<div class="d-flex mt-3">
   			<form:label path="ninjaLastName" class="form-label">Last Name:</form:label>
   			<div>
	   			<form:input path="ninjaLastName" type="text" class="form-control"/>
	   			<form:errors path="ninjaLastName" class="text-danger"></form:errors>
   			</div>
   		</div>
   		<div class="d-flex mt-3 justify-content-start align-items-center">
   			<form:label path="ninjaAge" class="form-label" style="margin-right: 50px">Age:</form:label>
   			<div>
	   			<form:input path="ninjaAge" type="number" class="form-control"/>
	   			<form:errors path="ninjaAge" class="text-danger"></form:errors>
   			</div>
   		</div>
   		<div class="mt-3">
   			<button type="submit" class="btn btn-success" style="margin-left:80px">Create</button>
   		</div>
   </form:form>
   </div>
</body>
</html>