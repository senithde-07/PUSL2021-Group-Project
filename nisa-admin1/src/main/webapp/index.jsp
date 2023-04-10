<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.15/tailwind.min.css">
    <title>Dashboard</title>
</head>


<body>

<div id="mySidenav" class="sidenav">
    <img src="assets/img/NSBM Logo.png" class="w-40 mb-10 mx-auto">
    <a href="index.jsp" class="icon-a font-bold"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
    <a href="problem.jsp" class="icon-a"><i class="fa fa-question"></i> &nbsp;&nbsp;View Problem</a>
    <a href="solution.jsp" class="icon-a"><i class="fa fa-tasks"></i> &nbsp;&nbsp;Solution</a>
    <a href="hall.jsp" class="icon-a"><i class="fa fa-building"></i> &nbsp;&nbsp;Hall Allocation</a>
    <a href="timetable.jsp" class="icon-a"><i class="fa fa-calendar"></i> &nbsp;&nbsp;Add Timetable</a>
    <a href="logout" class="icon-a"><i class="fa fa-sign-out"></i> &nbsp;&nbsp;Logout</a>


</div>
<div id="main">

    <div class="head">
        <div class="col-div-6 font-bold">
            <span style="font-size:30px;cursor:pointer; color: rgb(0, 0, 0);" class="nav">&#9776; Dashboard</span>
            <span style="font-size:30px;cursor:pointer; color: rgb(0, 0, 0);" class="nav2">&#9776; Dashboard</span>
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

    <!-- <div class="col-div-3">
      <div class="box">
        <p>67<br /><span>Customers</span></p>
        <i class="fa fa-users box-icon"></i>
      </div>
    </div>
    <div class="col-div-3">
      <div class="box">
        <p>88<br /><span>Projects</span></p>
        <i class="fa fa-list box-icon"></i>
      </div>
    </div>
    <div class="col-div-3">
      <div class="box">
        <p>99<br /><span>Orders</span></p>
        <i class="fa fa-shopping-bag box-icon"></i>
      </div>
    </div>
    <div class="col-div-3">
      <div class="box">
        <p>78<br /><span>Tasks</span></p>
        <i class="fa fa-tasks box-icon"></i>
      </div>
    </div>
    <div class="clearfix"></div>
    <br /><br />
    <div class="col-div-8">
      <div class="box-8">
        <div class="content-box">
          <p>Top Selling Projects <span>Sell All</span></p>
          <br />
          <table>
            <tr>
              <th>Company</th>
              <th>Contact</th>
              <th>Country</th>
            </tr>
            <tr>
              <td>Alfreds Futterkiste</td>
              <td>Maria Anders</td>
              <td>Germany</td>
            </tr>
            <tr>
              <td>Centro comercial Moctezuma</td>
              <td>Francisco Chang</td>
              <td>Mexico</td>
            </tr>
            <tr>
              <td>Ernst Handel</td>
              <td>Roland Mendel</td>
              <td>Austria</td>
            </tr>
            <tr>
              <td>Island Trading</td>
              <td>Helen Bennett</td>
              <td>UK</td>
            </tr>


          </table>
        </div>
      </div>
    </div>

    <div class="col-div-4">
      <div class="box-4">
        <div class="content-box">
          <p>Total Sale <span>Sell All</span></p>

          <div class="circle-wrap">
            <div class="circle">
              <div class="mask full">
                <div class="fill"></div>
              </div>
              <div class="mask half">
                <div class="fill"></div>
              </div>
              <div class="inside-circle"> 70% </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->

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