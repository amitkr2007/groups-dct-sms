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
    Object obj = request.getAttribute("CompanyInformationDTOs");
    if (obj == null) {
        String url = "/CompanyInformation_SelectAll_Controller";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    ArrayList<CompanyInformationDTO> ds = (ArrayList<CompanyInformationDTO>) obj;
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
            <% if (ds.size() == 0) {%>
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
            <% }%>
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
                <div id="table-content">
                    <h2>Company Information Management</h2>
                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                        <tr>
                            <th class="table-header-repeat line-left"><a href="">ID</a></th>
                            <th class="table-header-repeat line-left minwidth-1"><a href="">Address</a></th>
                            <th class="table-header-repeat line-left"><a href="">Phone</a></th>
                            <th class="table-header-repeat line-left"><a href=""></a></th>
                        </tr>
                        <%
                            if (ds != null) {
                                for (int i = 0; i < ds.size(); i++) {
                                    CompanyInformationDTO item = ds.get(i);
                        %>
                        <tr>
                            <td><%= item.getID()%></td>
                            <td><%= item.getAddress()%></td>
                            <td><%= item.getPhone()%></td>
                            <td>
                                <a href="./CompanyInformation_SelectByID_Controller?id=<%= item.getID()%>" title="Edit" class="icon-5 info-tooltip"></a>
                                <a href="./CompanyInformation_Delete_Controller?id=<%= item.getID()%>" title="Delete" class="icon-2 info-tooltip" onclick="return confirm('Are you sure you want to Delete it? This action cannot be undone.')"></a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
                <% if (ds.size() == 0) {%>
                <!-- Add new Domain list -->
                <div id="table-content">
                    <h2>Add New Company Information</h2>
                    <!-- start id-form -->
                    <form action="./CompanyInformation_Insert_Controller" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">Address</th>
                                <td>
                                    <input name="Address" style="width: 795px;" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Phone</th>
                                <td>
                                    <input name="Phone" style="width: 200px;" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Company Description</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="CompanyDescription"></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Brief Description</th>
                                <td>
                                    <textarea name="BriefCompanyDescription" style="width: 795px; height: 80px;"></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Service Description</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="ServiceDescription"></textarea>
                                </td>
                                <td></td>
                            </tr> 
                            <tr>
                                <th valign="top">Brief Description</th>
                                <td>
                                    <textarea name="BriefServiceDescription" style="width: 795px; height: 80px;"></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Why people must prefer Alluring Decors's services?</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="PreferExplanation"></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="submit" value="" class="form-submit" />
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <% }%>
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
