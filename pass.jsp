<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" language="javascript">javascript.window.history.forward(1);</script>
<script>
	function years()
	{
	    var res = booktick.dob.value.toString().split("-");
	    var thisday = new Date();
	    var thisyear = thisday.getFullYear();
	    var birthyear = parseInt(res[0]);
	    booktick.age.value = (thisyear - birthyear)-1;
	}
	function years1()
	{
	    var res = booktick.dob1.value.toString().split("-");
	    var thisday = new Date();
	    var thisyear = thisday.getFullYear();
	    var birthyear = parseInt(res[0]);
	    booktick.age1.value = (thisyear - birthyear)-1;
	}
	function years2()
	{
	    var res = booktick.dob2.value.toString().split("-");
	    var thisday = new Date();
	    var thisyear = thisday.getFullYear();
	    var birthyear = parseInt(res[0]);
	    booktick.age2.value = (thisyear - birthyear)-1;
	}
	function years3()
	{
	    var res = booktick.dob3.value.toString().split("-");
	    var thisday = new Date();
	    var thisyear = thisday.getFullYear();
	    var birthyear = parseInt(res[0]);
	    booktick.age3.value = (thisyear - birthyear)-1;
	}
	function years4()
	{
	    var res = booktick.dob4.value.toString().split("-");
	    var thisday = new Date();
	    var thisyear = thisday.getFullYear();
	    var birthyear = parseInt(res[0]);
	    booktick.age4.value = (thisyear - birthyear)-1;
	}
	function years5()
	{
	    var res = booktick.dob5.value.toString().split("-");
	    var thisday = new Date();
	    var thisyear = thisday.getFullYear();
	    var birthyear = parseInt(res[0]);
	    booktick.age5.value = (thisyear - birthyear)-1;
	}
	 function idproofvalid()
    {
        var n=booktick.idnum.value;
        var n1=booktick.idnum1.value;
        var n2=booktick.idnum2.value;
        var n3=booktick.idnum3.value;
        var n4=booktick.idnum4.value;
        var n5=booktick.idnum5.value;
        var count=0;
        if (n.length > 1)
        {
            count=count+1;
        }
        if (n1.length > 1)
        {
            count=count+1;
        }
        if (n2.length > 1)
        {
            count=count+1;
        }
        if (n3.length > 1)
        {
            count=count+1;
        }
        if (n4.length > 1)
        {
            count=count+1;
        }
        if (n5.length > 1)
        {
            count=count+1;
        }
        if(count<1)
        {
            alert("Atleast One idproof is needed");
            return false;
        }
        else
        {
            return true;
        }
    }


	function numpas()
	{
		var n=booktick.name.value;
		var n1=booktick.name1.value;
		var n2=booktick.name2.value;
		var n3=booktick.name3.value;
		var n4=booktick.name4.value;
		var n5=booktick.name5.value;
	    var count=0;
	    if (n.length > 1)
	    {
			count=count+1;
	    }
	    if (n1.length > 1)
	    {
			count=count+1;
	    }
	    if (n2.length > 1)
	    {
			count=count+1;
	    }
	    if (n3.length > 1)
	    {
			count=count+1;
	    }
	    if (n4.length > 1)
	    {
			count=count+1;
	    }
	    if (n5.length > 1)
	    {
			count=count+1;
	    }
	    booktick.numofpass.value=count;
		return true;
	}
</script>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>User</title>

	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/form-basic.css">

</head>


	
    <ul>
        
        
        <li><a href="Ser.jsp"class="active">View Services</a></li>
		<li><a href="newuserdetails.jsp">My Booking Details</a></li>
		<li><a href="Logout">SignOut</a></li>
        
    </ul>
		</table>
<%
	Connection con=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@aatrng1:1521:VIS","apps","apps");
		String servicen=request.getParameter("servicenumber");
%>
		<form name="booktick" action="bookings" method="POST" onSubmit="return numpas()&& idproofvalid()">
		<input type=hidden name="numofpass">
		<input type=text name="servicen" value=<%=servicen %>>
		<table border=2  bgcolor="#349F99" align="center">
			<tr>
				<td>Name</td><td>Date Of Birth</td><td>Age</td><td>ID Proof Type</td><td>ID Number</td><td>Contact Number</td><td>Email</td>
			</tr>
			<tr>
				<td><input type=text name="name"></td><td><input type="date" name="dob" onblur="years()"></td><td><input type=text name=age></td>
				<td><select name="idtype">
		<option value="Default">Select ID proof Type</option>
<%
		PreparedStatement ps1=con.prepareStatement("select description from idproofstypes_1216");
		ResultSet rs1=ps1.executeQuery();
%>
<% 
		if(rs1.next())
		{
%>		
		<option value=<%=rs1.getString(1) %>><%=rs1.getString(1) %></option>
<%
		}
%>
<% 
		while(rs1.next())
		{
%>		
		<option value=<%=rs1.getString(1) %>><%=rs1.getString(1) %></option>
<%
		}
%>
			</select>
			</td>
			<td><input type="text" name="idnum"></td><td><input type=text name="contact"></td><td><input type=text name="mail"></td>
			</tr>
			<tr>
				<td><input type=text name="name1"></td><td><input type="date" name="dob1" onblur="years1()"></td><td><input type=text name=age1></td>
				<td><select name="idtype1">
		<option value="Default">Select ID proof Type</option>
<%
		PreparedStatement ps2=con.prepareStatement("select description from idproofstypes_1216");
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
			</td>
				<td><input type="text" name="idnum1"></td><td><input type=text name="contact1"></td><td><input type=text name="mail1"></td>
			</tr>
			<tr>
				<td><input type=text name="name2"></td><td><input type="date" name="dob2" onblur="years2()"></td><td><input type=text name=age2></td>
				<td><select name="idtype2">
		<option value="Default">Select ID proof Type</option>
<%
		PreparedStatement ps3=con.prepareStatement("select description from idproofstypes_1216");
		ResultSet rs3=ps3.executeQuery();
%>
<% 
		if(rs3.next())
		{
%>		
		<option value=<%=rs3.getString(1) %>><%=rs3.getString(1) %></option>
<%
		}
%>
<% 
		while(rs3.next())
		{
%>		
		<option value=<%=rs3.getString(1) %>><%=rs3.getString(1) %></option>
<%
		}
%>
			</select>
			</td>
				<td><input type="text" name="idnum2"></td><td><input type=text name="contact2"></td><td><input type=text name="mail2"></td>
			</tr>
			<tr>
				<td><input type=text name="name3"></td><td><input type="date" name="dob3" onblur="years3()"></td><td><input type=text name=age3></td>
				<td><select name="idtype3">
		<option value="Default">Select ID proof Type</option>
<%
		PreparedStatement ps4=con.prepareStatement("select description from idproofstypes_1216");
		ResultSet rs4=ps4.executeQuery();
%>
<% 
		if(rs4.next())
		{
%>		
		<option value=<%=rs4.getString(1) %>><%=rs4.getString(1) %></option>
<%
		}
%>
<% 
		while(rs4.next())
		{
%>		
		<option value=<%=rs4.getString(1) %>><%=rs4.getString(1) %></option>
<%
		}
%>
			</select>
			</td>
				<td><input type="text" name="idnum3"></td><td><input type=text name="contact3"></td><td><input type=text name="mail3"></td>
			</tr>
			<tr>
				<td><input type=text name="name4"></td><td><input type="date" name="dob4" onblur="years4()"></td><td><input type=text name=age4></td>
				<td><select name="idtype4">
		<option value="Default">Select ID proof Type</option>
<%
		PreparedStatement ps5=con.prepareStatement("select description from idproofstypes_1216");
		ResultSet rs5=ps5.executeQuery();
%>
<% 
		if(rs5.next())
		{
%>		
		<option value=<%=rs5.getString(1) %>><%=rs5.getString(1) %></option>
<%
		}
%>
<% 
		while(rs5.next())
		{
%>		
		<option value=<%=rs5.getString(1) %>><%=rs5.getString(1) %></option>
<%
		}
%>
			</select>
			</td>
				<td><input type="text" name="idnum4"></td><td><input type=text name="contact4"></td><td><input type=text name="mail4"></td>
			</tr>
			<tr>
				<td><input type=text name="name5"></td><td><input type="date" name="dob5" onblur="years5()"></td><td><input type=text name=age5></td>
				<td><select name="idtype5">
		<option value="Default">Select ID proof Type</option>
<%
		PreparedStatement ps6=con.prepareStatement("select description from idproofstypes_1216");
		ResultSet rs6=ps6.executeQuery();
%>
<% 
		if(rs6.next())
		{
%>		
		<option value=<%=rs6.getString(1) %>><%=rs6.getString(1) %></option>
<%
		}
%>
<% 
		while(rs6.next())
		{
%>		
		<option value=<%=rs6.getString(1) %>><%=rs6.getString(1) %></option>
<%
		}
%>
			</select>
			</td>
				<td><input type="text" name="idnum5"></td><td><input type=text name="contact5"></td><td><input type=text name="mail5"></td>
			</tr>
			<tr>
				<td colspan=7 align=center><input type=submit value="Book Now"></td>
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