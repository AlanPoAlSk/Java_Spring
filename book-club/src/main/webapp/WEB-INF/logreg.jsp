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
    <title>Login and Registration Book Club AS</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container d-flex justify-content-around align-items-center mt-5">
		<div>
			<h1 style="color:purple;">Book Club</h1>
			<p>A place for friends to share thoughts on books.</p>
		</div>
		<div></div>
	</div>
   <div class="container mt-5 d-flex justify-content-around align-items-center">
   		<div>
   			<h1>Register</h1>
   			<div>
   				<form:form action="/register" method="POST" modelAttribute="newUser">
   					<div class="form-group">
	   					<div>
	   						<form:errors path="username" class="text-danger"></form:errors>
	   					</div>
   						<form:label path="username" class="form-label">Username:</form:label>
   						<form:input path="username" class="form-control"/>
   					</div>
   					<div class="form-group">
	   					<div>
	   						<form:errors path="email" class="text-danger"></form:errors>
	   					</div>
   						<form:label path="email" class="form-label">Email:</form:label>
   						<form:input path="email" class="form-control"></form:input>
   					</div>
   					<div class="form-group">
	   					<div>
	   						<form:errors path="password" class="text-danger"></form:errors>
	   					</div>
   						<form:label path="password" class="form-label">Password:</form:label>
   						<form:input path="password" class="form-control"/>
   					</div>
   					<div class="form-group">
	   					<div>
	   						<form:errors path="confirmPassword" class="text-danger"></form:errors>
	   					</div>
   						<form:label path="confirmPassword" class="form-label">Confirm Password:</form:label>
   						<form:input path="confirmPassword" class="form-control"/>
   					</div>
   					<button type="submit" class="btn btn-primary mt-3"> Register </button>
   				</form:form>
   			</div>
   		
   		</div>
   		<div>
   			<h1>Login</h1>
   			<div>
   				<form:form action="/login" method="POST" modelAttribute="newLoginUser">
   					<div class="form-group">
	   					<div>
	   						<form:errors path="email" class="text-danger"></form:errors>
	   					</div>
   						<form:label path="email" class="form-label">Email:</form:label>
   						<form:input path="email" class="form-control"></form:input>
   					</div>
   					<div class="form-group">
	   					<div>
	   						<form:errors path="password" class="text-danger"></form:errors>
	   					</div>
   						<form:label path="password" class="form-label">Password:</form:label>
   						<form:input path="password" type="password" class="form-control"/>
   					</div>
   					<button type="submit" class="btn btn-success mt-3"> Login </button>
   				</form:form>
   			</div>
   		</div>
   		
   </div>
</body>
</html>