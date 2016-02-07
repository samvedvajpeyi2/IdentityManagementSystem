<!--- This page actually runs the background sql to delete
a user from the database.
	
	@author  SAMVED
	
---->

<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %>
<%@ include file="/db.jsp" %>

<%
//FETCH UID TO BE DELETED
String uid=request.getParameter("uid");

//SQL COMMAND TO DELETE USER
String cmd = "DELETE FROM `user_info` WHERE `uid` = '" + uid +"'";
if(st.executeUpdate(cmd)==1){
	////IF SUCCESS, SHOW MESSAGE
	out.print("<script type=\"text/javascript\"> alert(\"User deleted successfully.\"); location.href=\"delete.jsp\"; </script>");
}
else{
	////ELSE SHOW FAILURE MESSAGE
	out.print("<script type=\"text/javascript\"> alert(\"Temporary error, please try again later.\"); location.href=\"delete.jsp\"; </script>");
}

%>