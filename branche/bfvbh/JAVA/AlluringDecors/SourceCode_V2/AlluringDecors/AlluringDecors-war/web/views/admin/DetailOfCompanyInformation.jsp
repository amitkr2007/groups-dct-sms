<%-- 
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.CompanyInformationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    CompanyInformationDTO dto = (CompanyInformationDTO) request.getAttribute("CompanyInformationDTO");
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
        <script type="text/javascript" src="scripts/fckeditor/fckeditor.js"></script>

        <script type="text/javascript">
            window.onload = function () {
                var objFckEditor = new FCKeditor('CompanyDescription');
                objFckEditor.BasePath = "scripts/fckeditor/";
                objFckEditor.Height = 400;
                objFckEditor.Width = 800;
                objFckEditor.ToolbarSet = 'MyToolbar_Basic';
                objFckEditor.ReplaceTextarea();
                        
                objFckEditor = new FCKeditor('ServiceDescription');
                objFckEditor.BasePath = "scripts/fckeditor/";
                objFckEditor.Height = 400;
                objFckEditor.Width = 800;
                objFckEditor.ToolbarSet = 'MyToolbar_Basic';
                objFckEditor.ReplaceTextarea();
                
                objFckEditor = new FCKeditor('PreferExplanation');
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
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->

        <!-- START MAIN CONTENT -->
        <div id="main-content">
            <div id="content-table-inner">
                <!-- Add new Domain list -->
                <div id="table-content">
                    <h2>Detail Of Company Information</h2>
                    <!-- start id-form -->
                    <form action="./CompanyInformation_Update_Controller" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">Address</th>
                                <td>
                                    <input name="Address" style="width: 795px;" value="<%= dto.getAddress() %>" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Phone</th>
                                <td>
                                    <input name="Phone" style="width: 200px;" value="<%= dto.getPhone() %>" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Company Description</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="CompanyDescription"><%= dto.getCompanyDescription() %></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Brief Description</th>
                                <td>
                                    <textarea name="BriefCompanyDescription" style="width: 795px; height: 80px;"><%= dto.getBriefCompanyDescription() %></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Service Description</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="ServiceDescription"><%= dto.getServiceDescription() %></textarea>
                                </td>
                                <td></td>
                            </tr> 
                            <tr>
                                <th valign="top">Brief Description</th>
                                <td>
                                    <textarea name="BriefServiceDescription" style="width: 795px; height: 80px;"><%= dto.getBriefServiceDescription() %></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Why people must prefer Alluring Decors's services?</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="PreferExplanation"><%= dto.getPreferExplanation() %></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input name="ID" type="hidden" value="<%= dto.getID() %>" />
                                    <input type="submit" value="" class="form-submit" />
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
