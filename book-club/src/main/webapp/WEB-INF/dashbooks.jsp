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
	   <div class="container mt-5">
		   <h1>Welcome, <c:out value="${username}"/>!</h1>
		   <div>
		   		<p>Books from everyone's shelves:  </p>
		   </div>
	   
	   </div>
	   <div class="container mt-5 d-flex flex-column align-items-end">
		   <a href="/logout" class="align-self-end"> logout </a>
		   <div class="mt-2">
		   		<a href="/books/new" style="white-space: nowrap;">+ Add a book to my shelf!</a>
		   </div>
	   	
	   </div>
	</div>
		   <div class="container mt-3">
			   <table class="table">
			   	 <thead>
			   	 	<tr>
			   	 		<th>ID</th>
			   	 		<th>Title</th>
			   	 		<th>Author Name</th>
			   	 		<th>Posted by</th>
			   	 	</tr>
			   	 </thead>
			   	 <tbody>
			   	 	<c:forEach var="book" items="${bookList}">
			   	 		<tr>
			   	 			<td><c:out value="${book.id}" /></td>
			   	 			<td><a href="/books/${book.id}"><c:out value="${book.bookTitle}"/></a> </td>
			   	 			<td><c:out value="${book.bookAuthor}"/></td>
			   	 			<td><c:out value="${book.user.username}"/></td>
			   	 		</tr>
			   	 	</c:forEach>
			   	 </tbody>
			   </table>
		   </div>
</body>
</html>