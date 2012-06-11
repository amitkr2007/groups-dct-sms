<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.FeedBacksDTO"%>
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
        <!-- SCRIPTS -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.dropotron-1.0.js"></script>
        <script type="text/javascript" src="scripts/init.js"></script>
        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>

	<script type="text/javascript">
	    $(document).ready(function() {
		$("#submit").click(function() {
			var hasError = false;
			if($("#FullName").val() == ''){
			    $("#FullNameErrMsg").html("Full name is required");
			    //alert("Name is required");
			    $("#FullName").removeClass("inp-form");
			    $("#FullName").addClass("inp-form-error");
			    hasError = true;
			}
			else{
			    $("#FullNameErrMsg").html("");
			    //alert("Name is required");
			    $("#FullName").removeClass("inp-form-error");
			    $("#FullName").addClass("inp-form");
			}

			if($("#Email").val() == ''){
			    $("#EmailErrMsg").html("Email is required");
			    //alert("Name is required");
			    $("#Email").removeClass("inp-form");
			    $("#Email").addClass("inp-form-error");
			    hasError = true;
			}
			else {
			    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			    if(!emailReg.test($("#Email").val())) {
				$("#EmailErrMsg").html("Enter a valid email address.");
				$("#Email").removeClass("inp-form");
				$("#Email").addClass("inp-form-error");
				hasError = true;
			    }
			    else {
				$("#EmailErrMsg").html("");
				$("#Email").removeClass("inp-form-error");
				$("#Email").addClass("inp-form");
			    }
			}

			if($("#Title").val() == ''){
			    $("#TitleErrMsg").html("Title is required");
			    //alert("Name is required");
			    $("#Title").removeClass("inp-form");
			    $("#Title").addClass("inp-form-error");
			    hasError = true;
			}
			else {
			    $("#TitleErrMsg").html("");
			    //alert("Name is required");
			    $("#Title").removeClass("inp-form-error");
			    $("#Title").addClass("inp-form");
			}

			if($("#Content").val() == ''){
			    $("#ContentErrMsg").html("Title is required");
			    //alert("Name is required");
			    $("#Content").removeClass("inp-form");
			    $("#Content").addClass("inp-form-error");
			    hasError = true;
			}
			else{
			    $("#ContentErrMsg").html("");
			    //alert("Name is required");
			    $("#Content").removeClass("inp-form-error");
			    $("#Content").addClass("inp-form");
			}

			if(hasError == true){
				return false;
			}
	    });
	});
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
                    <h2>User feedback</h2>
                    <form action="AddFeedback" method="post">
                        <table border="0"  cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">Full Name:</th>
                                <td><input name="FullName" id="FullName" type="text" class="inp-form" /></td>
                                <td><label class="error-msg" id="FullNameErrMsg"></label></td>
                            </tr>
                            <tr>
                                <th valign="top">Email:</th>
                                <td><input name="Email" id="Email" type="text" class="inp-form" /></td>
                                <td><label class="error-msg" id="EmailErrMsg"></label></td>
                            </tr>
                            <tr>
                                <th valign="top">Title:</th>
                                <td><input name="Title" id="Title" type="text" class="inp-form" /></td>
                                <td><label class="error-msg" id="TitleErrMsg"></label></td>
                            </tr>
                            <tr>
                                <th valign="top">Content:</th>
                                <td><textarea name="Content" id="Content" class="form-textarea"></textarea></td>
                                <td><label class="error-msg" id="ContentErrMsg"></label></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="submit" id="submit" value="" class="form-submit" />
                                </td>
                                <td></td>
                            </tr>
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
