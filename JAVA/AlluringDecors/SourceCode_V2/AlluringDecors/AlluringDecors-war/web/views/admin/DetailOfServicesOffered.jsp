<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.ServicesOfferedDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    ServicesOfferedDTO dto = (ServicesOfferedDTO) request.getAttribute("ServicesOfferedDTO");
%>

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
        <script type="text/javascript" src="scripts/jquery.numeric.js"></script>
        <script type="text/javascript" src="scripts/fckeditor/fckeditor.js"></script>

        <script type="text/javascript">
            window.onload = function () {
                var objFckEditor = new FCKeditor('Description');
                objFckEditor.BasePath = "scripts/fckeditor/";
                objFckEditor.Height = 400;
                objFckEditor.Width = 800;
                objFckEditor.ToolbarSet = 'MyToolbar_Basic';
                objFckEditor.ReplaceTextarea();
            }
        </script>

        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>

	<script type="text/javascript">
	    $(document).ready(function() {
		$("#submit").click(function() {
		    var hasError = false;
		    if($("#Name").val() == ''){
			    $("#NameErrMsg").html("Name is required");
			    $("#Name").removeClass("inp-form");
			    $("#Name").addClass("inp-form-error");
			    hasError = true;
		    }else {
			$("#NameErrMsg").html("");
			$("#Name").removeClass("inp-form-error");
			$("#Name").addClass("inp-form");
		    }

		    if($("#Price").val() == ''){
			    $("#PriceErrMsg").html("Price is required");
			    $("#Price").removeClass("inp-form");
			    $("#Price").addClass("inp-form-error");
			    hasError = true;
		    }else {
			$("#PriceErrMsg").html("");
			$("#Price").removeClass("inp-form-error");
			$("#Price").addClass("inp-form");
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
                    <h2>Service Offered Detail</h2>
                    <!-- start id-form -->
                    <form action="./ServicesOffered_Update_Controller" enctype="multipart/form-data" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">ID:</th>
                                <td><%= dto.getID()%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Domain:</th>
                                <td><%= dto.getDomainList().getName()%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Name</th>
                                <td>
                                    <input type="text" name="Name" id="Name" value="<%= dto.getName()%>" class="inp-form" />
                                </td>
                                <td></td>
                            </tr>
			    <tr>
				<th></th>
				<td><label class="des-error-msg" id="NameErrMsg"></label></td>
				<td></td>
			    </tr>
                            <tr>
                                <th valign="top">Price</th>
                                <td>
                                    <input type="text" name="Price" id="Price" value="<%= dto.getPrice()%>" class="inp-form" />
                                </td>
                                <td></td>
                            </tr>
			    <script type="text/javascript">
			    $("#Price").numeric();
			    </script>
			     <tr>
				<th></th>
				<td><label class="des-error-msg" id="PriceErrMsg"></label></td>
				<td></td>
			    </tr>
                            <tr>
                                <td colspan="2"><h2>Service Offered Description</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="Description"><%= dto.getDescription()%></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Brief Description</th>
                                <td>
                                    <textarea name="BriefDescription" style="width: 795px; height: 80px;"><%= dto.getBriefDescription()%></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>Image</th>
                                <td><input type="file" name="Image" ></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><img src="images/uploads/<%= dto.getImage()%>" border="0" style="width: 80px; height: 80px; padding-left: 10px;" /></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="hidden" name="ID" value="<%= dto.getID()%>" />
                                    <input type="submit" id="submit" value="" class="form-submit" />
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
