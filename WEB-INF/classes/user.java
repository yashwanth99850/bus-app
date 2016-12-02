

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user")
public class user extends HttpServlet {
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uid=request.getParameter("username");
		String pass=request.getParameter("password");
		String email=request.getParameter("email");
		HttpSession session= request.getSession();
		session.setAttribute("bid1", uid);
		session.setAttribute("bid2", pass);
		session.setAttribute("bid3", email);
		getServletContext().getRequestDispatcher("/userdetails1.jsp").forward(request, response);

	}

}