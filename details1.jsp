<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Basic Form</title>

	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/form-basic.css">

</head>


	
    <ul>
        <li><a href="bus.html">Bus Type</a></li>
        <li><a href="id.html">ID Type</a></li>
        <li><a href="city.html">City</a></li>
		<li><a href="Services.jsp">Services</a></li>
		<li><a href="details.jsp"class="active">Booking Details</a></li>
		<li><a href="Logout">Logout</a></li>
        
    </ul>

<body bgcolor="lightblue">
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->

        <form class="form-basic" method="post" action="#">

            <div class="form-title-row">
                <h1>Hi Admin</h1>
            </div>

            

        </form>

    </div>
<%
	Connection con=null;
	String bid1= (String)session.getAttribute("bid1");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@aatrng1:1521:VIS","apps","apps");
%>
		<form name="b1" action="bookingdetails" method="POST">
		<table>
			<tr>
				<th><font color=#17202A face="verdana" size=4><strong>Please Provide the booking id to display the details:</strong></font></th>
				<th>
				<select name="servicetype">
		
		<option value="Default">Select Booking ID</option>
<%
		PreparedStatement ps2=con.prepareStatement("select bookingid from passengers_1216 ");
		ResultSet rs2=ps2.executeQuery();
%>
<% 
		if(rs2.next())
		{
%>		
		<option value=<%=rs2.getString(1) %>><%=rs2.getString(1) %></option>
<%
		}
%>
<% 
		while(rs2.next())
		{
%>		
		<option value=<%=rs2.getString(1) %>><%=rs2.getString(1) %></option>
<%
		}
%>
		</select>
				</th>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="Get Details" ></td>
			</tr>
		</table>
		</form>
<%
		PreparedStatement ps3=con.prepareStatement("select * from passengers_1216 where bookingid=?");
		ps3.setString(1,bid1);
		ResultSet rs3=ps3.executeQuery();
%>
<% 
		if(rs3.next())
		{
%>		
		<table border=2>
			<tr>
				<td>Booking ID</td><td>Passenger ID</td><td>Name</td><td>Date of birth</td><td>Age</td><td>Contact Number</td><td>ID Proof Type</td><td>ID Number</td><td>Email</td>
			</tr>
			<tr>
				<td><%=rs3.getString(1)%></td><td><%=rs3.getString(2)%></td><td><%=rs3.getString(3)%></td><td><%=rs3.getDate(4)%></td><td><%=rs3.getString(5)%></td><td><%=rs3.getString(6)%></td><td><%=rs3.getString(7)%></td><td><%=rs3.getString(8)%></td><td><%=rs3.getString(9)%></td>
			</tr>
<%
		}
%>
<%
		while(rs3.next())
		{
%>
			<tr>
				<td><%=rs3.getString(1)%></td><td><%=rs3.getString(2)%></td><td><%=rs3.getString(3)%></td><td><%=rs3.getDate(4)%></td><td><%=rs3.getString(5)%></td><td><%=rs3.getString(6)%></td><td><%=rs3.getString(7)%></td><td><%=rs3.getString(8)%></td><td><%=rs3.getString(9)%></td>
			</tr>
<%
		}
%>		
		</table>
		<form name="b2" action="bookingdetails1" method="POST">
		<table>
			<tr>
				<th><font color=#17202A face="verdana" size=4><strong>PLease Provide the From and To date to display the details:</strong></font></th>
				<th><input type=date name="fromdate"></th>	
				<th><input type=date name="todate"></th>	
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="Get Details" ></td>
			</tr>
		</table>
		</form>
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
