import java.io.*;

import java.sql.*;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/ChangePw")
public class ChangePw extends HttpServlet
{
        ResultSet rs=null;
        Connection con=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		
		try
		{
			con=CPUtilsyash.getLogicalConnection();
			String username=request.getParameter("username");
			String npwd=request.getParameter("npwd");
			ps=con.prepareStatement("update jdbctest set password=? where username=?");
			ps.setString(1,npwd);
            ps.setString(2,username);
            int r=ps.executeUpdate();
			if(r!=0){
			getServletContext().getRequestDispatcher("/login.html").include(request,response);
			}
			else
			{
			response.getWriter().write("<html><head></head><body>Not updated</body></html>");
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

	}
}