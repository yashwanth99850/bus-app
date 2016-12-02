import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/Registration")
public class Registration extends HttpServlet {

	Connection con =null;
	
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
      
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String answ = request.getParameter("answ");
		try {
			
			con = CPUtilsyash.getLogicalConnection();
			
			ps1=con.prepareStatement("insert into jdbctest values(?,?)");
			ps1.setString(1,username);
			ps1.setString(2,password);
			ps1.executeQuery();
			ps2=con.prepareStatement("insert into ques1216 values(?,?)");
			ps2.setString(1,username);
			ps2.setString(2,answ);
			ps2.executeQuery();
			out.print("Registered successfully");
			out.println("<a href='login.html'>Login</a>");
			}
		catch(Exception e){
		e.printStackTrace();
		}
		finally{
			try {
				ps1.close();
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
}		
}