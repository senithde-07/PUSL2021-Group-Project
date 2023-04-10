<%--
  Created by IntelliJ IDEA.
  User: sanid
  Date: 06/04/2023
  Time: 21:41
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
<%--<%@page import="javax.servlet.http.HttpServlet" %>--%>
<%--<%@page import="javax.servlet.http.HttpServletRequest" %>--%>
<%--<%@page import="javax.servlet.http.HttpServletResponse" %>--%>
<%--<%@page import="javax.servlet.http.HttpSession" %>--%>
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
    <title>Solution</title>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.15/tailwind.min.css">
</head>


<body>

<div id="mySidenav" class="sidenav">
    <img src="assets/img/NSBM Logo.png" class="w-40 mb-10 mx-auto">
    <a href="index.jsp" class="icon-a"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
    <a href="problem.jsp" class="icon-a"><i class="fa fa-question"></i> &nbsp;&nbsp;View Problem</a>
    <a href="solution.jsp" class="icon-a font-bold"><i class="fa fa-tasks"></i> &nbsp;&nbsp;Solution</a>
    <a href="hall.jsp" class="icon-a"><i class="fa fa-building"></i> &nbsp;&nbsp;Hall Allocation</a>
    <a href="timetable.jsp" class="icon-a"><i class="fa fa-calendar"></i> &nbsp;&nbsp;Add Timetable</a>
    <a href="logout" class="icon-a"><i class="fa fa-sign-out"></i> &nbsp;&nbsp;Logout</a>


</div>
<div id="main">

    <div class="head">
        <div class="col-div-6 font-bold">
            <span style="font-size:30px;cursor:pointer; color: rgb(0, 0, 0);" class="nav">&#9776; Solution</span>
            <span style="font-size:30px;cursor:pointer; color: rgb(0, 0, 0);" class="nav2">&#9776; Solution</span>
        </div>

        <div class="col-div-6">
            <div class="profile">

                <img src="assets/img/NSBM Logo.png" class="pro-img"/>
                <p>Admin<span>NSBM</span></p>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="clearfix"></div>
    <br/>

    <p class="text-m font-bold my-2 text-red-500 text-center">${ermessage}<p>
    <p class="text-m font-bold my-2 text-green-500 text-center">${message}<p>

    <table>
        <tbody>
        <tr class="bg-white dark:bg-gray-800">
            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">

            </th>
            <td class="px-6 py-4">

            </td>
        </tr>
        <tr class="bg-white dark:bg-gray-800">
            <th scope="row"
                class="px-6 py-4 font-medium text-black font-bold uppercase whitespace-nowrap dark:text-white">
                Message Template
            </th>
            <td class="px-6 py-4">
                <form method="post" action="loadtemp">
                        <%
        String driverName = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String dbName = "nisa_admin";
        String userId = "root";
        String password = "";

        try {
          Class.forName(driverName);
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        ResultSet resultSet1 = null;
      %>
                    <select name="template"
                            class="bg-green-500 border border-white-300 text-gray-900 text-m rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-green-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option value="0">Select Template</option>
                        <%
                            try {
                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                statement = connection.createStatement();
                                String sql = "SELECT * FROM template_message";
                                resultSet = statement.executeQuery(sql);
                                while (resultSet.next()) {
                        %>

                        <option value="<%=resultSet.getString("template_name")%>"><%=resultSet.getString("template_name")%>
                        </option>

                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
            </td>
        </tr>


        </tbody>
    </table>
    <button type="submit"
            class="text-white mt-8 font-bold uppercase bg-green-500 hover:bg-green-600  font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">
        Select Template
    </button>
    </form>
    <br><br>


    <form method="post" action="sendmail">
        <div class="mb-6">
            <label for="email" class="block mb-2 text-sm font-medium text-black font-bold uppercase dark:text-white">Student
                ID</label>
            <input type="text" id="student id" value="${student_id}" name="id"
                   class="bg-gray-50 border border-gray-500 text-gray-900 text-sm rounded-lg  block w-full p-2.5 "
                   placeholder="" required>
        </div>
        <div class="mb-6">

            <label for="message" class="block mb-2 text-sm font-medium text-black font-bold uppercase dark:text-white">Message</label>
            <textarea id="message" rows="4" name="message"
                      class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-500"
                      required>${mail}</textarea>

        </div>
        <div class="flex items-start mb-6">

            <button type="submit"
                    class="text-white font-bold uppercase bg-green-500 hover:bg-green-600  font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">
                Send Mail
            </button>
    </form>


    <div class="clearfix"></div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    $(".nav").click(function () {
        $("#mySidenav").css('width', '70px');
        $("#main").css('margin-left', '70px');
        $(".logo").css('visibility', 'hidden');
        $(".logo span").css('visibility', 'visible');
        $(".logo span").css('margin-left', '-10px');
        $(".icon-a").css('visibility', 'hidden');
        $(".icons").css('visibility', 'visible');
        $(".icons").css('margin-left', '-8px');
        $(".nav").css('display', 'none');
        $(".nav2").css('display', 'block');
    });

    $(".nav2").click(function () {
        $("#mySidenav").css('width', '300px');
        $("#main").css('margin-left', '300px');
        $(".logo").css('visibility', 'visible');
        $(".icon-a").css('visibility', 'visible');
        $(".icons").css('visibility', 'visible');
        $(".nav").css('display', 'block');
        $(".nav2").css('display', 'none');
    });

</script>

</body>


</html>
