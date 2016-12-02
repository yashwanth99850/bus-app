<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaResponse" %>

    <html>
      <body>
      <%
        String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6LfF8CkTAAAAALUCXWS6kcVbMW4ugVAyI25ZtqQC");

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

        if (reCaptchaResponse.isValid()) {
          request.getRequestDispatcher("Registration").forward(request,response);
        } else {
          response.sendRedirect("Reg.jsp");
        }
      %>
      </body>
    </html>