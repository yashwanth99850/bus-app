<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

    <html>
      <body>
        <form action="serve.jsp" method="post">
        <%
          ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LfF8CkTAAAAAMMqmWFvy2GH4ST9kPV4NUpzElqH", "6LfF8CkTAAAAALUCXWS6kcVbMW4ugVAyI25ZtqQC", false);
          out.print(c.createRecaptchaHtml(null, null));
        %>
        <input type="submit" value="submit" />
        </form>
      </body>
    </html>