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
   <h1>New Dojo</h1>
	   <form:form action="/dojos/new" method="POST" modelAttribute="newDojo">
		   <div class="d-flex mt-3" >
			   <div style="margin-right: 10px;">
				   <form:label path="dojoName" class="form-label"> Name: </form:label>
			   </div>
			   <div class="d-flex flex-column">
				   <form:input type="text" path="dojoName" class="form-control"/>
				   <form:errors path="dojoName" class="text-danger"></form:errors>
				   <button type="submit" class="btn btn-success mt-3">Create</button>
			   </div>
		   </div>
	   </form:form>
   </div>
</body>
</html>