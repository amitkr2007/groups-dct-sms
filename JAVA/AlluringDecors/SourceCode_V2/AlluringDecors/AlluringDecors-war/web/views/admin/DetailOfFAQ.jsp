<%-- 
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.ejb.dto.FAQDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    FAQDTO dto = (FAQDTO) request.getAttribute("FAQDTO");
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
        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>

        <script type="text/javascript">
            $(document).ready(function() {
                $("#submit").click(function() {
                    var hasError = false;
                    if($("#Question").val() == ''){
                        $("#QuestionErrMsg").html("Question is required");
                        //alert("Content is required");
                        hasError = true;
                    }
					
                    if($("#Answer").val() == ''){
                        $("#AnswerErrMsg").html("Answer is required");
                        //alert("Content is required");
                        hasError = true;
                    }
					
                    if(hasError == true){
                        return false;
                    }
                })
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
                    <h2>FAQ Detail</h2>
                    <!-- start id-form -->
                    <form action="./FAQ_Update_Controller" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">Question:</th>
                                <td>
                                    <textarea name="Question" id="Question" style="width: 600px; height: 50px;"><%= dto.getQuestion()%></textarea>
                                </td>
                                <td></td>
                            </tr>

                            <tr>
                                <th valign="top"></th>
                                <td><label class="des-error-msg" id="QuestiontErrMsg"></label>
                                </td>
                                <td></td>
                            </tr>

                            <tr>
                                <th valign="top">Answer</th>
                                <td>
                                    <textarea name="Answer" id="Answer" style="width: 600px; height: 100px;"><%= dto.getAnswer()%></textarea>
                                </td>
                                <td></td>
                            </tr>

                            <tr>
                                <th valign="top"></th>
                                <td><label class="des-error-msg" id="AnswerErrMsg"></label>
                                </td>
                                <td></td>
                            </tr>

                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="hidden" name="ID" value="<%= dto.getID()%>"/>
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
