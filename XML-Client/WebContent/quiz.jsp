<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sprachquiz</title>
</head>
<body>
<!-- Imports -->
<%@ page import="urlhandler.QuestionDisplayer" %>
<%@ page import="java.util.ArrayList" %>


<h1>Language quiz</h1>

<% 
	QuestionDisplayer qd = new QuestionDisplayer(); 
	ArrayList<String> lines = qd.showQuestion(); 	
%>
<%
for(String s : lines)
{
		
	%>
	
	<br>
	<div class="question"><p><%= s %></div>
	
	<br>
	
<%	
}
%>

</body>
</html>