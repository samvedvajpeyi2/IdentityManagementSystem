<!--- This page validates the username and password given
by the user o login.
	
	@author  SAMVED
	
---->

<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %>
<%@ include file="/db.jsp" %>

<% 

////FETCH USERNAME AND PASSWORD
String uname1 = request.getParameter("uname"); 
String upass1 = request.getParameter("upass");

///CHECK IF A USER WITH GIVEN LOGIN EXISTS
rs = st.executeQuery("select * from `user_info` where `uname`='" + uname1 + "' and `upass`='" + upass1 + "'"); 
if (rs.next()) { 
	int uid = rs.getInt("uid"); 
	String uname = rs.getString("uname"); 					//FETCH ALL THE DETAILS OF USER
	String upass = rs.getString("upass"); 					//FROM THE TABLE
	String fname = rs.getString("fname");
	String lname = rs.getString("lname");
	String uemail = rs.getString("uemail");
	String uaddr = rs.getString("uaddr");
	String ucity = rs.getString("ucity");
	String umobile = rs.getString("umobile");
	int padd = rs.getInt("add_perm");
	int pview = rs.getInt("view_perm");
	int pdel = rs.getInt("del_perm");
	int pedit = rs.getInt("edit_perm");
	session.setAttribute("uid", uid); 					//STORE USER DETAILS IN SESSION VARIABLES
	session.setAttribute("uname", uname); 
	session.setAttribute("upass", upass);
	session.setAttribute("fname", fname);
	session.setAttribute("lname", lname);
	session.setAttribute("uemail", uemail);
	session.setAttribute("uaddr", uaddr);
	session.setAttribute("ucity", ucity);
	session.setAttribute("umobile", umobile);
	session.setAttribute("padd", padd);
	session.setAttribute("pview", pview);
	session.setAttribute("pdel", pdel);
	session.setAttribute("pedit", pedit);
	session.setAttribute("loggedIn", "true");
	response.sendRedirect("index.jsp");				//REDIRECT TO INDEX PAGE
	
}
else{
	
	//IF INCORRECT USERNAME PASSWORD, SHOW ERROR MESSAGE
	out.print("<script type=\"text/javascript\"> alert(\"Invalid username or password.\"); location.href=\"login.jsp\"; </script>");
}

%>