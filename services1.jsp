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
		<li><a href="newuserdetails.jsp">My Booking Details</a></li>
		<li><a href="pt1.html">Print Ticket </a></li>
		<li><a href="Logout">SignOut</a></li>
        
    </ul>





<%
		
		String srnum= (String)session.getAttribute("srnum");
		String src= (String)session.getAttribute("src");
		String dest= (String)session.getAttribute("dest");
		String sd= (String)session.getAttribute("sd");
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@aatrng1:1521:VIS","apps","apps");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select servicenumber from services_1216");
	%>
	<body bgcolor=#EDE53E>
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
						<td>Please enter the Start Date:</td>
						<td><input type="date" name="startdate"></td>
					</tr>
					
				</table>
				<input type="submit" name="submit" value="Submit">
				<input type="reset" name="reset" value="Reset">
			</form>
		</center>
<%
		PreparedStatement ps=con.prepareStatement("select * from services_1216 where servicenumber=? or source=? or destination=? or startdate=?");
		ps.setString(1, srnum);
		ps.setString(2, src);
		ps.setString(3, dest);
		ps.setString(4, sd);
		ResultSet rs3=ps.executeQuery();		


			while(rs3.next())
			{
%>
		<form action="pass.jsp" method="POST">
		<table border=2>
			<tr>
				<th>Service Type</th><th>Service Number</th><th>Source</th><th>Destination</th><th>Start Date</th><th>Reached Date</th><th>Start Time</th><th colspan=2>Reached Time</th>
			</tr>
			<tr>
				
				<td><input type=text name=servicetype value=<%=rs3.getString(1)%> readonly></td><td><input type=text name=servicenumber value=<%=rs3.getString(2)%> readonly></td><td><input type=text name=source value=<%=rs3.getString(3)%> readonly></td><td><input type=text name=destination value=<%=rs3.getString(4)%> readonly></td><td><input type=text name=startdate value=<%=rs3.getDate(5)%> readonly></td><td><input type=text name=reacheddate value=<%=rs3.getDate(6)%> readonly></td><td><input type=text name=starttime value=<%=rs3.getTime(7)%> readonly></td><td><input type=text name=reachedtime value=<%=rs3.getTime(8)%> readonly></td><td><input type=submit value="Book now"></td>

			</tr>
		</table>
		</form>


<%
			}

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