<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/13/2023
  Time: 8:27 PM
  To change this template use File | Settings | File Templates.
--%>
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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css" rel="stylesheet" />
  <title>Change Positions</title>
  <link rel="icon" type="image/x-icon" href="assets/img/favicon.png">
</head>


<body>


<div>

  <button data-drawer-target="sidebar-multi-level-sidebar" data-drawer-toggle="sidebar-multi-level-sidebar"
          aria-controls="sidebar-multi-level-sidebar" type="button"
          class="inline-flex items-center p-2 mt-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
    <span class="sr-only">Open sidebar</span>
    <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
         xmlns="http://www.w3.org/2000/svg">
      <path clip-rule="evenodd" fill-rule="evenodd"
            d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z">
      </path>
    </svg>
  </button>

  <aside id="sidebar-multi-level-sidebar"
         class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0"
         aria-label="Sidebar">
    <div class="h-full px-3 py-4 overflow-y-auto bg-gray-100 dark:bg-gray-800">
      <img src="assets/img/NSBM Logo.png" class="w-40 mb-10 mx-auto">
      <ul class="space-y-2 font-medium">
        <li>
          <a href="index.jsp"
             class="flex items-center p-2 text-gray-900  rounded-lg dark:text-white hover:bg-green-500 dark:hover:bg-gray-700">
            <span class="ml-3"><i class="fa fa-dashboard icons"></i>&nbsp;&nbsp;Dashboard</span>
          </a>
        </li>
        <li>
          <button type="button"
                  class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700"
                  aria-controls="dropdown-example" data-collapse-toggle="dropdown-example-1">
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item> <i
                                    class="fa fa-question"></i>&nbsp;&nbsp;&nbsp;Problem</span>
            <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    clip-rule="evenodd"></path>
            </svg>
          </button>
          <ul id="dropdown-example-1" class="hidden py-2 space-y-2">
            <li>
              <a href="viewproblem.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">View
                Problem</a>
            </li>
            <li>
              <a href="solvedproblem.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Solved
                Problems</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="solution.jsp"
             class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-green-500 dark:hover:bg-gray-700">
            <span class="ml-3"><i class="fa fa-tasks"></i>&nbsp;&nbsp;Solution</span>
          </a>
        </li>
        <li>
          <button type="button"
                  class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700"
                  aria-controls="dropdown-example" data-collapse-toggle="dropdown-example-2">
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item> <i
                                    class="fa fa-building"></i>&nbsp;&nbsp;Hall Allocation</span>
            <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    clip-rule="evenodd"></path>
            </svg>
          </button>
          <ul id="dropdown-example-2" class="hidden py-2 space-y-2">
            <li>
              <a href="hall.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Allocate Hall</a>
            </li>
            <li>
              <a href="allocatedhall.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Allocated Halls</a>
            </li>
          </ul>
        </li>
        <li>
          <button type="button"
                  class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700"
                  aria-controls="dropdown-example" data-collapse-toggle="dropdown-example-3">
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item> <i
                                    class="fa fa-calendar"></i>&nbsp;&nbsp;Time Table</span>
            <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    clip-rule="evenodd"></path>
            </svg>
          </button>
          <ul id="dropdown-example-3" class="hidden py-2 space-y-2">
            <li>
              <a href="timetable.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Add
                Timetable</a>
            </li>
            <li>
              <a href="viewtimetable.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">View
                Timetables</a>
            </li>
          </ul>
        </li>
        <li>
          <button type="button"
                  class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg font-bold group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700"
                  aria-controls="dropdown-example" data-collapse-toggle="dropdown-example-4">
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item> <i
                                    class="fa fa-cog"></i>&nbsp;&nbsp;Setting</span>
            <svg sidebar-toggle-item class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20"
                 xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                    clip-rule="evenodd"></path>
            </svg>
          </button>
          <ul id="dropdown-example-4" class="hidden py-2 space-y-2">
            <li>
              <a href="password.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Change Password</a>
            </li>
            <li>
              <a href="mail.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Add
                Mail Template</a>
            </li>
            <li>
              <a href="position.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Change
                Positions</a>
            </li>
            <li>
              <a href="batch.jsp"
                 class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Add
                or Remove Batch</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="logout"
             class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-green-500 dark:hover:bg-gray-700">
            <span class="ml-3"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;Logout</span>
          </a>
        </li>
      </ul>
    </div>
  </aside>



</div>



<div class="p-4 sm:ml-64">
  <div class="">
    <div class="box-border h-25 w-full p-4 border-4 ...">
      <div class="grid grid-cols-3 gap-4 mb-2">
        <div class="flex items-center justify-self-start ">
          <h1 class="font-bold text-4xl uppercase">Change Positions</h1>
        </div>
        <div class="flex items-center justify-center ">

        </div>
        <div class="flex items-center justify-end ">
          <img src="assets/img/profile.png" class="pro-img w-12" />
          <h2 class="uppercase">&nbsp;&nbsp;Admin</h2>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="p-4 sm:ml-64">
  <p class="text-m font-bold my-2 text-green-500 text-center"><p>


  <form method="post" action="">
    <div class="relative overflow-x-auto">
      <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <tbody>
        <tr class="bg-white dark:bg-gray-800">
          <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">

          </th>
          <td class="px-6 py-4">

          </td>
        </tr>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
          <th scope="row"
              class="px-6 py-4 font-medium text-black font-bold uppercase whitespace-nowrap dark:text-white">
            Name
          </th>
          <td class="px-6 py-4">
              <input type="text" id="" value="" name="id"
                     class="bg-gray-50 border border-green-500 text-gray-900 text-sm rounded-lg  block w-full p-2.5 "
                     placeholder="" required>
          </td>

        </tr>
        <tr class="bg-white dark:bg-gray-800">
          <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">

          </th>
          <td class="px-6 py-4">

          </td>
        </tr>

        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
          <th scope="row"
              class="px-6 py-4 font-medium text-black font-bold uppercase whitespace-nowrap dark:text-white">
            Currunt Position
          </th>
          <td class="px-6 py-4">
            <select required name=""
                    class="bg-white border-green-500 text-gray-900 text-m rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-green-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
              <option>Select Positions</option>
          </td>
        </tr>

        <tr class="bg-white dark:bg-gray-800">
          <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">

          </th>
          <td class="px-6 py-4">

          </td>
        </tr>

        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
          <th scope="row"
              class="px-6 py-4 font-medium text-black font-bold uppercase whitespace-nowrap dark:text-white">
            New Position
          </th>
          <td class="px-6 py-4">
            <select required name=""
                    class="bg-white border-green-500 text-gray-900 text-m rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-green-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
              <option>Select Positions</option>
          </td>
        </tr>

        </tbody>
      </table>


      <button type="submit"
              class="text-white mt-8 font-bold uppercase bg-green-500 hover:bg-green-600  font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center ">
        Change Position
      </button>

    </div>
  </form>
</div>















<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
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
