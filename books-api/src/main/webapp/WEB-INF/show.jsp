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
<div class="container mt-5">
	<div class="card">
		<div class="card-body">
			<h1 class="card-title fs-1"> <c:out value="${book.title}"/> </h1>
			
			<p class="card-text fs-3"> Description: <span class="fst-italic"><c:out value="${book.description}"/></span>  </p>
			
			<p class="card-text fs-3">Language: <span class="fst-italic"><c:out value="${book.language}"/></span>  </p>
			
			<p class="card-text fs-3">Number of Pages: <span class="fst-italic"><c:out value="${book.numberOfPages}"/></span> </p>
		</div>
	</div>
	<div class="container mt-3">
        <a class="" href="/books">Back to All Books</a>
    </div>
</div>
	
	
</body>
</html>