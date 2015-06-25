<%!QuestionDisplayer qd = new QuestionDisplayer();%>
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
<script src="scripts.js" type="text/javascript"></script>
<script language="JAVASCRIPT">
	
</script>
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
	<%
		String questionCounter = request.getParameter("m");
		qd.setCurrentSentenceCounter(questionCounter);
		qd.test();
		String questionNumbers = request.getParameter("modeButton");
	%>

	<p>
		<img class="titleDisplay" src="img/header.gif" alt="title">
	</p>

	<div class="mapDisplay">
		<div class="containerDisplayQuiz">
			<table style="margin-left: 25px;">

				<tr>
					<td class="tableLeftSide firstRow"><font
						class="headlineTextFont"><b>Sentence <%=qd.getCurrentSentenceCounter()%></b></font></td>
					<td width="570px" style="padding-left: 30px;"><font
						class="textFont">The sought language is spoken in the
							following countries:</font></td>
				</tr>
				<tr>
					<td class="tableLeftSide secondRow" rowspan="2"><font
						class="textFont textFontSentence"><b><%=qd.getSentence()%></b></font>
						<p>
							<font class="textFont">Translation: <%=qd.getTranslation()%></font></td>
					<td height="130px"><font class="textFont"
						style="padding-left: 30px;">spoken in answers</font></td>
				</tr>
				<tr>
					<!-- empty -->
					<td rowspan="5" style="padding-left: 30px;"><img
						src="img/map.png" height="300px" /></td>
				</tr>
				<tr>
					<td class="tableLeftSide"><form
							action="quiz.jsp?m=<%=qd.getNextCurrentSentenceCounter()%>"
							method="POST">
							<button class="myButton" id="answerButton1" type="submit"
								value='<%=qd.getAnswers().get(0)%>'><%=qd.getAnswers().get(0)%></button>
						</form></td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<form action="quiz.jsp?m=<%=qd.getNextCurrentSentenceCounter()%>"
							method="POST">
							<button class="myButton" name="answerButton2" type="submit"
								value='<%=qd.getAnswers().get(1)%>'><%=qd.getAnswers().get(1)%></button>
						</form>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide"><form
							action="quiz.jsp?m=<%=qd.getNextCurrentSentenceCounter()%>"
							method="POST">
							<button class="myButton" name="answerButton3" type="submit"
								value='<%=qd.getAnswers().get(2)%>'><%=qd.getAnswers().get(2)%></button>
						</form></td>
				</tr>
				<tr>
					<td class="tableLeftSide"><form
							action="quiz.jsp?m=<%=qd.getNextCurrentSentenceCounter()%>"
							method="POST">
							<button class="myButton" name="answerButton4" type="submit"
								value='<%=qd.getAnswers().get(3)%>'><%=qd.getAnswers().get(3)%></button>
						</form></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>