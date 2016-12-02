<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>

<!DOCTYPE html>


<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Basic Form</title>

	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/form-basic.css">

</head>


	
    <ul>
        
        
        <li><a href="Ser.jsp">View Services</a></li>
		<li><a href="userdetails.jsp"class="active">My Booking Details</a></li>
		<li><a href="Logout">SignOut</a></li>
        
    </ul>






<%
	
String bid1= (String)session.getAttribute("bid1");
	
%>      
		<div >
		<form name="b1" action="user" method="get">
		<table>
		<tr>
				<th><font color=#060606 size=6><strong> email </strong></font></th>
				<td><input type="text" name="email"></td>
			<tr>
				<th><font color=#060606 size=6><strong> username </strong></font></th>
				<td><input type="text" name="username"></td>
			</tr>	
			<tr>
				<th><font color=#060606 size=6><strong>password</strong></font></th>
				<td><input type="password" name="password"></td>
			</tr>	
		</table>
		<input type="submit" value="Submit">
		</form>
		</div>
		