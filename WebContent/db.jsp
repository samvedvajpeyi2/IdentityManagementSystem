<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
    
    Class.forName("com.mysql.jdbc.Driver");		//CONNECTING TO JDBC DRIVER
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/usersdb","root","");  //CONNECTING TO DATABASE NAMED "usersdb" WITH ROOT ACCESS
    Statement st = con.createStatement(); 	//CREATTING CONNECTION STATEMENT
    ResultSet rs;							// AND RESULTSET
%>