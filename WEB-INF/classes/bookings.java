

import java.io.*;
import java.sql.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import java.util.Date;

@WebServlet("/bookings")
public class bookings extends HttpServlet {
	
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String DATE_FORMAT = "yyyyMMdd";
	    SimpleDateFormat sdf =new SimpleDateFormat(DATE_FORMAT);
		Calendar c1 = Calendar.getInstance();
		String d=sdf.format(c1.getTime());
		Connection con=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		PreparedStatement ps2=null;
		PreparedStatement ps3=null;
		PreparedStatement ps4=null;
		PreparedStatement ps5=null;
		CallableStatement cs=null;
		CallableStatement cs1=null;
		try
		{
			con=CPUtilsyash.getLogicalConnection();
			HttpSession session= request.getSession();
			String srnum= (String)session.getAttribute("srnum");
			String src= (String)session.getAttribute("src");
			String dest= (String)session.getAttribute("dest");
			String sd= (String)session.getAttribute("sd");
			String servicen=request.getParameter("servicen");
			String count=request.getParameter("numofpass");
			int co=Integer.parseInt(count);
			cs= con.prepareCall("{call booking_seq1216(?)}");
			cs.registerOutParameter(1, java.sql.Types.VARCHAR);
			cs.execute();
			int r=0;
			ArrayList<bookingd> al=new ArrayList<bookingd>();  
			al.add(new bookingd(request.getParameter("name"),request.getParameter("dob"),request.getParameter("age"),request.getParameter("idtype"),request.getParameter("idnum"),request.getParameter("contact"),request.getParameter("mail")));  
			al.add(new bookingd(request.getParameter("name1"),request.getParameter("dob1"),request.getParameter("age1"),request.getParameter("idtype1"),request.getParameter("idnum1"),request.getParameter("contact1"),request.getParameter("mail1")));  
			al.add(new bookingd(request.getParameter("name2"),request.getParameter("dob2"),request.getParameter("age2"),request.getParameter("idtype2"),request.getParameter("idnum2"),request.getParameter("contact2"),request.getParameter("mail2")));  
			al.add(new bookingd(request.getParameter("name3"),request.getParameter("dob3"),request.getParameter("age3"),request.getParameter("idtype3"),request.getParameter("idnum3"),request.getParameter("contact3"),request.getParameter("mail3")));  
			al.add(new bookingd(request.getParameter("name4"),request.getParameter("dob4"),request.getParameter("age4"),request.getParameter("idtype4"),request.getParameter("idnum4"),request.getParameter("contact4"),request.getParameter("mail4")));  
			al.add(new bookingd(request.getParameter("name5"),request.getParameter("dob5"),request.getParameter("age5"),request.getParameter("idtype5"),request.getParameter("idnum5"),request.getParameter("contact5"),request.getParameter("mail5")));  
			for(bookingd b: al)
			{
				System.out.println(b.name+" "+b.dob+" "+b.age+" "+b.idproof+" "+b.idnum+" "+b.phn+" "+b.email);
			}
			for(int i=0;i<co;i++)
			{
				cs1= con.prepareCall("{call pass_seq1216(?)}");
				cs1.registerOutParameter(1, java.sql.Types.VARCHAR);
				cs1.execute();
				ps = con.prepareStatement("insert into passengers_1216 VALUES(?, ?, ?,to_date(?,'yyyy-mm-dd'),?,?,?,?,?)");
				ps.setString(1, cs.getString(1));
				ps.setString(2, cs1.getString(1));
				ps.setString(3, al.get(i).name);
				ps.setString(4, al.get(i).dob);
				ps.setString(5, al.get(i).age);
				ps.setString(6, al.get(i).idproof);
				ps.setString(7, al.get(i).idnum);
				ps.setString(8, al.get(i).phn);
				ps.setString(9, al.get(i).email);
				r= ps.executeUpdate();
				
				if(r!=0)
				{
						//Sending Mail to the user
			final String user="yashwanth.reddy99850@gmail.com";
		final String password="yashusri";
		
 
  String to=al.get(i).email;//change accordingly

   //Get the session object
   Properties props = new Properties();
 
     props.put("mail.smtp.host", "smtp.gmail.com");
     //below mentioned mail.smtp.port is optional
     props.put("mail.smtp.port", "587");		
     props.put("mail.smtp.auth", "true");
     props.put("mail.smtp.starttls.enable", "true");
   
    Session session1 = Session.getDefaultInstance(props,
    new javax.mail.Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(user,password);
      }
    });

   //Compose the message
    try {
     MimeMessage message = new MimeMessage(session1);
     message.setFrom(new InternetAddress(user));
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
     message.setSubject("smtp.gmail.com");
     message.setText("HI "+al.get(i).name+" your booking id  is "+cs.getString(1));
     
    //send the message
     Transport.send(message);

     
 
     } catch (MessagingException e) {e.printStackTrace();}

				}
			}
			
				ps1= con.prepareStatement("select * from services_1216 where servicenumber=?");
				ps1.setString(1, servicen);
				ResultSet rs=ps1.executeQuery();
				System.out.println(servicen);
				if(rs.next())
				{
					System.out.println(rs.getString(5));
					System.out.println(rs.getString(6));
					System.out.println(rs.getString(7));
					System.out.println(rs.getString(8));
					System.out.println(d);
					
					ps = con.prepareStatement("insert into bookings_1216 VALUES(?,?,?,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),to_date(?,'yyyy-mm-dd hh24:mi:ss'),to_timestamp(?,'yyyy-mm-dd HH24:MI:ss'),to_timestamp(?,'yyyy-mm-dd HH24:MI:ss'),to_date(?,'yyyyMMdd'),?)");
					ps.setString(1, cs.getString(1));
					ps.setString(2, rs.getString(1));
					ps.setString(3, rs.getString(2));
					ps.setString(4, rs.getString(3));
					ps.setString(5, rs.getString(4));
					ps.setString(6, rs.getString(5));
					ps.setString(7, rs.getString(6));
					ps.setString(8, rs.getString(7));
					ps.setString(9, rs.getString(8));
					ps.setString(10, d);
					ps.setInt(11, co);
					int rs1=ps.executeUpdate();
					if(rs1!=0)
					{
						getServletContext().getRequestDispatcher("/Ser.jsp").include(request,response);
						response.getWriter().write("<html><body><center><font color=green><strong>");
						response.getWriter().write("Booking details are saved ...");
						response.getWriter().write("</strong></font></center></body></html>");
					}
				}
				else
				{
				getServletContext().getRequestDispatcher("/Ser.jsp").include(request,response);
				response.getWriter().write("<html><body><center><font color=green<strong>");
				response.getWriter().write("Service number is not present...");
				response.getWriter().write("</strong></font></center></body></html>");
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
finally
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
