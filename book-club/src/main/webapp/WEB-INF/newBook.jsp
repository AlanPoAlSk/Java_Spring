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
    <title>DashBooks AS</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="container d-flex justify-content-around align-items-center">
	   <div class="container mt-5">
		   <h1>Add a Book to Your Shelf, <c:out value="${username}"/> </h1>
	   </div>
	   <div class="container mt-5 d-flex flex-column align-items-end">
		   <a href="/books" class="align-self-end"> back to the shelf </a>
	   </div>
	</div>
	<div class="container mt-5">
		<form:form action="/books/new" method="POST" modelAttribute="newBook">
		<form:hidden path="user" value="${userId}"/>
			<div>
				<div>
					<form:errors path="bookTitle" class="text-danger"></form:errors>
				</div>
				<form:label path="bookTitle" class="form-label">Title:</form:label>
				<form:input path="bookTitle" class="form-control"></form:input>
			</div>
			<div>
				<div>
					<form:errors path="bookAuthor" class="text-danger"></form:errors>
				</div>
				<form:label path="bookAuthor" class="form-label">Author:</form:label>
				<form:input path="bookAuthor" class="form-control"></form:input>
			</div>
			<div>
				<div>
					<form:errors path="bookThoughts" class="text-danger"></form:errors>
				</div>
				<form:label path="bookThoughts" class="form-label">My Thoughts:</form:label>
				<form:textarea path="bookThoughts" class="form-control"></form:textarea>
			</div>
			<button type="submit" class="btn btn-primary mt-3"> Create</button>
		</form:form>
	</div>
</div>
</body>
</html>