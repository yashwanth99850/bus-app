<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Basic Form</title>

	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/form-basic.css">
<script> 
function validateform(){  
name=new Date();
name1=new Date();
var name=document.b.startdate.value;  
var name1=document.b.enddate.value;  
if (name1>name){  
  alert("end date can't be before start date");  
  return false; 
  }
  }
</script>
</head>
	<ul>
        <li><a href="bus.html">Bus Type</a></li>
        <li><a href="id.html">ID Type</a></li>
        <li><a href="city.html">City</a></li>
		<li><a href="Services.jsp"class="active">Add Services</a></li>
		<li><a href="details.jsp">Booking Details</a></li>
		<li><a href="Logout">Logout</a></li>
        
    </ul>

   
	<% 
		Connection con =null;
		ResultSet rs=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		CallableStatement cs=null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			 con = DriverManager.getConnection("jdbc:oracle:thin:@aatrng1.appsassociates.com:1521:VIS", "apps", "apps");
			
			Statement st = con.createStatement();
			
			 rs = st.executeQuery("select description from servicestypes_1216");
			System.out.println("bustype is fetched");
			
		%>
		<center>
			<form  name="b" method="get" action="Service" onsubmit="return validateform()">
				<table>
					<tr>
						<td>Services:</td>
						<td>
							<select name="services" >
							<option  disabled selected>SERVICE TYPE</option> 
								<%  while(rs.next()){ %>
									<option><%= rs.getString(1)%></option>
								<% } %>
							</select>
						</td>
					</tr>
					
			<%cs= con.prepareCall("{call proc_servicenumber1216(?)}");
			cs.registerOutParameter(1, java.sql.Types.VARCHAR);
			cs.execute();%>
					<tr>
						<td>ServiceNumber:</td>
						<td>
							<select name="servicenumber">
								
							
							<option><%= cs.getString(1)%></option>
							</select>
						</td>
					</tr>
			
					
					
			<% rs1 = st.executeQuery("select description from city_1216");
			System.out.println("city is fetched");%>
					<tr>
						<td>Source:</td>
						<td>
							<select name="source">
							<option disabled selected>SOURCE</option>
								<%  while(rs1.next()){ %>
									<option><%= rs1.getString(1)%></option>
								<% } %>
							</select>
						</td>
					</tr>
			<% rs2 = st.executeQuery("select description from city_1216");
			System.out.println("citydesc  is fetched");%>
					<tr>
						<td>Destination:</td>
						<td>
							<select name="destination">
							<option disabled selected>DESTINATION</option>
								<%  while(rs2.next()){ %>
									<option><%= rs2.getString(1)%></option>
								<% } %>
							</select>
						</td>
					</tr>
					<tr>
						<td>StartDate:</td>
						<td>
							<input type="date"  name="startdate">
						</td>
					</tr>
					<tr>
						<td>ReachDate:</td>
						<td>
							<input type="date"   name="enddate">
						</td>
					</tr>
					<tr>
						<td>StartTime:</td>
						<td>
							<input type="time" name="starttime">(format-hh:mm:am/pm)
						</td>
					</tr>
					<tr>
						<td>ReachTime:</td>
						<td>
							<input type="time" name="endtime">(format-hh:mm:am/pm)
						</td>
					</tr>
					
					
					
					
				</table>
				<input type="submit" name="submit" value="Submit">
			</form>
		</center>
	<%
		
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
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