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
	<h1>Send an Omikuji! </h1>
	<div class="border">
		<form action="/omikuji/sending" method="POST">
			<div>
				<div>
					<label> Pick any number from 5 to 25 </label>
				</div>
				<input type="number" min=5 max=25 name="number" />
			</div>
			<div>
				<div>
					<label> Enter the name of any city </label>
				</div>
				<input type="text" name="city" />
			</div>
			<div>
				<div>
					<label> Enter the name of any real person </label>
				</div>
				<input type="text" name="person" />
			</div>
			<div>
				<div>
					<label> Enter professional endeavor or hobby: </label>
				</div>
				<input type="text" name="hobby"/>
			</div>
			<div>
				<div>
					<label> Enter any type of living thing </label>
				</div>
				<input type="text" name="thing" />
			</div>
			<div>
				<div>
					<label> Say something nice to someone </label>
				</div>
				<textarea name="something" id="" cols="30" rows="10"></textarea>
			</div>
			
			<p>Send and show a friend</p>
			<div>
				<button type="submit">Send</button>
			</div>
		</form>
	</div>
</body>
</html>