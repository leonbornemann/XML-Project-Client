<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
	<%@ page import="xmlquestion.XMLCountry" %>
	<%@ page import="xmlquestion.XMLQuestion" %>
	
	<% 
	XMLQuestion question = (XMLQuestion)request.getAttribute("question");
	int questionCounter = ((Integer)request.getAttribute("questionCounter")).intValue();
	ArrayList<XMLCountry> countries = question.getCountryList();
	ArrayList<String> countryNames = new ArrayList<String>();
	StringBuilder sb = new StringBuilder();
	sb.append("[");
	for (int i=0; i<countries.size(); i++){
		sb.append("\"").append(countries.get(i).getName()).append("\"");
		if (i+1 <  countries.size()){
			sb.append(",");
		}
	}
	sb.append("]");
	
	
	%>
	
	<script type="text/javascript">
	countries = <%=sb.toString()%>;
	</script>		


	<p>
		<img class="titleDisplay" src="img/header.gif" alt="title">
	</p>

	<div class="mapDisplay">
		<div class="containerDisplayQuiz">
			<table style="margin-left: 25px;">

				<tr>
					<td class="tableLeftSide firstRow"><font
						class="headlineTextFont"><b>Sentence <%=questionCounter%></b></font></td>
					<td width="570px" style="padding-left: 30px;"><font
						class="textFont">The sought language is spoken in the
							following countries:</font></td>
				</tr>
				<tr>
					<td class="tableLeftSide secondRow" rowspan="2"><font
						class="textFont textFontSentence"><b><%=question.getQuestionSentence().getOriginal()%></b></font>
						<p>
							<font class="textFont">Translation: <%=question.getQuestionSentence().getTranslation()%></font></td>
					<td height="130px">
						<div
							about="http://dbpedia.org/resource/<%=question.getQuestionAnswers().getRight() + "_language"%>>">
							<ul>
								<%
									for (XMLCountry country : question.getCountryList()) {
								%>
								<li>
									<div rel="dbp-owl:spokenIn"
										resource="http://dbpedia.org/resource/<%=country.getName()%>">
										<font class="textFont" style="padding-left: 30px;"><%=country.getName()%></font>
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
					<td rowspan="7" id="svgMap" style="padding-left: 26px;">
					<object data="img/worldHigh.svg" class="svg" height="300px" width="580px" type="image/svg+xml" id="svgObject">
					</object>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton1" type="submit"
							value='<%=question.getQuestionAnswers().getRight()%>'><%=question.getQuestionAnswers().getRight()%></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton2" type="submit"
							value='<%=question.getQuestionAnswers().getWrong1()%>'><%=question.getQuestionAnswers().getWrong1()%></button>

					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton3" type="submit"
							value='<%=question.getQuestionAnswers().getWrong2()%>'><%=question.getQuestionAnswers().getWrong2()%></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton4" type="submit"
							value='<%=question.getQuestionAnswers().getWrong3()%>'><%=question.getQuestionAnswers().getWrong3()%></button>
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