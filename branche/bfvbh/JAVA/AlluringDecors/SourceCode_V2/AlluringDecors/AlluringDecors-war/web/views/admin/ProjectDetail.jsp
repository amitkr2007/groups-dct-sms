<%--
    Document   : ProjectDeail
    Created on : May 18, 2012, 9:58:50 PM
    Author     : Administrator
--%>

<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.ProjectsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Projects Management</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <!-- LINKS -->
        <link href="http://fonts.googleapis.com/css?family=Oswald:400,700" rel="stylesheet" type="text/css" />
        <link href="contents/default.css" rel="stylesheet" type="text/css" media="all" />
        <link href="contents/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <!-- SCRIPTS -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.dropotron-1.0.js"></script>
        <script type="text/javascript" src="scripts/init.js"></script>
        <script type="text/javascript" src="scripts/fckeditor/fckeditor.js"></script>
        <script type="text/javascript" src="scripts/newProjectValidate.js"></script>
        <script src="scripts/jquery-ui.min.js"></script>

        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>

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
            $(document).ready(function() {
                $("#StartDate").datepicker();
                $("#btnsubmit").click(function(){
                    var hasError = false;
                    if($("#ProjectName").val() == ''){
                        $("#ProjectNameErrMsg").html("Project name is required");
                        $("#ProjectName").removeClass("inp-form");
                        $("#ProjectName").addClass("inp-form-error");
                        hasError = true;
                    }
                    else {
                        $("#ProjectNameErrMsg").html("");
                        $("#ProjectName").removeClass("inp-form-error");
                        $("#ProjectName").addClass("inp-form");
                    }

		    var projectStatus = $("#ProjectStatus").val();
		    var startDate = Date.parse($("#StartDate").val())
		    if("On-Going" == projectStatus){
			if(startDate >= Date.now() ){
			    $("#StartDateErrMsg").html("Verify start date for On-Going project,must  less then to day");
			    $("#StartDate").removeClass("inp-form");
			    $("#StartDate").addClass("inp-form-error");
			    hasError = true;
			}
			else{
			    $("#StartDateErrMsg").html("");
			    $("#StartDate").removeClass("inp-form-error");
			    $("#StartDate").addClass("inp-form");
			}
		    } else if ("Up-Coming" == projectStatus) {
			if(startDate <= Date.now() ){
			    $("#StartDateErrMsg").html("Verify start date for Up-Coming project,must greater then to day");
			    $("#StartDate").removeClass("inp-form");
			    $("#StartDate").addClass("inp-form-error");
			    hasError = true;
			}
			else{
			    $("#StartDateErrMsg").html("");
			    $("#StartDate").removeClass("inp-form-error");
			    $("#StartDate").addClass("inp-form");
			}
		    } else { // Accomplished
			if(startDate > Date.now() ){
			    $("#StartDateErrMsg").html("Verify start date for Accomplished project,must less then to day");
			    $("#StartDate").removeClass("inp-form");
			    $("#StartDate").addClass("inp-form-error");
			    hasError = true;
			}
			else{
			    $("#StartDateErrMsg").html("");
			    $("#StartDate").removeClass("inp-form-error");
			    $("#StartDate").addClass("inp-form");
			}
		    }

                    if($("#Image").val() == ''){
			    $("#ImageErrMsg").html("Image is required");
			    $("#Image").removeClass("inp-form");
			    $("#Image").addClass("inp-form-error");
			    hasError = true;
		    }else {
			$("#ImageErrMsg").html("");
			$("#Image").removeClass("inp-form-error");
			$("#Image").addClass("inp-form");
		    }

                    if(hasError == true)
                        return false;
                });
            });
        </script>
    </head>
    <body>
        <!-- START HEADER & MENU -->
        <%@include file="../templates/UC_Header.jsp" %>
        <!-- END HEADER & MENU -->
        <%
            String controller = null;
            String action = (String) request.getAttribute("action");
            if ("Add".equals(action)) {
                controller = "NewProject";
            } else if ("Edit".equals(action)) {
                controller = "UpdateProject";
            }
        %>
        <!-- START MAIN CONTENT -->
        <div id="main-content">
            <div id="content-table-inner">
                <div id="table-content">
                    <h2>Project Detail</h2>
                    <%
                        ProjectsDTO projectobj = (ProjectsDTO) request.getAttribute("project");
                        if (projectobj == null) {
                            projectobj = new ProjectsDTO();
                            projectobj.setProjectStatus(ProjectStatus.ON_GOING.toString());
                            int serviceRequestID = Integer.parseInt((String) request.getAttribute("serviceRequestId"));
                            projectobj.setIDServiceRequest(serviceRequestID);
                        }
                    %>
                    <!-- start id-form -->
                    <form action="<%= controller%>" method="post" name="formProjectDetail" enctype="multipart/form-data">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">ID Service Request:</th>
                                <td><%= projectobj.getIDServiceRequest()%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">ID:</th>
                                <td><%= projectobj.getID()%></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Project name:</th>
                                <td><input name="Name" id="ProjectName" type="text" value="<%= projectobj.getName()%>" class="inp-form" /></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><label class="des-error-msg" id="ProjectNameErrMsg"></label></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top">Project status:</th>
                                <td>
                                    <select name="ProjectStatus" id="ProjectStatus" class="styledselect_form_1">
                                        <%ArrayList<ProjectStatus> lst = ProjectStatus.getAllProjectStatus();
                                            for (ProjectStatus status : lst) {
                                                if (status.toString().equals(projectobj.getProjectStatus())) {
                                        %>
                                        <option value="<%= status.toString()%>" selected="selected"><%= status.toString()%></option>
                                        <% } else {
                                        %>
                                        <option value="<%= status.toString()%>"><%= status.toString()%></option>
                                        <%}
                                            }%>
                                    </select>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                            <tr>
                                <th>Image</th>
                                <td><input type="file" name="Image" id="Image"></td>
                                <td></td>
                            </tr>
                            <tr>
				<th></th>
				<td><label class="des-error-msg" id="ImageErrMsg"></label></td>
				<td></td>
			    </tr>
                            <tr>
                                <th></th>
                                <td><img src="images/uploads/<%= projectobj.getImage()%>" border="0" style="width: 200px; height: 200px;" /></td>
                                <td></td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td colspan="2"><h2>Project Description</h2></td>
                            </tr>
                            <tr>
                                <th valign="top">Description</th>
                                <td>
                                    <textarea name="Description" id="Des" value=""><%= projectobj.getDescription()%></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td><label class="des-error-msg" id="DesErrMsg"></label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Brief Description</th>
                                <td>
                                    <textarea name="BriefDescription" id="BriefDes" value="" style="width: 795px; height: 80px;"><%= projectobj.getBriefDescription()%></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td><label class="des-error-msg" id="BriefDesErrMsg"></label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Start Date:</th>
                                <td><input name="StartDate" id="StartDate" value="<%= CommonHelpers.formatDate(projectobj.getStartDate())%>" class="inp-form" />
                                </td>
                                <td></td>
                            </tr>
			    <tr>
                                <th valign="top"></th>
                                <td><label class="des-error-msg" id="StartDateErrMsg"></label>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="hidden" name="ID" value="<%= projectobj.getID()%>" />
                                    <input type="hidden" name="IDServiceRequest" value="<%= projectobj.getIDServiceRequest()%>" />
                                    <input type="submit" id="btnsubmit" value="" class="form-submit" />
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
