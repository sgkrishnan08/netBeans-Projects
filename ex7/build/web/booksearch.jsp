<%-- 
    Document   : booksearch
    Created on : 3 Jun, 2021, 11:44:46 AM
    Author     : SGKrishnan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>display data from the table using jsp</title>
</head>
<body>
<h2>Book Catalog</h2>
<%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and
database name is student. */
String connectionURL = "jdbc:derby://localhost:1527/iplab1";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql
statements. */
Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
/* Create a connection by using getConnection() method that takes parameters
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "root");
/* createStatement() is used for create statement object that is used for
sending sql statements to the specified database. */
statement = connection.createStatement();
String ss= request.getParameter("bname");
// sql query to retrieve values from the secified table.
String QueryString = "SELECT * from bookdb where bname like '"+ss+"%'";
rs = statement.executeQuery(QueryString);
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println(ex);
}
%>
</TABLE><TABLE>
<TR>
<TD><FORM ACTION="index.html" method="get" >
 <button type="submit"><--back</button></TD>
</TR>
</TABLE>
</font>
</body>
</html>
