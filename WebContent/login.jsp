<!--- This is the login page, user's credentials 
are validated here.

	@author  SAMVED
	
---->

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ include file="/db.jsp" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Management System</title>
</head>
<body bgcolor="#FFC01D" style="margin: 0px;">
<div style="background:olivedrab;width:100%;height:70px;font-size: 45px;font-weight: bold;font-family: monospace;color: antiquewhite;text-align: -webkit-center;">User Management System</div>
<center>
<br/><br/><br/>
<h2 style="font-size: 35px;font-weight: bold;font-family: monospace;color: blue;text-decoration: underline;">Sign In</h2>
<br/><br/>
<form method="post" action="dologin.jsp">
<table style="background: bisque;height: 75px;width: 350px;color: darkgreen;font-family: monospace;font-size: 18px;">
<tr>
<th>Username: </th>
<td><input type="text" name="uname"></td>
</tr>
<tr>
<th>Password: </th>
<td><input type="password" name="upass"></td>
</tr>
</table>
<br/><br/>
<input type="submit" value="Sign In">
</form>
</center>
</body>
</html>