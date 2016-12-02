import java.io.*;

import java.sql.*;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/ForgetPw")
public class ForgetPw extends HttpServlet
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
			String answ= request.getParameter("answ");	
ps=con.prepareStatement("select answer from ques1216 where username=?");
ps.setString(1,username);
rs=ps.executeQuery();
rs.next();
if(rs.getString(1).equals(answ))
{
getServletContext().getRequestDispatcher("/changepw.html").include(request,response);
}
else
{
response.getWriter().write("<html><head></head><body>Answer Incorrect<br></body></html>");
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