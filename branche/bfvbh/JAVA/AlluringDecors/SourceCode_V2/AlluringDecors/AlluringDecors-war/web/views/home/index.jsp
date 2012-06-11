<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.ProjectsDTO"%>
<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.CompanyInformationDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    Object obj = request.getAttribute("LoadHomeController");
    if (obj == null) {
        String url = "/Home";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    ArrayList<CompanyInformationDTO> ds = (ArrayList<CompanyInformationDTO>) request.getAttribute("CompanyInformationDTOs");
    CompanyInformationDTO dto = null;
    if (ds.size() > 0) {
        dto = ds.get(0);
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Maximus4T by 4Templates</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <!-- LINKS -->
        <link href="http://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" type="text/css" />
        <link href="contents/default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="contents/slider.css" rel="stylesheet" type="text/css" media="all" />
        <!-- SCRIPTS -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.dropotron-1.0.js"></script>
        <script type="text/javascript" src="scripts/init.js"></script>
        <script type="text/javascript" src="scripts/s3Slider.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#slider').s3Slider({
                    timeOut: 4000
                });
            });
        </script>
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->

        <!-- START MAIN CONTENT -->
        <div id="banner-wrapper">
            <!-- Requirement: using JQUERY to implement slide show -->
            <div id="banner">
                <div class="image">
                    <div id="slider">
                        <ul id="sliderContent">
                            <%
                                ArrayList<ProjectsDTO> lstProjects = (ArrayList<ProjectsDTO>) request.getAttribute("Projects");
                                for (ProjectsDTO project : lstProjects) {
                                    if (ProjectStatus.ACCOMPLISHED.toString().equals(project.getProjectStatus())) {
                            %>
                            <li class="sliderImage">
                                <a href="./ProjectDeatailController?id=<%= project.getID()%>">
                                    <img src="images/uploads/<%= project.getImage()%>" alt="<%= project.getImage()%>" />
                                    <span class="bottom"><strong><%= project.getName()%></strong><br /><%= project.getBriefDescription()%></span>
                                </a>
                            </li>
                            <% } } %>
                            <div class="clear sliderImage"></div>
                        </ul>
                    </div>
                </div>
                <div class="border"></div>
            </div>
        </div>
        <div id="page">
            <div class="bgtop"></div>
            <div class="content-bg">
                <!-- At the centre of the page, the detailed explanation stating why one must prefer their (Alluring Decors) services -->
                <div id="content">
                    <div class="post">
                        <p class="date">About<b> Me  </b></p>
                        <h2 class="title">Why people must prefer our services?</h2>
                        <div class="entry">
                            <%
                                if (dto != null) {
                            %>
                            <%= dto.getPreferExplanation()%>
                            <% }%>
                        </div>
                    </div>
                </div>
                <!-- Requirement: On this page at the sides of the page the following are to be displayed -->
                <div id="sidebar">
                    <!-- The brief description about the company -->
                    <div>
                        <h2 class="title">About the Company</h2>
                        <p>
                            <%
                                if (dto != null) {
                            %>
                            <%= CommonHelpers.Truncate(dto.getBriefCompanyDescription(), 200)%>
                            <% }%>
                        </p>
                    </div>
                    <!-- The brief descriptions about the services -->
                    <div>
                        <h2 class="title">About the services</h2>
                        <p>
                            <%
                                if (dto != null) {
                            %>
                            <%= CommonHelpers.Truncate(dto.getBriefServiceDescription(), 200)%>
                            <% }%>
                        </p>
                    </div>
                    <!-- The brief description about the on-going projects -->
                    <div>
                        <h2 class="title">About on-going projects</h2>
                        <% for (int i = 0; i < lstProjects.size(); i++) {
                                if (ProjectStatus.ON_GOING.toString().equals(lstProjects.get(i).getProjectStatus())) {
                        %>
                        <p>
                            <a href="./ProjectDeatailController?id=<%= lstProjects.get(i).getID()%>"><%= lstProjects.get(i).getName()%></a>
                            <br/>
                            <span><%= CommonHelpers.Truncate(lstProjects.get(i).getBriefDescription(), 80)%></span>
                        </p>
                        <% }
                                if (i == 5) {
                                    break;
                                }
                            }%>
                    </div>
                </div>
            </div>
            <div class="bgbtm"></div>
        </div>
        <!-- END MAIN CONTENT -->

        <!-- START FOOTER -->
        <div id="footer">
            <%@include file="../templates/UC_Footer.jsp" %>
        </div>
        <!-- END FOOTER -->
    </body>
</html>
