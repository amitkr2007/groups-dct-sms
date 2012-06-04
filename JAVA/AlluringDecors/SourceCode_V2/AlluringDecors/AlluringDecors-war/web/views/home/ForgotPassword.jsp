<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


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
        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>

	<script type="text/javascript">
	    $(document).ready(function() {
		$("#submit").click(function() {
		    var hasError = false;

		    if($("#Email").val() == ''){
			$("#EmailErrMsg").html("Email is required");
//			alert("Email is required");
			hasError = true;
		    }
		    else {
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			if(!emailReg.test($("#Email").val())) {
			    $("#EmailErrMsg").html("Enter a valid email address.");
//			    alert("Enter a valid email address.");
			    hasError = true;
			}
			else {
			    $("#EmailErrMsg").html("");
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
                <a href="index.html">Back to Index</a>
            </div>
            <!-- end logo -->

            <div class="clear"></div>

            <!--  start forgotbox ................................................................................... -->
            <div id="forgotbox">
                <div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
                <!--  start forgot-inner -->
                <form action="./ResetPassword" method="post">
                    <div id="forgot-inner">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <th>Email address:</th>
                                <td><input type="text" Name="Email" id="Email" class="login-inp" /></td>
                            </tr>
			    <tr>
				<th></th>
				<td><label style="color: wheat" id="EmailErrMsg"></label></td>
			    </tr>
                            <tr>
                                <th> </th>
                                <td><input type="submit" id="submit" class="submit-login"  /></td>
                            </tr>
                        </table>
                    </div>
                </form>
                <!--  end forgot-inner -->
                <div class="clear"></div>
                <a href="./Home" class="forgot-pwd2">Back to Index</a>
                <a href="./Login" class="back-login">Back to login</a>
            </div>
            <!--  end forgotbox -->

        </div>
        <!-- End: login-holder -->
    </body>
</html>