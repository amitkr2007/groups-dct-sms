<%-- 
    Document   : FeedBacks Management
    Created on : May 17, 2012, 23:40:48 PM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.FeedBacksDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    Object obj = request.getAttribute("FeedBacksDTOs");
    if (obj == null) {
        String url = "/FeedBacks_SelectAll_Controller";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>FeedBacks Management</title>
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
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->

        <!-- START MAIN CONTENT -->
        <div id="main-content">
            <div id="content-table-inner">
                <div id="table-content">
                    <h2>FeedBacks Management</h2>
                    <form id="mainform" action="">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <tr>
                                <th class="table-header-repeat line-left minwidth-1"><a href="">Title</a></th>
                                <th class="table-header-repeat line-left"><a href="">Email</a></th>
                                <th class="table-header-repeat line-left"><a href="">Post Date</a></th>
                                <th class="table-header-repeat line-left"><a href="">Is Replied</a></th>
                                <th class="table-header-repeat line-left"><a href=""></a></th>
                            </tr>
                            <%
                                ArrayList<FeedBacksDTO> ds = (ArrayList<FeedBacksDTO>) obj;
                                if (ds != null) {
                                    for (int i = 0; i < ds.size(); i++) {
                                        FeedBacksDTO item = ds.get(i);
                            %>
                            <tr>
                                <td><%= item.getTiitle()%></td>
                                <td><%= item.getEmail()%></td>
                                <td><%= item.getPostDate()%></td>
                                <td><%= item.getIsReplied()%></td>
                                <td>
                                    <a href="./FeedBacks_SelectByID_Controller?id=<%= item.getID()%>" title="Reply" class="icon-5 info-tooltip"></a>
                                    <a href="./FeedBacks_Delete_Controller?id=<%= item.getID()%>" title="Delete" class="icon-2 info-tooltip" onclick="return confirm('Are you sure you want to Delete it? This action cannot be undone.')"></a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
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
