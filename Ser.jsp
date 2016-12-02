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
        
        
        <li><a href="Ser.jsp"class="active">View Services</a></li>
		<li><a href="newuserdetails.jsp">My Booking Details</a></li>
		<li><a href="pt1.html">Print Ticket </a></li>
		<li><a href="Logout">SignOut</a></li>
        
    </ul>






<%
		String abc= (String)session.getAttribute("username");
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@aatrng1:1521:VIS","apps","apps");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select servicenumber from services_1216");
	%>
	<body bgcolor="lightblue">
		<center>
			<form action="servicedetails" method="post">
				<table>
					<tr>
						<td>Services number:</td>
						<td>
							<select name="servicenumber">
							<option value="Default">Service Number</option>
								<%  while(rs.next()){ %>
									<option><%= rs.getString(1)%></option>
								<% } %>
							</select>
						</td>
					</tr>
					<%
						ResultSet rs1 = st.executeQuery("select description from city_1216");
					%>
					<tr>
						<td>Source:</td>
						<td>
							<select name="source">
							<option value="Default">source city</option>
								<%  while(rs1.next()){ %>
									<option><%= rs1.getString(1)%></option>
								<% } %>
							</select>
						</td>
					</tr>
					<%
						ResultSet rs2 = st.executeQuery("select description from city_1216");
					%>
					<tr>
						<td>Destination:</td>
						<td>
							<select name="destination">
							<option value="Default">destination city</option>
								<%  while(rs2.next()){ %>
									<option><%= rs2.getString(1)%></option>
								<% } %>
							</select>
						</td>
					</tr>
					<tr>
						<td>please enter the Start Date:</td>
						<td><input type="date" name="startdate"></td>
					</tr>
					
				</table>
				<input type="submit" name="submit" value="Submit">
				<input type="reset" name="reset" value="Reset">
			</form>
		</center>

<%
		}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
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