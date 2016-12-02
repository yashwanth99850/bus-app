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
		<li><a href="newuserdetails.jsp"class="active">My Booking Details</a></li>
		<li><a href="pt1.html">Print Ticket </a></li>
		<li><a href="Logout">SignOut</a></li>
        
    </ul>






		
<%
	Connection con=null;
	String bid1= (String)session.getAttribute("bid1");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@aatrng1:1521:VIS","apps","apps");
%>
<%
		PreparedStatement ps3=con.prepareStatement("select * from bookings_1216  where bookingid=?");
		ps3.setString(1,bid1);
		ResultSet rs3=ps3.executeQuery();
		
%>
		
<% 
		if(rs3.next())
		{
%>		
        <br>
		<table style="border:2">
			<tr>
				<td><font color=#a5223e  size=4>Booking ID</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>SERVICE TYPE</font></td>
				<td></td>
				
				<td><font color=#a5223e  size=4>SERVICE NUMBER</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>SOURCE</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>DESTINATION</font></td>
				<td></td>
				<td><font color=#a5223e size=4>STARTDATE</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>ENDDATE</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>STARTTIME</font></td>
				<td></td>
				<td><font color=#a5223e size=4>ENDTIME</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>BOOKINGDATE</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>NUMBEROFPASSENGERS</font></td>
			</tr>
			
			<tr>
				<td align="center"><%=rs3.getInt(1)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(2)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(3)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(4)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(5)%></td>
				<td></td>
				<td align="center"><%=rs3.getDate(6)%></td>
				<td></td>
				<td align="center"><%=rs3.getDate(7)%></td>
				<td></td>
				<td align="center"><%=rs3.getTime(8)%></td>
				<td></td>
				<td align="center"><%=rs3.getTime(9)%></td>
				<td></td>
				<td align="center"><%=rs3.getDate(10)%></td>
				<td></td>
				<td align="center"><%=rs3.getInt(11)%></td>
				<td></td>
			</tr>
<%
		}
%>
<%
		while(rs3.next())
		{
%>
			<tr>
				<td align="center"><%=rs3.getInt(1)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(2)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(3)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(4)%></td>
				<td></td>
				<td align="center"><%=rs3.getString(5)%></td>
				<td></td>
				<td align="center"><%=rs3.getDate(6)%></td>
				<td></td>
				<td align="center"><%=rs3.getDate(7)%></td>
				<td></td>
				<td align="center"><%=rs3.getTime(8)%></td>
				<td></td>
				<td align="center"><%=rs3.getTime(9)%></td>
				<td></td>
				<td align="center"><%=rs3.getDate(10)%></td>
				<td></td>
				<td align="center"><%=rs3.getInt(11)%></td>
				<td></td>
			</tr>
<%
		}
%>		
		</table>
		
<%
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		try
		{
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 

%>
</body>
</html>
