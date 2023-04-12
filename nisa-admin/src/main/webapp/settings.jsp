<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/11/2023
  Time: 2:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>

<!Doctype HTML>
<html>
<%
    HttpSession empsession = request.getSession(false);
    String sessionmail = (String) empsession.getAttribute("email");

    if (sessionmail == null) {

        String redmsg = "Please Login to your Admin account to continue!";
        request.setAttribute("message", redmsg);
        request.getRequestDispatcher("login.jsp").forward(request, response);
        response.sendRedirect("login.jsp");
    }
%>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
