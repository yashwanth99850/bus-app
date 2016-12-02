

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/bookingdetails")
public class bookingdetails extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String bid=request.getParameter("servicetype");
		HttpSession session= request.getSession();
		session.setAttribute("bid1", bid);
		getServletContext().getRequestDispatcher("/details1.jsp").forward(request, response);

	}

}
