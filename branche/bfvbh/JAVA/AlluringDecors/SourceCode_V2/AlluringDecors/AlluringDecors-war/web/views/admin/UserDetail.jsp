<%--
    Document   : UserDetail
    Created on : May 17, 2012, 1:04:55 AM
    Author     : Administrator
--%>

<%@page import="com.alluringdecors.common.Role"%>
<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="java.util.Date"%>
<%@page import="com.alluringdecors.ejb.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>User Detail</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <!-- LINKS -->
        <link href="http://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" type="text/css" />
        <link href="contents/default.css" rel="stylesheet" type="text/css" media="all" />
        <!-- SCRIPTS -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.dropotron-1.0.js"></script>
        <script type="text/javascript" src="scripts/init.js"></script>
        <link href="contents/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/jquery-ui.min.js"></script>
        <script type="text/javascript" src="scripts/pagevalidation.js"></script>
        <script type="text/javascript">
            RegisterValidation();
            $(document).ready(function() {
                $("#Brithday").datepicker();
            });
        </script>
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->
        <%
            String controller = null;
            String action = (String) request.getAttribute("action");
            if ("Add".equals(action)) {
                controller = "InsertUser";
            } else if ("Edit".equals(action)) {
                controller = "UpdateUser";
            }
        %>
        <!-- START MAIN CONTENT -->
        <div id="main-content">
            <div id="content-table-inner">
                <div id="table-content">
                    <h2>User Detail</h2>
                    <!-- start id-form -->
                    <%
                        UserDTO userobj = (UserDTO) request.getAttribute("user");
                        if (userobj == null) {
                            userobj = new UserDTO();
                            userobj.setRole(Role.CLIENT.toString());
                        }
                    %>
                    <form name="fromUserDetail" action="<%= controller%>" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">ID:</th>
                                <td><%= userobj.getID()%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Username:</th>
                                <td><%= userobj.getUserName()%></td>
                                <td>
                                    <label class="error-msg" id="UsernameErrMsg"></label>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Full name:</th>
                                <td><input name="name" id="FullName" type="text" value="<%= userobj.getName()%>"  class="inp-form" /></td>
                                <td>
                                    <label class="error-msg" id="FullNameErrMsg"></label>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Address:</th>
                                <td><input name="address" type="text" value="<%= userobj.getAddress()%>" class="inp-form" /></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Phone:</th>
                                <td><input name="phone" type="text" value="<%= userobj.getPhone()%>" class="inp-form" /></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Email:</th>
                                <td><input name="email"  id="Email" type="text" value="<%= userobj.getEmail()%>" class="inp-form" /></td>
                                <td><label class="error-msg" id="EmailErrMsg"></label></td>
                            </tr>

                            <tr>
                                <th valign="top">Gender:</th>
                                <td><input type="radio" name="sex" value="true" checked="checked"/> Male<br />
                                    <input type="radio" name="sex" value="false" /> Female
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Start Date:</th>
                                <td><%= CommonHelpers.formatDate(userobj.getStartDate())%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="hidden" name="id" value="<%= userobj.getID()%>" />
                                    <input type="submit" id="susubmit" value="" class="form-submit" />
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </form>
                    <!-- end id-form  -->
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
