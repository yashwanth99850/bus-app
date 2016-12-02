
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/servicedetails")
public class servicedetails extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String srnum=request.getParameter("servicenumber");
		String src=request.getParameter("source");
		String dest=request.getParameter("destination");
		String sd=request.getParameter("startdate");
		HttpSession session= request.getSession();
		session.setAttribute("srnum", srnum);
		session.setAttribute("src", src);
		session.setAttribute("dest", dest);
		session.setAttribute("sd", sd);
		getServletContext().getRequestDispatcher("/services1.jsp").forward(request, response);
	}

}
