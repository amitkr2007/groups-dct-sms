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

	<script type="text/javascript">
	<%
	String msg = (String)request.getAttribute("Message");
	if(msg != null){
	%>
//            $(document).ready(function(){
		alert("<%= msg%>");
//            });
	    document.getElementById("ErrMsg").innerHTML="<%= msg%>";
	<%}%>
        </script>

	<script type="text/javascript">
	$(document).ready(function() {
	    $("#submit").click(function() {
		var hasError = false;

		if($("#Username").val() == ''){
		    $("#UsernameErrMsg").html("Please enter username");
		    hasError = true;
		}
		else{
                    var Reg = /^[a-z0-9_-]{3,15}$/;
                    if(!Reg.test($("#Username").val())) {
                        $("#UsernameErrMsg").html("Username must be at least 3 characters and does not constain special character");
                        hasError = true;
                    }else {
                        $("#UsernameErrMsg").html("");
                    }
		}

		if($("#Password").val() == ''){
		    $("#PasswordErrMsg").html("Please enter password");
		    hasError = true;
		}
		else{
                    var Reg = /^[a-z0-9_-]{3,15}$/;
                    if(!Reg.test($("#Password").val())) {
                        $("#PasswordErrMsg").html("Password must be at least 3 characters and does not constain special character");
                        hasError = true;
                    }else {
                        $("#PasswordErrMsg").html("");
                    }
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
            <div id="loginbox">

                <!--  start login-inner -->
                <div id="login-inner">
                    <form action="Login" method="post">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <th>Username</th>
                            <td><input type="text" name="username" id="Username" class="login-inp" /></td>
                        </tr>
			<tr>
                            <th></th>
                            <td><label style="color: wheat" id="UsernameErrMsg"></label></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><input type="password" name="password" id="Password"  onfocus="this.value=''" class="login-inp" /></td>
                        </tr>
			<tr>
                            <th></th>
                            <td><label style="color: wheat" id="PasswordErrMsg"></label></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td valign="top"><input type="checkbox" name="isRemember" class="checkbox-size" id="login-check" /><label for="login-check">Remember me</label></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input type="submit" id="submit" class="submit-login"  />
                                <input type="hidden" name="Action" value="Login"/>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
                <!--  end login-inner -->
                <div class="clear"></div>
                <a href="./Home" class="forgot-pwd2">Back to Index</a>
                <a href="./ForgotPassword" class="forgot-pwd">Forgot Password?</a>
            </div>
            <!--  end loginbox -->
        </div>
        <!-- End: login-holder -->
    </body>
</html>