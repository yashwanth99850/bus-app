import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
@WebServlet("/IDDetails") 
public class IDDetails extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
PrintWriter out = response.getWriter();
Connection con =null;
//System.out.println(s);
boolean status = false;
try {
String str = request.getParameter("idtype");
con=CPUtilsyash.getLogicalConnection();

CallableStatement  cstmt= con.prepareCall("{call proc_id1216(?)}");// sequence generation 
cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
cstmt.execute();
String idcode=cstmt.getString(1);
System.out.println(idcode);
PreparedStatement ps = con.prepareStatement("insert into idproofstypes_1216(idprooftypecode,description) values(?,?)");
ps.setString(1, idcode);
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
}
out.close();
}
}