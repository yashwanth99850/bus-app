

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Print")
public class Print extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String boid=request.getParameter("boid");

		HttpSession session= request.getSession();
		session.setAttribute("boid",boid);
		
		getServletContext().getRequestDispatcher("/pt2.jsp").forward(request, response);

	}

}