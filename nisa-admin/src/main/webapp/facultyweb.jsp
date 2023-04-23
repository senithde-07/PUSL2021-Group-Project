<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 4/23/2023
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
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

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- TailwindCSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.png">
    <title>Home</title>
</head>

<body>

<!-- Navigation Bar -->
<header class="text-gray-600 body-font">
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
            <img src="assets/img/NSBM Logo.png" class="h-12 mr-3 sm:h-9" alt="" />
        </a>
        <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center">
            <a href="facultyweb.jsp" class="mr-10 hover:text-gray-900 font-bold uppercase">Home</a>
            <a href="#" class="mr-10 hover:text-gray-900 uppercase">Depatments</a>
            <a href="#" class="mr-10 hover:text-gray-900 uppercase">Academic Staff</a>
            <a href="#" class="mr-10 hover:text-gray-900 uppercase">Research & Publications</a>
            <a href="#" class="mr-10 hover:text-gray-900 uppercase">News & Media</a>
            <a href="#" class="flex items-center">
                <img src="assets/img/NLearn.png" class="h-3  sm:h-5 mx-5" alt="" />

            </a>
        </nav>
    </div>
</header>

<section>

    <div id="carouselExampleControls" class="relative" data-te-carousel-init data-te-carousel-slide>
        <div class="relative w-full overflow-hidden after:clear-both after:block after:content-['']">
            <div
                    class="relative float-left -mr-[100%] w-full transition-transform duration-[600ms] ease-in-out motion-reduce:transition-none"
                    data-te-carousel-item data-te-carousel-active>
                <img src="assets/img/foc_bg.jpg" class="block w-full" alt="Wild Landscape" />
            </div>
            <div
                    class="relative float-left -mr-[100%] hidden w-full transition-transform duration-[600ms] ease-in-out motion-reduce:transition-none"
                    data-te-carousel-item>
                <img src="assets/img/foc_bg.jpg" class="block w-full" alt="Camera" />
            </div>
            <div
                    class="relative float-left -mr-[100%] hidden w-full transition-transform duration-[600ms] ease-in-out motion-reduce:transition-none"
                    data-te-carousel-item>
                <img src="assets/img/foc_bg.jpg" class="block w-full" alt="Exotic Fruits" />
            </div>
        </div>
        <button
                class="absolute top-0 bottom-0 left-0 z-[1] flex w-[15%] items-center justify-center border-0 bg-none p-0 text-center text-white opacity-50 transition-opacity duration-150 ease-[cubic-bezier(0.25,0.1,0.25,1.0)] hover:text-white hover:no-underline hover:opacity-90 hover:outline-none focus:text-white focus:no-underline focus:opacity-90 focus:outline-none motion-reduce:transition-none"
                type="button" data-te-target="#carouselExampleControls" data-te-slide="prev">
        <span class="inline-block h-8 w-8">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
               stroke="currentColor" class="h-6 w-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
          </svg>
        </span>
            <span
                    class="!absolute !-m-px !h-px !w-px !overflow-hidden !whitespace-nowrap !border-0 !p-0 ![clip:rect(0,0,0,0)]">Previous</span>
        </button>
        <button
                class="absolute top-0 bottom-0 right-0 z-[1] flex w-[15%] items-center justify-center border-0 bg-none p-0 text-center text-white opacity-50 transition-opacity duration-150 ease-[cubic-bezier(0.25,0.1,0.25,1.0)] hover:text-white hover:no-underline hover:opacity-90 hover:outline-none focus:text-white focus:no-underline focus:opacity-90 focus:outline-none motion-reduce:transition-none"
                type="button" data-te-target="#carouselExampleControls" data-te-slide="next">
        <span class="inline-block h-8 w-8">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
               stroke="currentColor" class="h-6 w-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
          </svg>
        </span>
            <span
                    class="!absolute !-m-px !h-px !w-px !overflow-hidden !whitespace-nowrap !border-0 !p-0 ![clip:rect(0,0,0,0)]">Next</span>
        </button>
    </div>
</section>

<!-- Hero Section -->
<section class="text-gray-600 body-font mx-12">
    <div class="container mx-auto flex px-5 py-24 md:flex-row flex-col items-center">
        <div
                class="lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 flex flex-col md:items-start md:text-left mb-16 md:mb-0 items-center text-center">
            <h1 class="title-font sm:text-4xl text-5xl mb-4 font-bold text-blue-800">FACULTY OF COMPUTING</h1>
            <p class="mb-8 leading-relaxed text-justify">
                The Faculty of Computing (SOC) provides world class education and training in Computing and Information
                Technology, both at undergraduate as well as post graduate levels.

                SOC offers University Grants Commission’s approved degree programmes in multiple disciplines. It has also
                partnered with the world top ranking universities, University College Dublin in Ireland, University of
                Plymouth in UK and Victoria University in Australia to provide undergraduates with highly recognized
                International Degrees. The innovative teaching methods along with the latest state of the art equipment form
                the perfect blend that motivates our students to do their best and reach their goals with ease.
            </p>
            <p class="mb-8 leading-relaxed text-justify">
                The Faculty provides top notch research, training and development services that will help students acquire new
                knowledge along with the best practices in their respective disciplines. The SOC aims to be among the foremost
                centre of excellence in Research and Development (R&D) and advance education in computing while taking into
                consideration national as well as regional requirements for Information and Communication Technology.

                The SOC places equal emphasis on both theory and practice of all aspects of the computing field, enabling our
                students to have sufficient hands on experience to take up any working assignment in their respective IT
                fields at the end of their degree programmes. So, look no further for that perfect computing degree, NSBM’s
                Faculty of Computing is the ideal choice!
            </p>
        </div>
    </div>
</section>





<!-- Statistics -->
<section class="text-gray-600 body-font">
    <div class="container px-5  mx-auto">
        <div class="flex flex-wrap text-center">
            <div class="p-4 md:w-1/4 sm:w-1/2 w-full">
                <div class="border-2 border-gray-200 px-4 py-6 rounded-lg">
                    <img src="assets/img/data-sc.png" class="rounded-lg">
                    <h2 class="title-font font-medium text-xl text-gray-900 mt-3">Department of Data Science</h2>
                    <h2 class="title-font font-medium text-xl text-white ">*</h2>
                    <button type="button"
                            class=" w-full text-white bg-pink-400 hover:bg-pink-500  font-medium  text-sm px-8 py-2 text-center mt-3 md:mr-0 ">View
                        More
                    </button>
                </div>
            </div>
            <div class="p-4 md:w-1/4 sm:w-1/2 w-full">
                <div class="border-2 border-gray-200 px-4 py-6 rounded-lg">
                    <img src="assets/img/network.jpg" class="rounded-lg">
                    <h2 class="title-font font-medium text-xl text-gray-900 mt-3">Department of Network and Security</h2>
                    <button type="button"
                            class=" w-full text-white bg-red-400 hover:bg-red-500  font-medium  text-sm px-8 py-2 text-center mt-3 md:mr-0 ">View
                        More
                    </button>
                </div>
            </div>
            <div class="p-4 md:w-1/4 sm:w-1/2 w-full">
                <div class="border-2 border-gray-200 px-4 py-6 rounded-lg">
                    <img src="assets/img/com-science.jpg" class="rounded-lg">
                    <h2 class="title-font font-medium text-xl text-gray-900 mt-3">Department of Computer Science and Software
                        Engineering</h2>
                    <button type="button"
                            class=" w-full text-white bg-blue-400 hover:bg-blue-500  font-medium  text-sm px-8 py-2 text-center mt-3 md:mr-0 ">View
                        More
                    </button>
                </div>
            </div>
            <div class="p-4 md:w-1/4 sm:w-1/2 w-full">
                <div class="border-2 border-gray-200 px-4 py-6 rounded-lg">
                    <img src="assets/img/info.jpg" class="rounded-lg">
                    <h2 class="title-font font-medium text-xl text-gray-900 mt-3">Department of Information and Systems Sciences
                    </h2>
                    <button type="button"
                            class=" w-full text-white bg-green-400 hover:bg-green-500  font-medium  text-sm px-8 py-2 text-center mt-3 md:mr-0 ">View
                        More
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>






<section class="text-gray-600 body-font mx-12">
    <div class="container mx-auto flex px-5 py-24 md:flex-row flex-col items-center">
        <div
                class="lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 flex flex-col md:items-start md:text-left mb-16 md:mb-0 items-center text-center">
            <h1 class="title-font sm:text-4xl text-5xl mb-4 font-bold text-green-500">DEAN’S MESSAGE</h1>
            <p class="mb-8 leading-relaxed text-justify">
                Welcome to the School of Computing of the National School of Business Management (NSBM). NSBM is a dynamic
                young organization offering innovative educational products to cater to the needs of the fast-developing
                business and industrial economies in the world. Your course of study will be up to date and relevant and will
                be delivered by well qualified staff geared to prepare you for employment. The NSBM Graduate profile and
                student charter aims to develop the students to achieve what they expect in their chosen career paths. As
                students of NSBM, you are expected to work hard and to set high standards. To help you achieve success you are
                provided with excellent staff as well as student support services to help deal with your needs. Our academic
                (both local and foreign), administrative and technical staff with which you work will be ready to advise and
                facilitate you. It is your responsibility to take your course of studies very seriously and make the full use
                of the diverse range of learning opportunities provided to you, managing your time effectively in class and in
                self-directed assignments. With the staunch belief of creating reliable and holistic individuals, our wish is
                to see that you become successful in life and be a good ambassador for the university.
            </p>
            <span class="flex-grow flex flex-col ">
          <span class="title-font font-medium text-gray-900">Dr. Rasika Ranaweera</span>
          <span class="text-gray-500 text-sm">Dean - Faculty of Computing</span>
        </span>
        </div>
        <div class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6">
            <img src="assets/img/dean-foc.jpg" alt="" class="w-30">
        </div>
    </div>
</section>




<!-- Footer -->
<footer class="text-gray-600 body-font">

    <div class="bg-gray-100">
        <div class="container px-5 py-6 mx-auto flex items-center sm:flex-row flex-col">
            <a class="flex title-font font-medium items-center md:justify-start justify-center text-gray-900">
                <img src="assets/img/NSBM Logo.png" class="h-12 mr-3 sm:h-9" alt="" />
            </a>
            <p class="text-sm text-gray-500 sm:ml-6 sm:mt-0 mt-4">Copyright © 2023 - NSBM Green University Town - All Rights Reserved.
            </p>
            <span class="inline-flex sm:ml-auto sm:mt-0 mt-4 justify-center sm:justify-start">
          <a class="text-gray-500">
            <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5"
                 viewBox="0 0 24 24">
              <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"></path>
            </svg>
          </a>
          <a class="ml-3 text-gray-500">
            <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5"
                 viewBox="0 0 24 24">
              <path
                      d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2c9 5 20 0 20-11.5a4.5 4.5 0 00-.08-.83A7.72 7.72 0 0023 3z">
              </path>
            </svg>
          </a>
          <a class="ml-3 text-gray-500">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                 class="w-5 h-5" viewBox="0 0 24 24">
              <rect width="20" height="20" x="2" y="2" rx="5" ry="5"></rect>
              <path d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37zm1.5-4.87h.01"></path>
            </svg>
          </a>
          <a class="ml-3 text-gray-500">
            <svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                 stroke-width="0" class="w-5 h-5" viewBox="0 0 24 24">
              <path stroke="none"
                    d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6zM2 9h4v12H2z"></path>
              <circle cx="4" cy="4" r="2" stroke="none"></circle>
            </svg>
          </a>
        </span>
        </div>
    </div>
</footer>


<script src="https://www.gstatic.com/dialogflow-console/fast/messenger-cx/bootstrap.js?v=1"></script>
<df-messenger
        df-cx="true"
        intent="welcome"
        chat-title="nisa"
        chat-icon="https://ibb.co/s5d4xr0"
        agent-id="8fb3e38c-a89e-4a27-85a1-d3e5a6db3109"
        language-code="en">
</df-messenger>


<style>
    df-messenger {
        --df-messenger-bot-message: #878fac;
        --df-messenger-button-titlebar-color: #25c638;
        --df-messenger-chat-background-color: #fafafa;
        --df-messenger-font-color: white;
        --df-messenger-send-icon: #878fac;
        --df-messenger-user-message: #479b3d;
    }
</style>





</body>

</html>
