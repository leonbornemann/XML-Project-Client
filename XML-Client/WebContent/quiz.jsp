<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Language Geekinatorizer</title>
<script type="text/javascript" src="jquery-1.11.3.js"></script>
<script src="scripts.js" type="text/javascript"></script>
<style>
body {
	overflow: auto;
	width: auto;
	height: auto;
}
</style>
</head>
<body bgcolor="#3981D9">
	<!-- Imports -->
	<%@ page import="urlhandler.QuestionDisplayer"%>
	<%@ page import="java.util.ArrayList"%>

	<p>
		<img class="titleDisplay" src="img/header.gif" alt="title">
	</p>

	<div class="mapDisplay">
		<div class="containerDisplayQuiz">
			<table border="1">

				<tr>
					<td width="400px" height="30px">Sentence 01</td>
					<td width="600px">spoken in</td>
				</tr>
				<tr>
					<td rowspan="2" width="400px" height="200px">sentence +
						translation</td>
					<td height="130px">spoken in answers</td>
				</tr>
				<tr>
					<!-- empty -->
					<td rowspan="5">map</td>
				</tr>
				<tr>
					<td width="400px" height="70px">button answers 1</td>
				</tr>
				<tr>
					<td width="400px" height="70px">button answers 2</td>
				</tr>
				<tr>
					<td width="400px" height="70px">button answers 3</td>
				</tr>
				<tr>
					<td width="400px" height="70px">button answers 4</td>
				</tr>
			</table>
		</div>
	</div>

	<%
		String questionNumbers = request.getParameter("modeButton");
		QuestionDisplayer qd = new QuestionDisplayer();
		ArrayList<String> lines = qd.showQuestion(Integer
				.parseInt(questionNumbers));
	%>
	<%
		for (String s : lines) {
	%>

	<br>
	<div class="question">
		<p><%=s%>
	</div>

	<br>

	<%
		}
	%>

</body>
</html>