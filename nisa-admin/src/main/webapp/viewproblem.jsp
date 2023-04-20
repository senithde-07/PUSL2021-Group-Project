<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/12/2023
  Time: 2:11 PM
  To change this template use File | Settingss | File Templates.
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
                            class="flex items-center w-full p-2 text-gray-900 font-bold transition duration-75 rounded-lg group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700"
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
                               class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Allocate
                                Hall</a>
                        </li>
                        <li>
                            <a href="allocatedhall.jsp"
                               class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Allocated
                                Halls</a>
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
                            class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700"
                            aria-controls="dropdown-example" data-collapse-toggle="dropdown-example-4">
                            <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item> <i
                                    class="fa fa-cog"></i>&nbsp;&nbsp;Settings</span>
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
                               class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-green-500 dark:text-white dark:hover:bg-gray-700">Change
                                Password</a>
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
                    <h1 class="font-bold text-4xl uppercase">View Problem</h1>
                </div>
                <div class="flex items-center justify-center ">

                </div>
                <div class="flex items-center justify-end ">
                    <img src="assets/img/profile.png" class="pro-img w-12"/>
                    <h2 class="uppercase">&nbsp;&nbsp;<%=(String) session.getAttribute("name")%>
                    </h2>
                </div>
            </div>
        </div>


        <div class="grid grid-cols-2 gap-4 mb-4">
            <div class="justify-center mt-10 h-10 ">
                <div class="pb-4 bg-white dark:bg-gray-900 ">
                    <label for="table-search" class="sr-only">Search</label>
                    <div class="relative mt-1">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" aria-hidden="true"
                                 fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                      clip-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input type="text" id="table-search"
                               class="block p-2 pl-10 text-sm text-gray-900 border-green-500 rounded-lg w-80 bg-gray-50  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 "
                               placeholder="Search">
                    </div>
                </div>
            </div>
        </div>
        <%
            String driverName = "com.mysql.cj.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY";
            String dbName = "nisa_nsbm";
            String userId = "qs4crtkibjprhmu4i9dj";
            String password = "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9";

            try {
                Class.forName(driverName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>

        <div class="flex justify-center h-48 mb-4 ">
            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400 border ">
                <thead class="text-xs text-gray-700 uppercase bg-green-500 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col"
                        class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center uppercase">
                        STUDENT ID
                    </th>
                    <th scope="col"
                        class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center uppercase">
                        Problem
                    </th>
                    <th scope="col"
                        class="px-6 py-3 text-white font-black border-r dark:border-neutral-500 text-center uppercase">
                        Action
                    </th>

                </tr>
                </thead>
                <tbody>
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <%
                        try {
                            connection = DriverManager.getConnection(connectionUrl, userId, password);
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


                </tbody>
            </table>
        </div>
    </div>
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
