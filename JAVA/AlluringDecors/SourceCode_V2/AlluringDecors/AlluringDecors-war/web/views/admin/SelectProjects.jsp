<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.ProjectsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Maximus4T by 4Templates</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <!-- LINKS -->
        <link href="http://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" type="text/css" />
        <link href="contents/default.css" rel="stylesheet" type="text/css" media="all" />
        <!-- SCRIPTS -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.dropotron-1.0.js"></script>
        <script type="text/javascript" src="scripts/init.js"></script>

        <script type="text/javascript">
            <% if (request.getAttribute("message") != null) {%>
                alert("<%= (String) request.getAttribute("message")%>");
            <% }%>
        </script>
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->
	<%
	String projectStatus = (String)request.getAttribute("idps");
	%>
        <!-- START MAIN CONTENT -->
        <div id="main-content">
            <div id="content-table-inner">
                <div id="table-content">
                    <h2>Projects Management</h2>
<!--		    <h3><a href="./ProjectDetail">Create new project</a></h3>-->
		    <h3>Projects Status : <%= projectStatus %></h3>
		    <br/>
                    <form id="mainform" action="">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <tr>
                                <th class="table-header-repeat line-left" style="width: 120px;"><a href="">Image</a>	</th>
                                <th class="table-header-repeat line-left" style="text-align: center;""><a href="">ID Service Request</a></th>
                                <th class="table-header-repeat line-left minwidth-1"><a href="">Name</a></th>
                                <th class="table-header-repeat line-left"><a href="">Status</a></th>
                                <th class="table-header-repeat line-left"><a href="">Start Date</a></th>
                                <th class="table-header-repeat line-left"><a href=""></a></th>
                            </tr>
			    <%
				ArrayList<ProjectsDTO> lstProjects = (ArrayList<ProjectsDTO>) request.getAttribute("ProjectsDTOs");
				for(ProjectsDTO pItem : lstProjects){
				%>
                            <tr>
                                <td style="width: 120px;"><img src="images/uploads/<%= pItem.getImage() %>" border="0" style="width: 80px; height: 80px; padding-left: 10px;" /></td>
                                <td style="text-align: center;"><%= pItem.getIDServiceRequest() %></td>
                                <td><%= pItem.getName() %></td>
                                <td><%= pItem.getProjectStatus() %></td>
                                <td><%= CommonHelpers.formatDate(pItem.getStartDate()) %></td>
                                <td class="options-width">
                                    <a href="./ProjectDetail?id=<%= pItem.getID() %>" title="Edit" class="icon-1 info-tooltip"></a>
                                    <a href="./DeleteProject?id=<%= pItem.getID()%>&idps=<%= pItem.getProjectStatus() %>" title="Delete" class="icon-2 info-tooltip" onclick="return confirm('Are you sure you want to Delete it? This action cannot be undone.')"></a>
                                </td>
                            </tr>
			    <%}%>
                        </table>
                    </form>
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
