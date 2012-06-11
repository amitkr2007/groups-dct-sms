<%--
    Document   : SelectUsers
    Created on : May 16, 2012, 7:31:13 PM
    Author     : Administrator
--%>

<%@page import="com.alluringdecors.ejb.dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Users Management</title>
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
                    <h2>Users Management</h2>
                    <%
                                String error = request.getParameter("error");
                                if (error != null && !error.isEmpty()) {
                    %>
                    <h3 style="color: red"><%= error%></h3>
                    <%}%>
                    <form id="mainform" action="">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <tr>
                                <th class="table-header-repeat line-left minwidth-1"><a>Username</a></th>
                                <th class="table-header-repeat line-left"><a>Role</a></th>
                                <th class="table-header-repeat line-left"><a>Phone</a></th>
                                <th class="table-header-repeat line-left"><a>Email</a></th>
                                <th class="table-header-repeat line-left"><a href=""></a></th>
                            </tr>
                            <%
                                        ArrayList<UserDTO> lstUsers = (ArrayList<UserDTO>) request.getAttribute("UsersList");
                                        if (lstUsers != null && lstUsers.size() > 0) {
                                            for (UserDTO userdto : lstUsers) {
                            %>
                            <tr>
                                <td><%= userdto.getUserName()%></td>
                                <td><%= userdto.getRole()%></td>
                                <td><%= userdto.getPhone()%></td>
                                <td><%= userdto.getEmail()%></td>
                                <td>
                                    <a href="./UserDetail?id=<%= userdto.getID()%>" title="Select" class="icon-5 info-tooltip"></a>
                                    <%if (userdto.isAlreadyPurchase() == true) {
                                    %>
                                    <a href="#" title="Delete" class="icon-2 info-tooltip" onclick="return alert('The user had already purchased services, Can not delete')"></a>
                                    <%} else {%>
                                    <a href="./DeleteUser?id=<%= userdto.getID()%>" title="Delete" class="icon-2 info-tooltip" onclick="return confirm('Are you sure you want to Delete it? This action cannot be undone.')"></a>
                                    <%}%>
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
