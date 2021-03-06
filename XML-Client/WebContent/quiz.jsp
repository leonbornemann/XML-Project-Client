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
	overflow-x: hidden;
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
	
	String correctAnswer = question.getQuestionAnswers().getRight();
	int numQuestion = ((Integer)request.getAttribute("numQuestion")).intValue();
	ArrayList<String> answerList=(ArrayList<String>)request.getAttribute("answerList");
	StringBuilder sb2 = new StringBuilder();
	sb2.append("[");
	for (int i=0; i<answerList.size(); i++){
		sb2.append("\"").append(answerList.get(i)).append("\"");
		if (i+1 <  answerList.size()){
			sb2.append(",");
		}
	}
	sb2.append("]");
	%>
	
	<script type="text/javascript">
	countries = <%=sb.toString()%>;
	correctAnswer = "<%=correctAnswer%>";
	numQuestion = "<%=numQuestion%>";
	questionCounter = "<%=questionCounter%>";
	answerList = <%=sb2.toString()%>;
	</script>		

	<img class="titleDisplay" src="img/header.gif" alt="title">
	<div class="mapDisplay">
		<div class="containerDisplayQuiz">
			<table border=1 style="margin-left: 25px;" >

				<tr>
					<td class="tableLeftSide firstRow"><font
						class="headlineTextFont"><b>Sentence <%=questionCounter%></b></font></td>
						
					<td rowspan="8" style="padding-left:20%" id="tippImgTD">
					<div style="width:500px; height: 500px;">
						<button id="tippImg" title="Do you need a hint?" class="tippImg"><img src="img/gluehbirne.png"/></button> 
					</div>
					</td>	
						
					<td width="570px" style="padding-left: 30px;" class="hideTipp"><font
						class="textFont">The sought language is spoken in the
							following countries:</font></td>
				</tr>
				<tr>
					<td class="tableLeftSide secondRow" rowspan="2"><font class="textFont textFontSentence">
					<b>Which language is it?<br><br><font id="originalSentence"
						class="textFont textFontSentence"><%=question.getQuestionSentence().getOriginal()%></font></b></font>
						<p>
							<font class="textFont" id="translationSentence">Translation: <%=question.getQuestionSentence().getTranslation()%></font></td>
					<td height="130px" class="hideTipp">
						<div
							about="http://dbpedia.org/resource/<%=question.getQuestionAnswers().getRight() + "_language"%>>" style="padding-left:25px;">
							<div id="countries" class="scrollBar">
							<ul>
								<%
									for (XMLCountry country : question.getCountryList()) {
								%>
								<li>
									<div rel="dbp-owl:spokenIn"
										resource="http://dbpedia.org/resource/<%=country.getNameWithUnderlines()%>">
										<font class="textFont" style="padding-left: 30px;"><%=country.getName()%></font>
									</div>
								</li>
								<%
									}
								%>
							</ul>
							</div>
						</div>
				</tr>
				<tr>
					<!-- empty -->			
					<td rowspan="6" id="svgMap" style="padding-left: 26px;" class="hideTipp">
					<div style="width:500px;height:328px;">
						<object data="img/worldHigh.svg" class="svg" type="image/svg+xml" id="svgObject"></object>
					</div>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton1" type="submit"></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton2" type="submit"></button>

					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton3" type="submit"></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<button class="myButton" id="answerButton4" type="submit"></button>
					</td>
				</tr>
				<tr>
					<td class="tableLeftSide">
						<div style="height:37px; width:350px;">
						<form id="sunnaryForm" action="questionDisplayer" method="POST">
							<input type="hidden" name="status" value="summary">
								<button class="myButtonInvisible" id="summaryButton" name="summary"
								type="submit" value="Summary">Summary</button></form>
						
						<form id="nextSentenceForm" action="questionDisplayer" method="POST">
							<input type="hidden" name="status" value="quiz">
							<button class="myButtonInvisible" id="nextSentenceButton" name="givenAnswer"
								type="submit" value="Next Sentence">Next Sentence</button>
						</form>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>