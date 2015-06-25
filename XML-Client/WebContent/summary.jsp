<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="buttonStyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Language Geekinatorizer</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<style>
body {
	overflow: auto;
	width: auto;
	height: auto;
}
</style>
</head>
<body bgcolor="#3981D9">
	<%
		String correctAnswers = request.getParameter("m");
	%>
	<p>
		<img class="titleDisplay" src="img/header.gif" alt="title">
	</p>

	<div class="mapDisplay">
		<div class="containerDisplay">
			<div class="textHeader">
				<br> <b>Welcome to the Language Geekinatorizer!</b>
			</div>
			<p>
				Correct answers: <b><%=correctAnswers%></b> Congratulations!
			</p>
			<div class="buttonTable">

				<form action="index.html" method="POST">
					<button class="myButton" id="myButton" type="submit"
						value="Welcome Page">Welcome Page</button>
				</form>

			</div>
		</div>
	</div>
</body>
</html>