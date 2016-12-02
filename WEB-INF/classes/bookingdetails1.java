

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/bookingdetails1")
public class bookingdetails1 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String bid2=request.getParameter("fromdate");
		String bid3=request.getParameter("todate");
		HttpSession session= request.getSession();
		session.setAttribute("bid2", bid2);
		session.setAttribute("bid3", bid3);
		getServletContext().getRequestDispatcher("/details2.jsp").forward(request, response);
	}

}
