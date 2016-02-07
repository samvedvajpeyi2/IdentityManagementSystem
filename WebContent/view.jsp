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
<h2 style="font-size: 35px;font-weight: bold;font-family: monospace;color: blue;text-decoration: underline;">View Users</h2>

<!-- --------------DISPLAY LIST OF USERS------------ -->
<table border=1 style="margin-left: 200px;background: bisque;height: 350px;width: 350px;color: currentColor;font-family: monospace;font-size: 18px;">
<tr>
<th>Uid</th>
<th>Username</th>
<th>First Name</th>
<th>Last Name</th>
<th>Email</th>
<th>Address</th>
<th>City</th>
<th>Mobile</th>
<th>Add</th>
<th>View</th>
<th>Delete</th>
<th>Edit</th>
<%
////////SHOW EDIT OPTION ONLY IF USER HAS EDIT PERMISSION
if( pedit == 1){
out.print("<th>Edit</th>");
}
%>

</tr>
<%
rs = st.executeQuery("select * from `user_info`");			//MYSQL QUERY TO FETCH ALL USERS
while (rs.next()) {
	out.println("<tr>");
	out.println("<td> " + rs.getString("uid") + "</td>");
	out.println("<td> " + rs.getString("uname") + "</td>");
	out.println("<td> " + rs.getString("fname") + "</td>");
	out.println("<td> " + rs.getString("lname") + "</td>");
	out.println("<td> " + rs.getString("uemail") + "</td>");
	out.println("<td> " + rs.getString("uaddr") + "</td>");
	out.println("<td> " + rs.getString("ucity") + "</td>");
	out.println("<td> " + rs.getString("umobile") + "</td>");
	out.println("<td> " + rs.getString("add_perm") + "</td>");
	out.println("<td> " + rs.getString("view_perm") + "</td>");
	out.println("<td> " + rs.getString("del_perm") + "</td>");
	out.println("<td> " + rs.getString("edit_perm") + "</td>");
	////SHOW EDIT OPTION ONLY IF USER HAS EDIT PERMISSION
	if( pedit == 1){
	out.print("<td><a href=\"edit.jsp?uid=" + rs.getString("uid") + "\"> Edit</a></td>");
	}
	out.println("</tr>");
}
%>
</table>
</center>
</body>
</html>