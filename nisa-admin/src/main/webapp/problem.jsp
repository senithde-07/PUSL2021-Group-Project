<%--
  Created by IntelliJ IDEA.
  User: sanid
  Date: 06/04/2023
  Time: 21:40
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
    <title>View Problem</title>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.15/tailwind.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/291b9d715f.js" crossorigin="anonymous"></script>
</head>


<body>

<div id="mySidenav" class="sidenav">
    <img src="assets/img/NSBM Logo.png" class="w-40 mb-10 mx-auto">
    <a href="index.jsp" class="icon-a"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
    <a href="problem.jsp" class="icon-a font-bold"><i class="fa fa-question"></i> &nbsp;&nbsp;View Problem</a>
    <a href="solution.jsp" class="icon-a"><i class="fa fa-tasks"></i> &nbsp;&nbsp;Solution</a>
    <a href="hall.jsp" class="icon-a"><i class="fa fa-building"></i> &nbsp;&nbsp;Hall Allocation</a>
    <a href="timetable.jsp" class="icon-a"><i class="fa fa-calendar"></i> &nbsp;&nbsp;Add Timetable</a>
    <a href="logout" class="icon-a"><i class="fa fa-sign-out"></i> &nbsp;&nbsp;Logout</a>


</div>
<div id="main">

    <div class="head">
        <div class="col-div-6 font-bold">
            <span style="font-size:30px;cursor:pointer; color: rgb(0, 0, 0);" class="nav">&#9776; View Problem</span>
            <span style="font-size:30px;cursor:pointer; color: rgb(0, 0, 0);" class="nav2">&#9776; View Problem</span>
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


    <!-- <div class="relative overflow-x-auto shadow-md ">
      <table
        class="min-w-full border w-full text-sm text-center text-gray-500 dark:text-gray-400 dark:border-neutral-500 table-auto">
        <thead class="border-b dark:border-neutral-500 text-xs text-gray-700 uppercase bg-green-500">
          <tr>
            <th scope="col" class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center">
              Student ID
            </th>
            <th scope="col" class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center">
              Problem
            </th>
            <th scope="col" class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center">
              Action
            </th>

          </tr>
        </thead>
        <tbody>
          <tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
            <th scope="row"
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              223654
            </th>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tortor, sagittis quis eros quis,
              <br>mattis viverra lorem. Aliquam interdum nibh non sem tristique rutrum.
            </td>
            <td class="flex items-center px-6 py-4 space-x-3">
              <a href="#" class="font-medium text-blue-600 dark:text-blue-500">Edit</a>
              <a href="#" class="font-medium text-red-600 dark:text-red-500 ">Remove</a>
            </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
            <th scope="row"
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              223654
            </th>
            <td
            class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tortor, sagittis quis eros quis,
            <br>mattis viverra lorem. Aliquam interdum nibh non sem tristique rutrum.
          </td>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              <div class="flex items-center mb-4">
                <input id="default-checkbox" type="checkbox" value="" class="w-4 h-4 text-green-600 ">
                <label for="default-checkbox"
                  class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">YES</label>
              </div>
            </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
            <th scope="row"
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              223654
            </th>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tortor, sagittis quis eros quis,
              <br>mattis viverra lorem. Aliquam interdum nibh non sem tristique rutrum.
            </td>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              <div class="flex items-center mb-4">
                <input id="default-checkbox" type="checkbox" value="" class="w-4 h-4 text-green-600 ">
                <label for="default-checkbox"
                  class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">YES</label>
              </div>
            </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
            <th scope="row"
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              223654
            </th>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tortor, sagittis quis eros quis,
              <br>mattis viverra lorem. Aliquam interdum nibh non sem tristique rutrum.
            </td>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              <div class="flex items-center mb-4">
                <input id="default-checkbox" type="checkbox" value="" class="w-4 h-4 text-green-600 ">
                <label for="default-checkbox"
                  class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">YES</label>
              </div>
            </td>
          </tr>
          <tr class="bg-white border-b dark:bg-gray-900 dark:border-gray-700">
            <th scope="row"
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              223654
            </th>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tortor, sagittis quis eros quis,
              <br>mattis viverra lorem. Aliquam interdum nibh non sem tristique rutrum.
            </td>
            <td
              class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
              <div class="flex items-center mb-4">
                <input id="default-checkbox" type="checkbox" value="" class="w-4 h-4 text-green-600 ">
                <label for="default-checkbox"
                  class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">YES</label>
              </div>
            </td>
          </tr>

        </tbody>
      </table>
    </div> -->


    <div class="relative overflow-x-auto shadow-md ">
        <div class="pb-4 bg-white dark:bg-gray-900">
            <label for="table-search" class="sr-only">Search</label>
            <div class="relative mt-1">
                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" aria-hidden="true" fill="currentColor"
                         viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                              clip-rule="evenodd"></path>
                    </svg>
                </div>
                <input type="text" id="table-search"
                       class="block p-2 pl-10 text-sm text-gray-900 border-gray-300 rounded-lg w-80 bg-gray-50  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 "
                       placeholder="Search">
            </div>
        </div>
        <%
            String driverName = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "nisa_nsbm";
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
        %>
        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400 ">
            <thead class="text-xs text-gray-700 uppercase bg-green-500 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center">
                    STUDENT ID
                </th>
                <th scope="col" class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center">
                    Problem
                </th>
                <th scope="col" class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center">
                    Action
                </th>

            </tr>
            </thead>
            <tbody>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                        statement = connection.createStatement();
                        String sql = "SELECT * FROM problem WHERE status='nw'";

                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                            String id = resultSet.getString("student_id");

                %>
                <th scope="row"
                    class="px-6 py-4 font-medium text-black whitespace-nowrap dark:text-white border-r dark:border-neutral-500">
                    <%=resultSet.getString("student_id")%>

                </th>
                <td class="px-6 py-4 text-black border-r dark:border-neutral-500">
                    <%=resultSet.getString("problem")%>

                </td>


                <td class=" items-center px-6 py-4 space-x-3 border-r dark:border-neutral-500">

                    <button onclick="window.location.href='prob-to-solution?id=<%=resultSet.getString("student_id")%>'"
                            data-modal-hide="popup-modal-2" type="button"
                            class="text-white bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                        Mark as done and Send Mail
                    </button>

                    <button onclick="window.location.href='prob.solved?id=<%=resultSet.getString("student_id")%>'"
                            data-modal-hide="popup-modal-2" type="button"
                            class="text-white bg-green-600 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                        Mark as done
                    </button>

                    <button onclick="window.location.href='prob.ignore?id=<%=resultSet.getString("student_id")%>'"
                            data-modal-hide="popup-modal-2" type="button"
                            class="text-white bg-red-600 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                        Ignore
                    </button>

                    <%--                    <a href="prob.solved?id=<%=resultSet.getString("student_id")%>"--%>
                    <%--                       class="font-medium text-green-600 dark:text-blue-500 hover:underline"><i--%>
                    <%--                            class="fa-solid fa-file-check" style="color: #16a34a;"></i>Mark as Done</a>--%>
                    <%--                    <a href="prob-to-solution?id=<%=resultSet.getString("student_id")%>"--%>
                    <%--                       class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Mark as Done and Send--%>
                    <%--                        Mail</a>--%>
                    <%--                    <a href="prob.ignore?id=<%=resultSet.getString("student_id")%>"--%>
                    <%--                       class="font-medium text-red-600 dark:text-red-500 hover:underline">Ignore</a>--%>


                </td>
            </tr>
            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>


            <%--            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">--%>
            <%--                <th scope="row"--%>
            <%--                    class="px-6 py-4 font-medium text-black whitespace-nowrap dark:text-white border-r dark:border-neutral-500">--%>
            <%--                    24165--%>
            <%--                </th>--%>
            <%--                <td class="px-6 py-4 text-black border-r dark:border-neutral-500">--%>
            <%--                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tortor, sagittis quis eros quis,--%>
            <%--                    <br>mattis viverra lorem. Aliquam interdum nibh non sem tristique rutrum.--%>
            <%--                </td>--%>
            <%--                <td class=" items-center px-6 py-4 space-x-3 border-r dark:border-neutral-500">--%>
            <%--                    <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Mark as Done</a>--%>
            <%--                    <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline">Igore</a>--%>
            <%--                </td>--%>
            <%--            </tr>--%>
            <%--            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">--%>
            <%--                <th scope="row"--%>
            <%--                    class="px-6 py-4 font-medium text-black whitespace-nowrap dark:text-white border-r dark:border-neutral-500">--%>
            <%--                    25613--%>
            <%--                </th>--%>
            <%--                <td class="px-6 py-4 text-black border-r dark:border-neutral-500">--%>
            <%--                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce elit tortor, sagittis quis eros quis,--%>
            <%--                    <br>mattis viverra lorem. Aliquam interdum nibh non sem tristique rutrum.--%>
            <%--                </td>--%>
            <%--                <td class=" items-center px-6 py-4 space-x-3 border-r dark:border-neutral-500">--%>
            <%--                    <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Mark as Done</a>--%>
            <%--                    <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline">Igore</a>--%>
            <%--                </td>--%>
            </
            >
            </tbody>
        </table>
    </div>


    <div class="clearfix"></div>
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
    <%--function sendIgRequest() {--%>
    <%--    var xhttp = new XMLHttpRequest();--%>
    <%--    xhttp.onreadystatechange = function() {--%>
    <%--        if (this.readyState == 4 && this.status == 200) {--%>
    <%--            console.log(this.responseText); // do something with the response--%>
    <%--        }--%>
    <%--    };--%>
    <%--    xhttp.open("GET", "prob.solved?id=<%=resultSet.getString("student_id")%>", true); // set the URL with parameters--%>
    <%--    xhttp.send();--%>
    <%--}--%>

</script>


</body>


</html>
