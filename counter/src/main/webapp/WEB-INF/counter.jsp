<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Counter AS</title>
</head>
<body>
	<h1> Count is: <c:out value="${count}"/>  </h1>
	<a type=button href="/reset"> Reset Count </a>
	<div>
		<a type=button href="/"> Go back to the homepage </a>
	</div>
</body>
</html>