<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.ProjectsDTO"%>
<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.ServicesOfferedDTO"%>
<%@page import="com.alluringdecors.ejb.dto.DomainListDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Maximus4T by 4Templates</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <!-- LINKS -->
        <link href="http://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" type="text/css" />
        <link href="contents/default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="contents/InfoItem.css" rel="stylesheet" type="text/css" media="all" />
        <link href="contents/InfoList.css" rel="stylesheet" type="text/css" media="all" />
        <!-- SCRIPTS -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.dropotron-1.0.js"></script>
        <script type="text/javascript" src="scripts/init.js"></script>
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->
        <%
            ArrayList<ProjectsDTO> ds = (ArrayList<ProjectsDTO>) request.getAttribute("ListProjects");
        %>
        <!-- START MAIN CONTENT -->
        <div id="main-content">
            <div id="content-table-inner">
                <div id="table-content">
                    <h2>Projects Status : <%= (String) request.getAttribute("Status")%></h2>
                    <div class="css-panes" id="section_content">
                        <div class="css-pane" id="first" style="display: block;">
                            <%
                                for (int i = 0; i < ds.size(); i++) {
                                    ProjectsDTO item = ds.get(i);
                                    if (i == 0) {
                            %>
                            <div class="fullwidth">
                                <% } else {%>
                                <div class="fullwidth cms_separator">
                                    <% }%>
                                    <div class="article_preview">
                                        <div class="preview_img">
                                            <a href="./ProjectDeatailController?id=<%= item.getID()%>">
                                                <img class="cms_article_preview_image" src="images/uploads/<%= item.getImage()%>" alt="<%= item.getName()%>" style="width: 100px; height: 80px;" />
                                            </a>
                                        </div>
                                        <div>
                                            <div>
                                                <h3 class="article_preview">
                                                    <a href="./ProjectDeatailController?id=<%= item.getID()%>"><span><%= item.getName()%></span></a>&nbsp;
                                                </h3>
                                            </div>
                                            <div class="article_preview_contents showpreviewonly restore">
                                                <div>
                                                    <p class="cms_article_preview_txt_content postcontainer">
                                                        <b><%= CommonHelpers.Truncate(item.getBriefDescription(), 300)%></b>
                                                        <a class="readmore_spr" href="./ProjectDeatailController?id=<%= item.getID()%>">Read more</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT -->

            <!-- START FOOTER -->
            <div id="footer">
                <%@include file="../templates/UC_Footer.jsp" %>
            </div>
            <!-- END FOOTER -->
    </body>
</html>
