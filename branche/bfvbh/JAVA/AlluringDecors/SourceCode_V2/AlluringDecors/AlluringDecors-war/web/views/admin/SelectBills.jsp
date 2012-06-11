<%-- 
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.ServiceRequestDetailDTO"%>
<%@page import="com.alluringdecors.ejb.dto.BillsDTO"%>
<%@page import="com.alluringdecors.ejb.dto.ServicesOfferedDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    Object obj = request.getAttribute("BillsDTOs");
    if (obj == null) {
        String url = "/Bills_SelectAll_Controller";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
    BillsDTO billDetail = null;
    if (request.getAttribute("BillsDTO") != null) {
        billDetail = (BillsDTO) request.getAttribute("BillsDTO");
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
                    <h2>Bills Management</h2>
                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                        <tr>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">ID Bill</a></th>
                            <th class="table-header-repeat line-left minwidth-1" style="text-align: center;"><a href="">ID ServiceRequest</a></th>
                            <th class="table-header-repeat line-left minwidth-1"><a href="">DatePaid</a></th>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Balance Amount</a></th>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Due Amount</a></th>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Total Amount</a></th>
                            <th class="table-header-repeat line-left"><a href=""></a></th>
                        </tr>
                        <%
                            ArrayList<BillsDTO> ds = (ArrayList<BillsDTO>) obj;
                            if (ds != null) {
                                for (int i = 0; i < ds.size(); i++) {
                                    BillsDTO item = ds.get(i);
                        %>
                        <tr>
                            <td style="text-align: center;"><%= item.getID()%></td>
                            <td style="text-align: center;"><a href="./ServiceRequests_SelectByID_Controller?id=<%= item.getIDServiceRequest()%>"><%= item.getIDServiceRequest()%></a></td>
                            <td><%= item.getDatePaid()%></td>
                            <td style="text-align: center;"><%= item.getBalanceAmount()%></td>
                            <td style="text-align: center;"><%= item.getDueAmount()%></td>
                            <td style="text-align: center;"><%= item.getTotalPaidAmount()%></td>
                            <td>
                                <a href="./Bills_SelectByID_Controller?id=<%= item.getID()%>" title="Select" class="icon-55 info-tooltip""></a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
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
