<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FruityLoops AS</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<h1 class="table">Fruit Store</h1>
		
		<table>
			<tbody>
				<tr>
					<th>Name</th>
					<th>Price</th>
				</tr>
				<c:forEach var ="fruit" items="${fruits}">
					<tr>
						<td class="name"> <c:out value="${fruit.name}" /> </td>
						<td>$ <c:out value="${fruit.price}" /> </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
</body>
<script type="text/javascript" src="/js/app.js"></script>
</html>