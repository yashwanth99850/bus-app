

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/Logout")
public class  Logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out  = response.getWriter();
		request.getSession().invalidate();
		out.println("You are sucessfully logged out");
		out.println("<html><head><body><a href=login.html>Login</a></body></head></html>");
	}
	

}
