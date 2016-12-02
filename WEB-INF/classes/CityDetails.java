import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
@WebServlet("/CityDetails") 
public class CityDetails extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out = response.getWriter();
Connection con =null;
//System.out.println(s);
boolean status = false;
try {
String str = request.getParameter("city");
con=CPUtilsyash.getLogicalConnection();

CallableStatement  cstmt= con.prepareCall("{call proc_city1216(?)}");// sequence generation 
cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
cstmt.execute();
String citycode=cstmt.getString(1);
System.out.println(citycode);
PreparedStatement ps = con.prepareStatement("insert into city_1216(citycode,description) values(?,?)");
ps.setString(1, citycode);
ps.setString(2, str);
ResultSet rs = ps.executeQuery();
status = rs.next();
if(status) 
{
out.print("seq id has been inserted to database");
} 
else 
{
out.print("Error...");
}

} catch (Exception e) {
System.out.println(e);
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
out.close();
}

}