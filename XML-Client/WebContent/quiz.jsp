<%!QuestionDisplayer qd = new QuestionDisplayer();%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html prefix="dbp-owl: http://dbpedia.org/ontology/">
<head>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="buttonStyle.css">
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
	<%
		String questionCounter = request.getParameter("m");
			qd.setCurrentSentenceCounter(questionCounter);
			String correctAnswersCounter = request.getParameter("n");
			if (request.getParameter("modeButton") != null) {
		qd.setGameMode(request.getParameter("modeButton"));
			}
			String currentSentenceCounter = qd.getCurrentSentenceCounter();
			// add here question call
			qd.test();
			String correctAnswer = qd.getCorrectAnswer().toString();
	%>
	<script type="text/javascript">
		correctGivenAnswers="<%=correctAnswersCounter%>";
		correctAnswer = "<%=correctAnswer%>";
		gameMode="<%=qd.getGameMode()%>";
		currentSentenceCounter="<%=currentSentenceCounter%>";
	</script>
	<p>
		<img class="titleDisplay" src="img/header.gif" alt="title">
	</p>

	<div class="mapDisplay">
		<div class="containerDisplayQuiz">
			<table style="margin-left: 25px;">

				<tr>
					<td class="tableLeftSide firstRow"><font
						class="headlineTextFont"><b>Sentence <%=currentSentenceCounter%></b></font></td>
					<td width="570px" style="padding-left: 30px;"><font
						class="textFont">The sought language is spoken in the
							following countries:</font></td>
				</tr>
				<tr>
					<td class="tableLeftSide secondRow" rowspan="2"><font
						class="textFont textFontSentence"><b><%=qd.getSentence()%></b></font>
						<p>
							<font class="textFont">Translation: <%=qd.getTranslation()%></font></td>
					<td height="130px">
						<div
							about="http://dbpedia.org/resource/<%=qd.getCorrectAnswerString() + "_language"%>>">
							<ul>
								<%
									for (String country : qd.getSpokenInList()) {
								%>
								<li>
									<div rel="dbp-owl:spokenIn"
										resource="http://dbpedia.org/resource/<%=country%>">
										<font class="textFont" style="padding-left: 30px;"><%=country%></font>
									</div>
								</li>
								<%
									}
								%>
							</ul>
						</div>
				</tr>
				<tr>
					<!-- empty -->			
					<td rowspan="7" id="svgMap" style="padding-left: 30px;"><img
						src="img/worldHigh.svg" height="350px" width="600px"/></td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton1" type="submit"
							value='<%=qd.getAnswers().get(0)%>'><%=qd.getAnswers().get(0)%></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton2" type="submit"
							value='<%=qd.getAnswers().get(1)%>'><%=qd.getAnswers().get(1)%></button>

					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton3" type="submit"
							value='<%=qd.getAnswers().get(2)%>'><%=qd.getAnswers().get(2)%></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton4" type="submit"
							value='<%=qd.getAnswers().get(3)%>'><%=qd.getAnswers().get(3)%></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide"><form id="nextSentenceForm"
							action="" method="POST">
							<button class="myButtonInvisible" id="nextSentenceButton"
								type="submit" value="Next Sentence">Next Sentence</button>
						</form></td>
				</tr>
				<tr>
					<td class="tableLeftSide"><form id="summaryForm" action=""
							method="POST">
							<button class="myButtonInvisible" id="summaryButton"
								type="submit" value="Summary">Summary</button>
						</form></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>