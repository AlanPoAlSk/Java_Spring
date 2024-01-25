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
	<div class="container d-flex justify-content-around align-items-center">
	 	<div class="container d-flex justify-content-around align-items-center">
	  		<div class="container mt-5">
		   		<h1> <c:out value="${book.bookTitle}"/> </h1>
	   		</div>
	   		<div class="container mt-5 d-flex flex-column align-items-end">
		   		<a href="/books" class="align-self-end"> back to the shelf </a>
	   		</div>
		</div>
	</div>
	<div class="container">
		<c:choose>
			<c:when test="${book.user.id.equals(userId)}">
				<div class="mt-3">
					<p class="lead"> <span style="color:red;"> You </span>  read <span style="color:purple;"><c:out value="${book.bookTitle}"/></span>  by <span style="color:green;"><c:out value="${book.bookAuthor}"/></span>.  </p>
				</div>
				<div class="mt-3 border-bottom">
					<p style="font-size:larger"> Here are your thoughts: </p>			
				</div>				
			</c:when>
			<c:otherwise>
				<div class="mt-3">
					<p class="lead"> <span style="color:red;"><c:out value="${book.user.username}"/> </span>  read <span style="color:purple;"><c:out value="${book.bookTitle}"/></span>  by <span style="color:green;"><c:out value="${book.bookAuthor}"/></span>.  </p>
				</div>
				<div class="mt-3 border-bottom">
					<p style="font-size:larger"> Here are <c:out value="${book.user.username}"/>'s thoughts: </p>			
				</div>
			</c:otherwise>
		</c:choose>
			<div class="mt-3 border-bottom">
				<p class="lead" >" <c:out value="${book.bookThoughts}"/> "</p>			
			</div>
	</div>
	<c:choose>
		<c:when test="${book.user.id.equals(userId)}">
			<div class="container mt-5 d-flex justify-content-end ">
				<a href="/books/${book.id}/edit" class="btn btn-success" style="margin-right:30px;">Edit</a>
				<form action="/books/${book.id}" method="post">
					<input type="hidden" name="_method" value="delete" />
					<button type="submit" class="btn btn-danger">Delete </button>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div></div>
		</c:otherwise>
	</c:choose>
</body>
</html>