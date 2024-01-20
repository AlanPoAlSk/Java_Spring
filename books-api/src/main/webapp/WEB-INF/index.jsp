<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books AS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<h1 class="mt-5">All Books</h1>
		<table class="table">
		 	<thead>
		   		<tr>
		   			<th> Id </th>
		      		<th> Title </th>
		      		<th> Description </th>
		      		<th> Language </th>
		      		<th> Number of pages</th>
		    	</tr>
		  	</thead>
		  	<tbody>
			  	<c:forEach var="book" items="${books}" >
			    	<tr>
			    		<td> <c:out value="${book.id}" /></td>
			      		<td> <a href="/books/${book.id}"><c:out value="${book.title}" /></a>  </td>
			      		<td> <c:out value="${book.description}" /></td>
			      		<td> <c:out value="${book.language}" /></td>
			      		<td> <c:out value="${book.numberOfPages}" /></td>
			    	</tr>
			  	</c:forEach>
		  	</tbody>
		</table>
	</div>
</body>
</html>