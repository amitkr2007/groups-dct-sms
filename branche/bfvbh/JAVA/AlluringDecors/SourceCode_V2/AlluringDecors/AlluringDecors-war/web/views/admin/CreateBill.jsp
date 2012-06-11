<%-- 
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.ServiceRequestDetailDTO"%>
<%@page import="com.alluringdecors.ejb.dto.ServiceRequestsDTO"%>
<%@page import="com.alluringdecors.ejb.dto.ServicesOfferedDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    ServiceRequestsDTO svRqtDetail = null;
    if (request.getAttribute("ServiceRequestsDTO") != null) {
        svRqtDetail = (ServiceRequestsDTO) request.getAttribute("ServiceRequestsDTO");
    }
    double total = 0.0;
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
		<script type="text/javascript" src="scripts/jquery.numeric.js"></script>

        <script type="text/javascript">
            <% if (request.getAttribute("Message") != null) {%>
                alert("<%= (String) request.getAttribute("Message")%>");
            <% }%>
        </script>
		
		 <script type="text/javascript">
           $(document).ready(function() {
				$("#submit").click(function() {
					var hasError = false;
					
					if($("#PaidAmount").val() == ''){
						$("#PaidAmountErrMsg").html("Paid amount is required");
						//alert("Paid Amount is required");
						$("#PaidAmount").removeClass("inp-form");
						$("#PaidAmount").addClass("inp-form-error");
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
                    <% if (svRqtDetail != null) {%>
                    <!-- Add new Domain list -->
                    <div id="table-content">
                        <h2>Service Request Information</h2>
                        <!-- start id-form -->
                        <%
                            for (ServiceRequestDetailDTO svDt : svRqtDetail.getServiceRequestDetail()) {
                                total += (svDt.getQuantity() * svDt.getPrice());
                            }
                        %>
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">ID Service Request: </th>
                                <td><%= svRqtDetail.getID() %></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Requested Date: </th>
                                <td><%= svRqtDetail.getRequestDate() %></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Customer: </th>
                                <td><%= svRqtDetail.getUser().getName()%></td>
                                <td></td>
                            </tr>
                        </table>
                        <h2>Services Request Details</h2>
                        <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                            <tr>
                                <th class="table-header-repeat line-left" style="text-align: center;"><a href="">No.</a></th>
                                <th class="table-header-repeat line-left minwidth-1"><a href="">Service Offered</a></th>
                                <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Quantity</a></th>
                                <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Price</a></th>
                            </tr>
                            <%
                                for (int i = 0; i < svRqtDetail.getServiceRequestDetail().size(); i++) {
                                    ServiceRequestDetailDTO detail = svRqtDetail.getServiceRequestDetail().get(i);
                            %>
                            <tr>
                                <td style="text-align: center;"><%= i + 1%></td>
                                <td><%= detail.getServiceOffered().getName()%></td>
                                <td style="text-align: center;"><%= detail.getQuantity()%></td>
                                <td style="text-align: center;"><%= detail.getPrice()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                    <% }%>
                    <div id="table-content">
                        <h2>Create Bill</h2>
                        <form action="./Bills_Insert_Controller" method="post">
                            <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                                <tr>
                                    <th valign="top">Paid Amount: </th>
                                    <td><input type="text" name="PaidAmount" id="PaidAmount" class="inp-form" /></td>									
                                    <td><label class="error-msg" id="PaidAmountErrMsg"></label></td>
                                </tr>
								<script type="text/javascript">
								$("#PaidAmount").numeric();
								</script>
                                <tr>
                                    <th valign="top">Total Paid Amount: </th>
                                    <td><span style="font-weight: bold; color: red;">$<%= total %></span></td>
                                    <td></td>
                                </tr>
                                <tr style="height: 5px;">
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;</th>
                                    <td valign="top">
                                        <input type="hidden" name="IDServiceRequest" value="<%= svRqtDetail.getID() %>" />
                                        <input type="hidden" name="TotalPaidAmount" value="<%= total %>" />
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
