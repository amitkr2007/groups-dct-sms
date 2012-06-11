<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.RepliesDTO"%>
<%@page import="com.alluringdecors.ejb.dto.FeedBacksDTO"%>
<%@page import="com.alluringdecors.ejb.dto.BillsDTO"%>
<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.ServiceRequestDetailDTO"%>
<%@page import="com.alluringdecors.ejb.dto.ServiceRequestsDTO"%>
<%@page import="com.alluringdecors.ejb.dto.ServicesOfferedDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    FeedBacksDTO feedbackDetail = null;
    ArrayList<RepliesDTO> ds = null;
    if (request.getAttribute("FeedBacksDTO") != null) {
        feedbackDetail = (FeedBacksDTO) request.getAttribute("FeedBacksDTO");
    }

    if (request.getAttribute("RepliesDTOs") != null) {
        ds = (ArrayList<RepliesDTO>) request.getAttribute("RepliesDTOs");;
    }
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
            <% if (feedbackDetail != null) {%>
                    var objFckEditor = new FCKeditor('ReplyContent');
                    objFckEditor.BasePath = "scripts/fckeditor/";
                    objFckEditor.Height = 300;
                    objFckEditor.Width = 800;
                    objFckEditor.ToolbarSet = 'MyToolbar_Basic';
                    objFckEditor.ReplaceTextarea();
            <% }%>
                }
        </script>

        <script type="text/javascript">
            $(document).ready(function() {
                $("#submit").click(function() {
                    var hasError = false;
                    var content = FCKeditorAPI.GetInstance("ReplyContent");
                    if (content.GetHTML() == ""){
                        $("#ContentErrMsg").html("Content is required");
                        hasError = true;
                    }
                    else{
                        $("#ContentErrMsg").html("");
                    }

                    if(hasError == true){
                        return false;
                    }
                });
            });
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
                    <% if (feedbackDetail != null) {%>
                    <!-- Add new Domain list -->
                    <div id="table-content">
                        <h2>Feedback Information</h2>
                        <!-- start id-form -->
                        <%
                            if (feedbackDetail != null) {
                        %>
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">Title: </th>
                                <td><%= feedbackDetail.getTiitle()%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Content: </th>
                                <td><%= feedbackDetail.getContent()%></td>
                                <td></td>
                            </tr>
                        </table>
                        <% }%>
                        <br/>
                        <h2>Replies list</h2>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <tr>
                                <th class="table-header-repeat line-left" style="text-align: center;"><a href="">No.</a></th>
                                <th class="table-header-repeat line-left minwidth-1"><a href="">Reply content</a></th>
                                <th class="table-header-repeat line-left minwidth-1" style="text-align: center;"><a href="">Reply Date</a></th>
                                <th class="table-header-repeat line-left" style="text-align: center;"><a href=""></a></th>
                            </tr>
                            <%
                                for (int i = 0; i < ds.size(); i++) {
                                    RepliesDTO detail = ds.get(i);
                            %>
                            <tr>
                                <td style="text-align: center;"><%= i + 1%></td>
                                <td style="text-align: justify; padding: 10px;"><%= detail.getReplyContent()%></td>
                                <td style="text-align: center;"><%= detail.getReplyDate()%></td>
                                <td>
                                    <a href="./Replies_Delete_Controller?id=<%= detail.getID()%>&idfeedback=<%= feedbackDetail.getID()%>" title="Delete" class="icon-2 info-tooltip" onclick="return confirm('Are you sure you want to Delete it? This action cannot be undone.')"></a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                        <br/>
                        <h2>Reply the feedback</h2>
                        <form action="./Replies_Insert_Controller" method="post">
                            <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                                <tr>
                                    <th valign="top"></th>
                                    <td><label class="des-error-msg" id="ContentErrMsg"></label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <th valign="top">Reply content</th>
                                    <td>
                                        <textarea name="ReplyContent" id="Content" style="width: 795px; height: 80px;"></textarea>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;</th>
                                    <td valign="top">
                                        <input type="hidden" name="IDFeedBack" value="<%= feedbackDetail.getID()%>" />
                                        <input type="submit" id="submit" value="" class="form-submit" />
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
