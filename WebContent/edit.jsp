<!--- This page allows admins to edit or update 
existing users in the database.
	
	@author  SAMVED
	
---->

<!------- IMPORTING SQL LIBRARIES -------->
<%@ page language="java" import="java.util.*" %>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %>
<%@ include file="/db.jsp" %> 

<!------- CHECKING WHETHER USER IS LOGGED IN, OTHERWISE REDIRECT TO LOGIN PAGE -------->
<% 
String loggedIn = (String)session.getAttribute("loggedIn"); 
if(loggedIn != "true"){
	out.print("<meta http-equiv=\"refresh\" content=\"0; url=login.jsp\">");
}

String uid2=request.getParameter("uid");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Management System</title>

<!------- CSS FOR PAGE STYLING -------->
<style>
a {
    color: sienna;
    font-weight: bold;
    font-family: monospace;
}
a:hover{
color:white;
}
tr:nth-child(even) {
    background-color: darkseagreen;
}
</style>
</head>
<body bgcolor="#FFC01D" style="margin: 0px;">

<!------- HEADER -------->
<div style="background:olivedrab;width:100%;height:70px;font-size: 45px;font-weight: bold;font-family: monospace;color: antiquewhite;text-align: -webkit-center;">User Management System</div>

<!------- MENU BAR DIV -------->
<div style="background:goldenrod;height:100%;text-decoration: overline;width:200px;font-size:22px;color:red;position: absolute;">
<br/><br/><br/><br/>
<a href="index.jsp">* Home</a><br/><br/>
<!------- DISPLAYING MENU ACCORDING TO USER PERMISSIONS -------->
<% 
int padd = (Integer)session.getAttribute("padd");                 //IF USER HAS "ADD" PERMISSION
if( padd == 1){													  // THEN SHOW "ADD USER" MENU
out.print("<a href=\"add.jsp\">* Add User</a><br/><br/>");
}
int pview = (Integer)session.getAttribute("pview");					//IF USER HAS "VIEW" PERMISSION
if( pview == 1){													// THEN SHOW "VIEW USER" MENU
out.print("<a href=\"view.jsp\">* View Users</a><br/><br/>");
out.print("<a href=\"search.jsp\">* Search Users</a><br/><br/>");
}
int pedit = (Integer)session.getAttribute("pedit");					//IF USER HAS "EDIT" PERMISSION
if( pedit == 1){													// THEN SHOW "EDIT USER" MENU
out.print("<a href=\"view.jsp\">* Edit Users</a><br/><br/>");
}
int pdel = (Integer)session.getAttribute("pdel");					//IF USER HAS "DELETE" PERMISSION
if( pdel == 1){														// THEN SHOW "DELETE USER" MENU
out.print("<a href=\"delete.jsp\">* Delete User</a><br/><br/>");
}
%>
<a href="profile.jsp">* My Profile</a><br/><br/>
<a href="logout.jsp"><b>* Logout</b></a><br/><br/>

</div>
<center>
<br/><br/>
<h2 style="font-size: 35px;font-weight: bold;font-family: monospace;color: blue;text-decoration: underline;">Edit User</h2>
<%
String cmd = "select * from `user_info` where `uid`='" + uid2 + "'"; 	//SQL QUERY TO GET SELECTED USER'S DETAILS
rs = st.executeQuery(cmd);
while (rs.next()) { 
	String uid3 = rs.getString("uid");
	String uname2 = rs.getString("uname");
	String fname2 = rs.getString("fname");
	String lname2 = rs.getString("lname");
	String uemail2 = rs.getString("uemail");
	String uaddr2 = rs.getString("uaddr");
	String ucity2 = rs.getString("ucity");
	String umobile2 = rs.getString("umobile");
	String padd2 = rs.getString("add_perm");
	String pview2 = rs.getString("view_perm");
	String pdel2 = rs.getString("del_perm");
	String pedit2 = rs.getString("edit_perm");

%>

<!-- --------EDIT USER FORM, TO BE SUBMITTED AT DoEdit.jsp------>
<form method="post" action="doedit.jsp">
<input type="hidden" name="uid" value="<%=uid3%>">
<table style="background: bisque;height: 350px;width: 350px;color: currentColor;font-family: monospace;font-size: 18px;">
<tr>
<th>Username: </th>
<td><input type="text" name="uname" value="<%=uname2%>"></td>
</tr>
<tr>
<th>Password: </th>
<td><input type="password" name="upass" value=""></td>
</tr>
<tr>
<th>First Name: </th>
<td><input type="text" name="fname" value="<%=fname2%>"></td>
</tr>
<tr>
<th>Last Name: </th>
<td><input type="text" name="lname" value="<%=lname2%>"></td>
</tr>
<tr>
<th>Email: </th>
<td><input type="text" name="uemail" value="<%=uemail2%>"></td>
</tr>
<tr>
<th>Address: </th>
<td><input type="text" name="uaddr" value="<%=uaddr2%>"></td>
</tr>
<tr>
<th>City: </th>
<td><input type="text" name="ucity" value="<%=ucity2%>"></td>
</tr>
<tr>
<th>Mobile: </th>
<td><input type="text" name="umobile" value="<%=umobile2%>"></td>
</tr>
<tr>
<th>Add Perm: </th>
<td><input type="text" name="padd" value="<%=padd2%>"></td>
</tr>
<tr>
<th>View Perm: </th>
<td><input type="text" name="pview" value="<%=pview2%>"></td>
</tr>
<tr>
<th>Delete Perm: </th>
<td><input type="text" name="pdel" value="<%=pdel2%>"></td>
</tr>
<tr>
<th>Edit Perm: </th>
<td><input type="text" name="pedit" value="<%=pedit2%>"></td>
</tr>

</table>
<br/><br/>
<input type="submit" value="Update User" style="width: 150px;height: 50px;color: black;font-size: 18px;font-weight: bold;background: burlywood;">
</form>
<% } %>
</center>
</body>
</html>