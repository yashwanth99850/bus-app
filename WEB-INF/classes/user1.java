

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user1")
public class user1 extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uid=request.getParameter("bookingid");
		HttpSession session= request.getSession();
		session.setAttribute("bid1", uid);
		getServletContext().getRequestDispatcher("/userdetails2.jsp").forward(request, response);

	}

}