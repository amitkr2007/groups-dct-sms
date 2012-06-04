<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.common.Role"%>
<%@page import="java.util.Date"%>
<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Register</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <!-- LINKS -->
        <link href="http://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" type="text/css" />
        <link href="contents/default.css" rel="stylesheet" type="text/css" media="all" />
        <!-- SCRIPTS -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.dropotron-1.0.js"></script>
        <link href="contents/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/jquery-ui.min.js"></script>
        <script type="text/javascript" src="scripts/init.js"></script>
        <script type="text/javascript" src="scripts/pagevalidation.js"></script>

        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>
        
        <script type="text/javascript">
            RegisterValidation();
        </script>
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->

        <!-- START MAIN CONTENT -->
        <div id="main-content">
            <%
                if (request.getAttribute("Message") != null && !"Input username is existent in database".equals((String) request.getAttribute("Message"))) {
            %>
            <h5> <%= request.getAttribute("Message")%>, <a href="./Login?Action=View"> Please click this link login now </a> </h5>
            <%
            } else {
            %>
            <div id="content-table-inner">
                <div id="table-content">
                    <h2>Register member</h2>
                    <!-- start id-form -->
                    <form name="register" action="InsertUser" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <input name="id" id="id" value="0" type="hidden" class="inp-form" />
                            <tr>
                                <th valign="top">Username:</th>
                                <td><input name="username" id="Username" type="text" class="inp-form" /></td>
                                <td>
                                    <label class="error-msg" id="UsernameErrMsg"></label>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Password:</th>
                                <td><input name="password" id="Password" type="password" class="inp-form" /></td>
                                <td>
                                    <label class="error-msg" id="PasswordErrMsg"></label>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Confirm Password:</th>
                                <td><input name="confirmPassword" id="ConfirmPassword" type="password" class="inp-form" /></td>
                                <td>
                                    <label class="error-msg" id="ConfirmPasswordErrMsg"></label>
                                </td>
                            </tr>
                            <input name="role" value="<%= Role.CLIENT.toString()%>" type="hidden" class="inp-form" />
                            <tr>
                                <th valign="top">Full Name:</th>
                                <td><input name="name" id="FullName" type="text" class="inp-form" /></td>
                                <td>
                                    <label class="error-msg" id="FullNameErrMsg"></label>
                                </td>
                            </tr>
                            <tr>

                                <th valign="top">Gender:</th>
                                <td><input type="radio" name="sex" value="true" checked="checked"/> Male<br />
                                    <input type="radio" name="sex" value="false" /> Female
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Address:</th>
                                <td><input  name="address" type="text" class="inp-form" /></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Phone</th>
                                <td><input name="phone" type="text" class="inp-form" /></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Email</th>
                                <td><input name="email" id="Email" type="text" class="inp-form" /></td>
                                <td>
                                    <label class="error-msg" id="EmailErrMsg"></label>
                                </td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="submit" id="susubmit" value="" class="form-submit" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <!-- end id-form  -->
                </div>
            </div>
            <%}%>
        </div>
        <!-- END MAIN CONTENT -->

        <!-- START FOOTER -->
        <div id="footer">
            <%@include file="../templates/UC_Footer.jsp" %>
        </div>
        <!-- END FOOTER -->
    </body>
</html>
