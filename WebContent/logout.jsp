<!--- This page destroys the login session value
and logs out the logged-in user.
	
	@author  SAMVED
	
---->

<%@ page language="java" import="java.util.*" %>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %>
<%@ include file="/db.jsp" %> 
<%
session.setAttribute("loggedIn", "false");		//SET LOGGED IN SESSION AS FALSE 
response.sendRedirect("index.jsp");				// REDIRECT TO INDEX PAGE
%>