
import java.io.*;
import java.util.*;
import org.apache.commons.dbcp.BasicDataSource;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/Service")
public class Service extends HttpServlet
{
private Connection con=null;
private PreparedStatement pst=null;
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
try
{
PrintWriter out=response.getWriter();

String services=request.getParameter("services");
String servicenumber=request.getParameter("servicenumber");
String source=request.getParameter("source");
String destination=request.getParameter("destination");
String startdate=request.getParameter("startdate");
String enddate=request.getParameter("enddate");
String starttime=request.getParameter("starttime");
String endtime=request.getParameter("endtime");
String c1=startdate+" "+starttime;
String c2=enddate+" "+endtime;


con=CPUtilsyash.getLogicalConnection();

String query="INSERT INTO services_1216(servicetype,servicenumber,source,destination,startdate,reacheddate, starttime ,reachedtime) VALUES(?, ?, ?, ?, to_date(?,'yyyy-mm-dd'), to_date(?,'yyyy-mm-dd'), to_timestamp(?,'yyyy-mm-dd HH24:MI'), to_timestamp(?,'yyyy-mm-dd HH24:MI'))";
 pst = con.prepareStatement(query);
 pst.setString(1, services);
 pst.setString(2,servicenumber);
 pst.setString(3, source);
 pst.setString(4, destination);
 pst.setString(5, startdate);
 pst.setString(6, enddate);
 pst.setString(7, c1);
 pst.setString(8, c2);
int status= pst.executeUpdate();
 
if(status>0){
out.println("New Service has been added to the site");
}
}
catch(Exception e)
	{e.printStackTrace();
	}

finally
	{try 
{
	con.commit();

		con.close();
		pst.close();
	
} 
	catch (SQLException e)
 {
		
		e.printStackTrace();
	}
	}
}
}
