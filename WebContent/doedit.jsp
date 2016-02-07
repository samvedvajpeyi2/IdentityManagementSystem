<!--- This page runs the sql queries required to
edit or update a user.
	
	@author  SAMVED
	
---->

<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %>
<%@ include file="/db.jsp" %>

<%
///FETCH POST VALUES FROM HTML FORM
String uid = request.getParameter("uid");
String uname = request.getParameter("uname");
String upass = request.getParameter("upass");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String uemail = request.getParameter("uemail");
String uaddr = request.getParameter("uaddr");
String ucity = request.getParameter("ucity");
String umobile = request.getParameter("umobile");
String padd = request.getParameter("padd");
String pview = request.getParameter("pview");
String pdel = request.getParameter("pdel");
String pedit = request.getParameter("pedit");

////SQL COMMAND TO UPDATE USER TABLE
String cmd = "UPDATE `user_info` SET `uname` = '" + uname + "', `upass` = '" + upass + "', `fname` = '" + fname + "', `lname` = '" + lname + "', `uemail` = '" + uemail + "', `uaddr` = '" + uaddr + "', `ucity` = '" + ucity + "', `umobile` = '" + umobile + "', `add_perm` = '" + padd + "', `view_perm` = '" + pview + "', `del_perm` = '" + pdel + "', `edit_perm` = '" + pedit + "' where `uid` = '" + uid + "'";
if(st.executeUpdate(cmd)==1){
	////IF SUCCESS, SHOW MESSAGE
	out.print("<script type=\"text/javascript\"> alert(\"User updated successfully.\"); location.href=\"view.jsp\"; </script>");
}
else{
	///IF FAILED, SHOW FAILURE MESSAGE
	out.print("<script type=\"text/javascript\"> alert(\"Temporary error, please try again later.\"); location.href=\"view.jsp\"; </script>");
}

%>