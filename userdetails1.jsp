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
	Connection con=null;
	String bid1= (String)session.getAttribute("bid1");
	String bid2= (String)session.getAttribute("bid2");
	String bid3= (String)session.getAttribute("bid3");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@aatrng1:1521:VIS","apps","apps");
%>
<%
		PreparedStatement ps=con.prepareStatement("select password from jdbctest  where username=?");
		ps.setString(1,bid1);
		ResultSet rs=ps.executeQuery();
		rs.next();
		if(rs.getString(1).equals(bid2))
		{
		PreparedStatement ps3=con.prepareStatement("select * from passengers_1216  where email=?");
		ps3.setString(1,bid3);
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
				<td><font color=#a5223e  size=4>Passenger ID</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>Name</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>Date of birth</font></td>
				<td></td>
				<td><font color=#a5223e size=4>Age</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>Contact Number</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>ID Proof Type</font></td>
				<td></td>
				<td><font color=#a5223e size=4>ID Number</font></td>
				<td></td>
				<td><font color=#a5223e  size=4>Email</font></td>
				
			</tr>
			
			<tr>
				<td><%=rs3.getString(1)%></td>
				<td></td>
				<td><%=rs3.getString(2)%></td>
				<td></td>
				<td><%=rs3.getString(3)%></td>
				<td></td>
				<td><%=rs3.getDate(4)%></td>
				<td></td>
				<td><%=rs3.getString(5)%></td>
				<td></td>
				<td><%=rs3.getString(6)%></td>
				<td></td>
				<td><%=rs3.getString(7)%></td>
				<td></td>
				<td><%=rs3.getString(8)%></td>
				<td></td>
				<td><%=rs3.getString(9)%></td>
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
				<td><%=rs3.getString(1)%></td>
				<td></td>
				<td><%=rs3.getString(2)%></td>
				<td></td>
				<td><%=rs3.getString(3)%></td>
				<td></td>
				<td><%=rs3.getDate(4)%></td>
				<td></td>
				<td><%=rs3.getString(5)%></td>
				<td></td>
				<td><%=rs3.getString(6)%></td>
				<td></td>
				<td><%=rs3.getString(7)%></td>
				<td></td>
				<td><%=rs3.getString(8)%></td>
				<td></td>
				<td><%=rs3.getString(9)%></td>
				<td></td>
			</tr>
<%
		}
		}else
		{
		out.println("Details wrong");
		}
%>		
		</table>
		</table>
		<div >
		<form name="b1" action="user1" method="get">
		<table>
			<tr>
				<th><font color=#060606 size=6><strong>Give ur booking id to get ur details</strong></font></th>
				<td><input type="text" name="bookingid"></td>
			</tr>	
		</table>
		<input type="submit" value="Submit">
		</form>
		</div>
		
		
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
