<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.DomainListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Maximus4T by 4Templates</title>
        <meta name="keywordomainList" content="" />
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
                alert("<%= (String)request.getAttribute("Message") %>");
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
                    <h2>Domain List Management</h2>
                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                        <tr>
                            <th class="table-header-repeat line-left"><a href="">ID</a></th>
                            <th class="table-header-repeat line-left minwidth-1"><a href="">Name</a></th>
                            <th class="table-header-repeat line-left"><a href=""></a></th>
                        </tr>
                        <%
                            if (domainList != null) {
                                for (int i = 0; i < domainList.size(); i++) {
                                    DomainListDTO item = domainList.get(i);
                        %>
                        <tr>
                            <td><%= item.getID()%></td>
                            <td><%= item.getName()%></td>
                            <td>
                                <a href="./DomainList_SelectByID_Controller?id=<%= item.getID()%>" title="Edit" class="icon-5 info-tooltip"></a>
                                <a href="./DomainList_Delete_Controller?id=<%= item.getID()%>" title="Delete" class="icon-2 info-tooltip" onclick="return confirm('Are you sure you want to Delete it? This action cannot be undone.')"></a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>

                <!-- Add new Domain list -->
                <div id="table-content">
                    <h2>Add New Domain List</h2>
                    <!-- start id-form -->
                    <form action="./DomainList_Insert_Controller" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">Domain List Name:</th>
                                <td><input type="text" name="Name" id="Name" class="inp-form" /></td>
                                <td><label class="error-msg" id="NameErrMsg"></label></td>
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
