

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Newuser")
public class Newuser extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String bid=request.getParameter("bid");
		
		HttpSession session= request.getSession();
		session.setAttribute("bid1", bid);
		
		getServletContext().getRequestDispatcher("/newuserdetails1.jsp").forward(request, response);

	}

}