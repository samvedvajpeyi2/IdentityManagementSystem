<!--- This page pocesses the form posted in Add User page,
runs the sql and inserts the user into table.
	
	@author  SAMVED
	
---->

<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %>
<%@ include file="/db.jsp" %>

<%

/// FETCH VALUES POSTED BY FORM

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
if(padd == null){			//IF ANY OF THE CHECKBOX IS NOT CHECKED, 
padd = "0";					//IT'S VALUE BECOMES NULL
}							//SO CHANGING THE NULL VALUE TO 0 IN ORDER
if(pview == null){			// TO INSERT INTO TABLE ROW
pview = "0";
}
if(pdel == null){
pdel = "0";
}
if(pedit == null){
pedit = "0";
}

//////SQL QUERY TO INSERT THE ROW IN TABLE
String cmd = "INSERT INTO `user_info`(`uname`, `upass`, `fname`, `lname`, `uemail`, `uaddr`, `ucity`, `umobile`, `add_perm`, `view_perm`, `del_perm`, `edit_perm`) VALUES ('" + uname + "', '" + upass + "', '" + fname + "', '" + lname + "', '" + uemail + "', '" + uaddr + "', '" + ucity + "', '" + umobile + "', '" + padd + "', '" + pview + "', '" + pdel + "', '" + pedit + "')";
if(st.executeUpdate(cmd)==1){
	///IF SUCCESSFUL, SHOW MESSAGE
	out.print("<script type=\"text/javascript\"> alert(\"User added successfully.\"); location.href=\"add.jsp\"; </script>");
}
else{
	//ELSE SHOW FAILURE MESSAGE
	out.print("<script type=\"text/javascript\"> alert(\"Temporary error, please try again later.\"); location.href=\"add.jsp\"; </script>");
}

%>