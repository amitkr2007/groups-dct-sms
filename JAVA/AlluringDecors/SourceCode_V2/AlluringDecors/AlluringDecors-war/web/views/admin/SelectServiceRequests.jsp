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
    Object obj = request.getAttribute("ServiceRequestsDTOs");
    if (obj == null) {
        String url = "/ServiceRequests_SelectAll_Controller";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
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
                    <h2>Services Request Management</h2>
                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                        <tr>
                            <th class="table-header-repeat line-left" style="width: 120px; text-align: center;"><a href="">ID Request</a></th>
                            <th class="table-header-repeat line-left minwidth-1"><a href="">User</a></th>
                            <th class="table-header-repeat line-left minwidth-1"><a href="">Request Status</a></th>
                            <th class="table-header-repeat line-left"><a href="">Request Date</a></th>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Project Created?</a></th>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Bill Created?</a></th>
                            <th class="table-header-repeat line-left"><a href=""></a></th>
                        </tr>
                        <%
                            ArrayList<ServiceRequestsDTO> ds = (ArrayList<ServiceRequestsDTO>) obj;
                            if (ds != null) {
                                for (int i = 0; i < ds.size(); i++) {
                                    ServiceRequestsDTO item = ds.get(i);
                        %>
                        <tr>
                            <td style="text-align: center;"><%= item.getID()%></td>
                            <td><%= item.getUser().getName()%></td>
                            <td><%= item.getRequestStatus()%></td>
                            <td><%= item.getRequestDate()%></td>

                            <% if (item.isProjectCreated()) {%>
                            <td style="text-align: center;"><a href="./Projects_SelectByIDServiceRequest_Controller?idservicerequest=<%= item.getID()%>"><%= item.isProjectCreated()%></a></td>
                            <% } else {%>
                            <td style="text-align: center;"><%= item.isProjectCreated()%></td>
                            <% }%>

                            <% if (item.isBillCreated()) {%>
                            <td style="text-align: center;"><a href="./Bills_SelectByIDServiceRequest_Controller?idservicerequest=<%= item.getID()%>"><%= item.isBillCreated()%></a></td>
                            <% } else {%>
                            <td style="text-align: center;"><%= item.isBillCreated()%></td>
                            <% }%>


                            <td>
                                <a href="./ServiceRequests_SelectByID_Controller?id=<%= item.getID()%>" title="Select" class="icon-55 info-tooltip""></a>
                                <% if (!item.isProjectCreated()) {
                                        if (RequestStatus.REJECTED.toString().equals(item.getRequestStatus())) {
                                %>
                                <a href="#" onclick="alert('The status of this request is rejected, so corresponding project cannot be created')" title="Create Project" class="icon-3 info-tooltip"></a>
                                <% } else {%>
                                <a href="./ProjectDetail?serviceRequestId=<%= item.getID()%>" title="Create Project" class="icon-3 info-tooltip"></a>
                                <% }
                                    }%>
                                <% if (!item.isBillCreated()) {
                                        if (RequestStatus.REJECTED.toString().equals(item.getRequestStatus())) {%>
                                <a href="#" onclick="alert('The status of this request is rejected, so corresponding bill cannot be created')" title="Create Bill" class="icon-1 info-tooltip"></a>
                                <% } else {%>
                                <a href="./ServiceRequests_CreateBill_Controller?idservicerequest=<%= item.getID()%>" title="Create Bill" class="icon-1 info-tooltip""></a>
                                <% }
                                    }%>
                                <a href="./ServiceRequests_Delete_Controller?id=<%= item.getID()%>" title="Delete" class="icon-2 info-tooltip" onclick="return confirm('Are you sure you want to Delete it? This action cannot be undone.')"></a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
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
                            <td><span style="font-weight: bold; color: blue;"><%= svRqtDetail.getID() %></span></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">Total Cash: </th>
                            <td><span style="font-weight: bold; color: red;">$<%= total%></span></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">IDCustomer: </th>
                            <td><%= svRqtDetail.getUser().getID()%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">FullName: </th>
                            <td><%= svRqtDetail.getUser().getName() == null ? "" : svRqtDetail.getUser().getName()%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">Customer's Phone: </th>
                            <td><%= svRqtDetail.getUser().getPhone() == null ? "" : svRqtDetail.getUser().getPhone()%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">Customer's Email: </th>
                            <td><%= svRqtDetail.getUser().getEmail() == null ? "" : svRqtDetail.getUser().getEmail()%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">Localtion: </th>
                            <td><%= svRqtDetail.getLocation() == null ? "" : svRqtDetail.getLocation()%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">Location's Phone: </th>
                            <td><%= svRqtDetail.getPhoneLocation() == null ? "" : svRqtDetail.getPhoneLocation()%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">Location's Email: </th>
                            <td><%= svRqtDetail.getMailLocation() == null ? "" : svRqtDetail.getMailLocation()%></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th valign="top">Note: </th>
                            <td><%= svRqtDetail.getNote() == null ? "" : svRqtDetail.getNote()%></td>
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
                    <br/>
                    <h2>Update Request's Status</h2>
                    <form action="./ServiceRequests_Update_Controller" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">New Status: </th>
                                <td>
                                    <select name="RequestStatus">
                                        <option value="<%= RequestStatus.REQUEST_RECEIVED.toString()%>"><%= RequestStatus.REQUEST_RECEIVED.toString()%></option>
                                        <option value="<%= RequestStatus.ACCEPTED.toString()%>"><%= RequestStatus.ACCEPTED.toString()%></option>
                                        <option value="<%= RequestStatus.REJECTED.toString()%>"><%= RequestStatus.REJECTED.toString()%></option>
                                        <option value="<%= RequestStatus.PAYMENT_RECEIVED.toString()%>"><%= RequestStatus.PAYMENT_RECEIVED.toString()%></option>
                                        <option value="<%= RequestStatus.SERVICE_BEGAN.toString()%>"><%= RequestStatus.SERVICE_BEGAN.toString()%></option>
                                        <option value="<%= RequestStatus.SERVICE_COMPLETED.toString()%>"><%= RequestStatus.SERVICE_COMPLETED.toString()%></option>
                                    </select>
                                </td>
                                <td></td>
                            </tr>
                            <tr style="height: 5px;">
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="hidden" name="ID" value="<%= svRqtDetail.getID()%>" />
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
