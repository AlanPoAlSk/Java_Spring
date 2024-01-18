<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Omikuji Form AS</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<h1>Here's Your Omikuji!</h1>
	<div class="bubble">
		<h1> In <span> <c:out value="${number}"></c:out> </span> years, you will live in <span> <c:out value="${city}"></c:out> </span> with <span> <c:out value="${person}"></c:out> </span> as you roommate, selling <span> <c:out value="${hobby}"></c:out> </span> for a living.
			The next time you see a <span> <c:out value="${thing}"></c:out> </span>, you will have good luck.
			Also, <span> <c:out value="${something}"></c:out> </span>.
		 </h1>
	</div>
	<a href="/omikuji"> Go Back </a>
</body>
</html>