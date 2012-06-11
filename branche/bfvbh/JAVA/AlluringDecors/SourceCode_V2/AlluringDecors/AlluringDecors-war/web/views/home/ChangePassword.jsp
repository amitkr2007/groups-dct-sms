<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Internet Dreams</title>
        <link rel="stylesheet" href="contents/screen.css" type="text/css" media="screen" title="default" />
        <!--  jquery core -->
        <script src="scripts/jquery-1.7.1.min.js" type="text/javascript"></script>

        <!-- Custom jquery scripts -->
        <script src="scripts/custom_jquery.js" type="text/javascript"></script>

        <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>

        <script type="text/javascript">
            function passwordMatchRegex()
            {
                var hasError = false;
                var emailReg = /^([\w\d]+)?$/;
                if(!emailReg.test($("#Pass").val())) {
                    $("#PassErrMsg").html("Invalid Password");
                    hasError = true;
                }
                return hasError;
            }

            function newPasswordMatchRegex()
            {
                var hasError = false;
                var emailReg = /^([\w\d]+)?$/;
                if(!emailReg.test($("#NewPass").val())) {
                    $("#NewPassErrMsg").html("Invalid New Password");
                    hasError = true;
                }
                return hasError;
            }

            $(document).ready(function() {
                $("#submit").click(function() {
                    var hasError = false;

                    if($("#Pass").val() == ''){
                        $("#PassErrMsg").html("Current password is required");
                        //alert("Current password is required");
                        hasError = true;
                    }else if(passwordMatchRegex()){
                        $("#PassErrMsg").html("Invalid password");
                        //alert("Current password is required");
                        hasError = true;
                    }
                    else{
                        $("#PassErrMsg").html("");
                    }

                    if($("#NewPass").val() == ''){
                        $("#NewPassErrMsg").html("New password is required");
                        //			    alert("New password is required");
                        hasError = true;
                    }else if(newPasswordMatchRegex()){
                        $("#NewPassErrMsg").html("Invalid New password");
                        //			    alert("New password is required");
                        hasError = true;
                    }
                    else{
                        $("#NewPassErrMsg").html("");
                    }

                    if($("#ConfirmNewPass").val() == ''){
                        $("#ConfirmNewPassErrMsg").html("Confirm password is required");
                        //			    alert("Confirm password is required");
                        hasError = true;
                    }
                    else
                        if($("#NewPass").val() != $("#ConfirmNewPass").val() ){
                            $("#ConfirmNewPassErrMsg").html("Password not match");
                            //				alert("Password not match");
                            hasError = true;
                        }else {
                        $("#ConfirmNewPassErrMsg").html("");
                    }

                    if(hasError == true){
                        return false;
                    }
                });
            });
        </script>
    </head>
    <body id="login-bg">
        <!-- Start: login-holder -->
        <div id="login-holder">

            <!-- start logo -->
            <div id="logo-login">
            </div>
            <!-- end logo -->

            <div class="clear"></div>

            <!--  start loginbox ................................................................................. -->
            <div id="loginbox" style="padding-top: 40px;">

                <!--  start login-inner -->
                <div id="login-inner" style="width: 400px;">
                    <form action="./UpdatePassword" method="post">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <th style="width: 220px;">Current Password</th>
                                <td><input type="password" name="currentpassword" id="Pass" class="login-inp" /></td>

                            </tr>
                            <tr>
                                <td></td>
                                <td><label style="color: wheat" id="PassErrMsg"></label></td>
                            </tr>
                            <tr>
                                <th style="width: 220px;">New Password</th>
                                <td><input type="password" name="newpassword" id="NewPass"  onfocus="this.value=''" class="login-inp" /></td>

                            </tr>
                            <tr>
                                <td></td>
                                <td><label style="color: wheat" id="NewPassErrMsg"></label></td>
                            </tr>
                            <tr>
                                <th style="width: 220px;">Confirm New Password</th>
                                <td><input type="password" name="confirmnewpassword" id="ConfirmNewPass" onfocus="this.value=''" class="login-inp" /></td>

                            </tr>
                            <tr>
                                <td></td>
                                <td><label style="color: wheat" id="ConfirmNewPassErrMsg"></label></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input type="submit" id="submit" class="submit-login"  />
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <!--  end login-inner -->
                <div class="clear"></div>
                <a href="./Home" class="back-login">Back to Index</a>
            </div>
            <!--  end loginbox -->
        </div>
        <!-- End: login-holder -->
    </body>
</html>