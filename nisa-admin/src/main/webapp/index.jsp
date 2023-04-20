<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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

    // db configurations
    Connection con = null;
    Statement st = null;


%>
<head>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.15/tailwind.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css" rel="stylesheet"/>
    <title>Dashboard</title>
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
                       class="flex items-center p-2 text-gray-900 font-bold rounded-lg dark:text-white hover:bg-green-500 dark:hover:bg-gray-700">
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
                                or remove Batch</a>
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
                    <h1 class="font-bold text-4xl uppercase">Dashboard</h1>
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
    </div>
</div>

<div class="p-4 sm:ml-64">
    <div class="p-4 dark:border-gray-700">
        <div class="grid grid-cols-3 gap-4 mb-4">
            <div class="mt-4 w-full lg:w-6/12 xl:w-3/12 px-5 mb-4">
                <div class="relative flex flex-col min-w-0 break-words bg-white rounded mb-3 xl:mb-0 shadow-lg">
                    <div class="flex-auto p-4">
                        <div class="flex flex-wrap">
                            <div class="relative w-full pr-4 max-w-full flex-grow flex-1">
                                <h5 class="text-black uppercase font-bold text-xs"> Today's Usage</h5>
                                <%
                                    LocalDate today2 = LocalDate.now();
                                    try {
                                        Connection connection = null;
                                        Statement statement = null;

                                        connection = DriverManager.getConnection(connectionUrl, userId, password);
                                        statement = connection.createStatement();
                                        PreparedStatement ps = connection.prepareStatement("SELECT COUNT(session_id) AS sessioncount FROM sessions WHERE date=?;");
                                        ps.setString(1, String.valueOf(today2));

                                        ResultSet resultSet1 = ps.executeQuery();
                                        ;
                                        while (resultSet1.next()) {


                                %>
                                <span class="font-semibold text-5xl text-blueGray-700"><%=resultSet1.getString("sessioncount")%></span>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } %>
                            </div>
                            <div class="relative w-auto pl-4 flex-initial">
                                <div
                                        class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 shadow-lg rounded-full  bg-green-500">
                                    <i class="fa fa-pie-chart"></i>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="mt-4 w-full lg:w-6/12 xl:w-3/12 px-5 mb-4">
                <div class="relative flex flex-col min-w-0 break-words bg-white rounded mb-3 xl:mb-0 shadow-lg">
                    <div class="flex-auto p-4">
                        <div class="flex flex-wrap">
                            <div class="relative w-full pr-4 max-w-full flex-grow flex-1">
                                <h5 class="text-black uppercase font-bold text-xs">pending problems</h5>
                                <%
                                    try {
                                        Connection connection = null;
                                        Statement statement = null;
                                        ResultSet resultSet2 = null;

                                        connection = DriverManager.getConnection(connectionUrl, userId, password);
                                        statement = connection.createStatement();
                                        String sql2 = "SELECT COUNT(p_id) AS newno FROM problem WHERE status='nw'";

                                        resultSet2 = statement.executeQuery(sql2);
                                        while (resultSet2.next()) {


                                %>
                                <span class="font-semibold text-5xl text-blueGray-700"><%=resultSet2.getString("newno")%></span>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } %>
                            </div>
                            <div class="relative w-auto pl-4 flex-initial">
                                <div
                                        class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 shadow-lg rounded-full  bg-green-500">
                                    <i class="fa fa-exclamation"></i>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="mt-4 w-full lg:w-6/12 xl:w-3/12 px-5 mb-4">
                <div class="relative flex flex-col min-w-0 break-words bg-white rounded mb-3 xl:mb-0 shadow-lg">
                    <div class="flex-auto p-4">
                        <div class="flex flex-wrap">
                            <div class="relative w-full pr-4 max-w-full flex-grow flex-1">
                                <h5 class="text-black uppercase font-bold text-xs">solved problem</h5>
                                <%
                                    try {
                                        Connection connection = null;
                                        Statement statement = null;
                                        ResultSet resultSet3 = null;

                                        connection = DriverManager.getConnection(connectionUrl, userId, password);
                                        statement = connection.createStatement();
                                        String sql3 = "SELECT COUNT(p_id) AS solvedno FROM problem WHERE status='ok'";

                                        resultSet3 = statement.executeQuery(sql3);
                                        while (resultSet3.next()) {


                                %>
                                <span class="font-semibold text-5xl text-blueGray-700"><%=resultSet3.getString("solvedno")%></span>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } %>
                            </div>
                            <div class="relative w-auto pl-4 flex-initial">
                                <div
                                        class="text-white p-3 text-center inline-flex items-center justify-center w-12 h-12 shadow-lg rounded-full  bg-green-500">
                                    <i class="fa fa-check"></i>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="grid  grid-cols-2 gap-4 mb-4">
            <div class="w-full xl:w-4/12 px-4">
                <div class="relative flex flex-col min-w-0 break-words w-full mb-8 shadow-lg rounded-lg bg-white">
                    <div class="rounded-t mb-0 px-4 py-3 bg-transparent">
                        <div class="flex flex-wrap items-center">
                            <div class="relative w-full max-w-full flex-grow flex-1">
                                <h2 class="text-xl font-bold text-black uppercase">Daily Usage</h2>
                            </div>
                        </div>
                    </div>
                    <div class="shadow-lg rounded-lg overflow-hidden">
                        <canvas class="p-10" id="chartLine"></canvas>
                    </div>
                </div>
            </div>

            <div class="grid-rows-2">
                <div class="w-full xl:w-4/12 px-4">
                    <div class="relative flex flex-col min-w-0 break-words w-full mb-8 shadow-lg rounded-lg bg-white text-blueGray-700">
                        <div class="px-6 py-4 border-0">
                            <div class="flex flex-wrap items-center">
                                <div class="relative w-full max-w-full flex-grow flex-1">
                                    <h3 class="font-bold text-lg text-black uppercase">Frequently Asked Questions</h3>
                                </div>
                            </div>
                        </div>
                        <div class="block w-full overflow-x-auto">
                            <table class="items-center w-full bg-transparent border-collapse">
                                <%
                                    try {
                                        Connection connection = null;
                                        Statement statement = null;
                                        ResultSet resultSet3 = null;

                                        connection = DriverManager.getConnection(connectionUrl, userId, password);
                                        statement = connection.createStatement();
                                        String sql3 = "SELECT intent_name, COUNT(intent_name) as count FROM user_questions GROUP BY intent_name ORDER BY count DESC LIMIT 3;";

                                        resultSet3 = statement.executeQuery(sql3);
                                        while (resultSet3.next()) {
                                            int num=1;
                                            String intentname=resultSet3.getString(1);
                                            String count=resultSet3.getString(2);



                                %>
                                <tbody>
                                <tr>
<%--                                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">--%>
<%--                                        <div class="flex items-center"><span--%>
<%--                                                class="ml-3 font-bold text-black NaN"><%=num%>.</span></div>--%>
<%--                                    </td>--%>
                                    <td class="border-t-0 px-6 align- border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                                        <div class="flex items-center"><span class="ml-3 font-bold text-black NaN"><%=intentname%></span>
                                        </div>
                                    </td>
                                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                                        <div class="flex items-center text-black"><%=count%></div>
                                    </td>
                                </tr>
                                <% num++;
                                        }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="w-full xl:w-4/12 px-4">
                    <div class="relative flex flex-col min-w-0 break-words w-full mb-8 shadow-lg rounded-lg bg-white text-blueGray-700">
                        <div class="px-6 py-4 border-0">
                            <div class="flex flex-wrap items-center">
                                <div class="relative w-full max-w-full flex-grow flex-1">
                                    <h3 class="font-bold text-lg text-black uppercase">Mostly Reported Problems</h3>
                                </div>
                            </div>
                        </div>
                        <div class="block w-full overflow-x-auto">
                            <table class="items-center w-full bg-transparent border-collapse">

                                <tbody>
                                <%
                                    try {
                                        Connection connection = null;
                                        Statement statement = null;
                                        ResultSet resultSet5 = null;

                                        connection = DriverManager.getConnection(connectionUrl, userId, password);
                                        statement = connection.createStatement();
                                        String sql3 = "SELECT intent_name, COUNT(intent_name) as count FROM user_questions WHERE intent_name LIKE \"prob.%\" GROUP BY intent_name ORDER BY count DESC LIMIT 3;";

                                        resultSet5 = statement.executeQuery(sql3);
                                        while (resultSet5.next()) {

                                            String probname=resultSet5.getString(1);
                                            String probcount=resultSet5.getString(2);



                                %>
                                <tr>
<%--                                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">--%>
<%--                                        <div class="flex items-center"><span--%>
<%--                                                class="ml-3 font-bold text-black NaN">1.</span></div>--%>
<%--                                    </td>--%>
                                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                                        <div class="flex items-center"><span class="ml-3 font-bold text-black NaN"><%=probname%></span>
                                        </div>
                                    </td>
                                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                                        <div class="flex items-center text-black"><%=probcount%></div>
                                    </td>
                                </tr>
                                <%
                                }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="grid grid-cols-2 gap-4 mb-4">

    </div>
</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                "qs4crtkibjprhmu4i9dj",
                "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
        st = con.createStatement();
        LocalDate today = LocalDate.now(); // get today's date
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM");

        //FOR DAY 6
        LocalDate sixDaysAgo = today.minusDays(6); // subtract 4 days
        String six = String.valueOf(sixDaysAgo);
        PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(session_id) AS sessioncount FROM sessions WHERE date=?");
        ps1.setString(1, six);

        ResultSet rs1 = ps1.executeQuery();
        while (rs1.next()) {
            int daysixcount = Integer.parseInt(rs1.getString(1));
            String daysixdate = sixDaysAgo.format(formatter);

            //FOR DAY 5
            LocalDate fiveDaysAgo = today.minusDays(5);
            String five = String.valueOf(fiveDaysAgo);
            PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(session_id) AS sessioncount FROM sessions WHERE date=?");
            ps2.setString(1, five);

            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                int dayfivecount = Integer.parseInt(rs2.getString(1));
                String dayfivedate = fiveDaysAgo.format(formatter);


                //FOR DAY 4
                LocalDate fourDaysAgo = today.minusDays(4);
                String four = String.valueOf(fourDaysAgo);
                PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(session_id) AS sessioncount FROM sessions WHERE date=?");
                ps3.setString(1, four);

                ResultSet rs3 = ps3.executeQuery();
                while (rs3.next()) {
                    int dayfourcount = Integer.parseInt(rs3.getString(1));
                    String dayfourdate = fourDaysAgo.format(formatter);


                    //FOR DAY 3
                    LocalDate threeDaysAgo = today.minusDays(3);
                    String three = String.valueOf(threeDaysAgo);
                    PreparedStatement ps4 = con.prepareStatement("SELECT COUNT(session_id) AS sessioncount FROM sessions WHERE date=?");
                    ps4.setString(1, three);

                    ResultSet rs4 = ps4.executeQuery();
                    while (rs4.next()) {
                        int daythreecount = Integer.parseInt(rs4.getString(1));
                        String daythreedate = threeDaysAgo.format(formatter);


                        //FOR DAY 2
                        LocalDate twoDaysAgo = today.minusDays(2);
                        String two = String.valueOf(twoDaysAgo);
                        PreparedStatement ps5 = con.prepareStatement("SELECT COUNT(session_id) AS sessioncount FROM sessions WHERE date=?");
                        ps5.setString(1, two);

                        ResultSet rs5 = ps5.executeQuery();
                        while (rs5.next()) {
                            int daytwocount = Integer.parseInt(rs5.getString(1));
                            String daytwodate = twoDaysAgo.format(formatter);


                            LocalDate oneDaysAgo = today.minusDays(1); // subtract 4 days
                            String one = String.valueOf(oneDaysAgo);
                            PreparedStatement ps6 = con.prepareStatement("SELECT COUNT(session_id) AS sessioncount FROM sessions WHERE date=?");
                            ps6.setString(1, one);

                            ResultSet rs6 = ps6.executeQuery();
                            while (rs6.next()) {
                                int dayonecount = Integer.parseInt(rs6.getString(1));
                                String dayonedate = oneDaysAgo.format(formatter);
%>
<!-- Chart line -->
<script>
    const dayone = "<%=dayonedate%>";
    const daytwo = "<%=daytwodate%>";
    const daythree = "<%=daythreedate%>";
    const dayfour = "<%=dayfourdate%>";
    const dayfive = "<%=dayfivedate%>";
    const daysix = "<%=daysixdate%>";

    var day1count =<%=dayonecount%>;
    var day2count = <%=daytwocount%>;
    var day3count = <%=daythreecount%>;
    var day4count = <%=dayfourcount%>;
    var day5count = <%=dayfivecount%>;
    var day6count = <%=daysixcount%>;


    const labels = [daysix, dayfive, dayfour, daythree, daytwo, dayone];
    const data = {
        labels: labels,
        datasets: [
            {
                label: "Usage",
                backgroundColor: "green",
                borderColor: "hsl(252, 82.9%, 67.8%)",
                data: [day6count, day5count, day4count, day3count, day2count, day1count],
            },
        ],
    };
    <%
       }

                                }
                            }
                        }
                    }
                }
    }catch (ClassNotFoundException | SQLException e) {
            out.print(e);

        }
    %>
    const configLineChart = {
        type: "bar",
        data,
        options: {},
    };

    var chartLine = new Chart(
        document.getElementById("chartLine"),
        configLineChart
    );
</script>


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