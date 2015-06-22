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
	<% QuestionDisplayer qd = new QuestionDisplayer(); %>

	<p>
		<img class="titleDisplay" src="img/header.gif" alt="title">
	</p>

	<div class="mapDisplay">
		<div class="containerDisplayQuiz">
			<table style="margin-left:50px;">

				<tr>
					<td width="350px" height="30px">
					<font class="textFont textFontSentence"><b><%=qd.getSentence()%></b></font>
					</td>
					<td width="550px" style="padding-left: 30px;"><font class="textFont">spoken in</font></td>
				</tr>
				<tr>
					<td rowspan="2" width="350px" height="200px">
					<font class="textFont"><%=qd.getTranslation() %></font>
					</td>
					<td height="130px"><font class="textFont" style="padding-left: 30px;">spoken in answers</font></td>
				</tr>
				<tr>
					<!-- empty -->
					<td rowspan="5" style="padding-left: 30px;">
						<img src="img/map.png" height="300px"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" class="answerButtons textFont" value='<%=qd.getAnswers().get(0) %>'/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" class="answerButtons textFont" value='<%=qd.getAnswers().get(1) %>'/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" class="answerButtons textFont" value='<%=qd.getAnswers().get(2) %>'/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" class="answerButtons textFont" width="350px" height="70px" value='<%=qd.getAnswers().get(3) %>'/>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<%
		String questionNumbers = request.getParameter("modeButton");
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