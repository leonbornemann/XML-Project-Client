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
	overflow-x: hidden;
}
</style>
</head>
<body bgcolor="#3981D9">
	<%
		int correctAnswers = ((Integer)request.getAttribute("correctAnswerCounter")).intValue();
		int questionCounter = ((Integer)request.getAttribute("questionCounter")).intValue();
	%>
	<img class="titleDisplay" src="img/header.gif" alt="title">

	<div class="mapDisplay">
		<div class="containerDisplay">
			<div class="textHeader">
				<br> <b>Congratulations!</b>
			</div>
			<div class="textMode">
				<br>Correct answers: <b><%=correctAnswers%> of <%=questionCounter %></b> <br><br>Thanks
				for playing!
			</div>
			<br> <br>
			<div class="buttonTable">
				<br>
				<form action="index.html" method="POST">
					<button class="myButton" id="myButton" type="submit">NEW GAME</button>
				</form>

			</div>
		</div>
	</div>
</body>
</html>