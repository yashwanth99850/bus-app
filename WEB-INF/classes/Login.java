import java.sql.*;

import java.io.*;
import org.apache.commons.codec.digest.DigestUtils; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/Login") 

public class Login extends HttpServlet
{
Connection con =null;
	
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
	PrintWriter out = response.getWriter();
	String username=request.getParameter("username");
	
	String password=request.getParameter("password");
	try {
	con = CPUtilsyash.getLogicalConnection();
			
			ps1=con.prepareStatement("select * from admin_1216");
			
			ResultSet rs = ps1.executeQuery();
			rs.next();
			ps2=con.prepareStatement("select password from jdbctest where username=?");
			ps2.setString(1,username);
			ResultSet rs2 = ps2.executeQuery();
			rs2.next();
			
			if(rs.getString(1).equals(username)&&rs.getString(2).equals(password))
			{
			out.print("Login successful");
			response.sendRedirect("index.html");
	        }
	else if(rs2.getString(1).equals(password))
	{
	response.sendRedirect("Ser.jsp");
	}
	else
	{
	out.println("Error");
	}
	}
	catch(SQLException e){
		/*e.printStackTrace();*/
		
		out.print("Enter Credentials");
		}catch(ClassNotFoundException e){
		/*e.printStackTrace();*/
		out.print("lll");
		}catch(Exception e){
		/*e.printStackTrace();*/
		out.print("lll");
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