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
<script>  
function validateform(){  
var id=document.b1.bid.value;  


if (id==null || id==""){  
  alert("Id can't be blank");  
  return false;  
}
  
 }  
</script>  
</head>


	
    <ul>
        
        
        <li><a href="Ser.jsp">View Services</a></li>
		<li><a href="newuserdetails.jsp"class="active">My Booking Details</a></li>
		<li><a href="pt1.html">Print Ticket </a></li>
		<li><a href="Logout">SignOut</a></li>
        
    </ul>






<%
	
String bid1= (String)session.getAttribute("bid1");
	
%>      
		<div >
		<form name="b1" action="Newuser" method="get" onsubmit="return validateform()">
		<table>
		<tr>
				<th><font color=#060606 size=6><strong> BookingId </strong></font></th>
				<td><input type="text" name="bid"></td>
			</tr>
			
		</table>
		<input type="submit" value="Submit">
		</form>
		</div>
		