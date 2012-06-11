<%--
    Document   : UC_Header
    Created on : May 13, 2012, 11:03:13 AM
    Author     : Administrator
--%>
<%@page import="com.alluringdecors.common.Role"%>
<%@page import="com.alluringdecors.common.WebConfig"%>
<%@page import="com.alluringdecors.common.ProjectStatus"%>
<%@page import="com.alluringdecors.common.RequestStatus"%>
<%@page import="com.alluringdecors.common.ShoppingCart"%>
<%@page import="com.alluringdecors.common.ShoppingCart"%>
<%@page import="com.alluringdecors.ejb.dto.DomainListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alluringdecors.ejb.dto.UserDTO"%>
<%@page session="true" %>

<script type="text/javascript" src="scripts/jquery.lazyload.js"></script>

<script type="text/javascript">
    $(function () {
        $("img").lazyload({
            placeholder: "images/box.gif",
            effect: "fadeIn",
            threshold: 50
        });
    });
</script>

<div id="header-wrapper">
    <div id="header">
        <div style="color: white; text-align: right; height: 20px;">
            <%
                        UserDTO user = (UserDTO) session.getAttribute("UserInfo");
                        if (user == null) {
            %>
            <a href="./Login?Action=View" style="color: white; text-decoration: none;">Login</a> |
            <a href="./Register" style="color: white; text-decoration: none;">Register</a> |
            <% } else {
            %>
            Welcome <span style="text-decoration: underline; font-weight: bold;"><%= user.getName()%></span> |
            <a href="./Login?Action=Logout" style="color: white; text-decoration: none;">Logout</a> |
            <a href="./ChangePassword" style="color: white; text-decoration: none;">Change Password</a> |

            <% if (!Role.ADMINISTRATOR.toString().equals(user.getRole())) {%>
            <a href="./HistoryTransaction" style="color: white; text-decoration: none;">History Transaction</a> |
            <%}
                        }%>
            <% if (user != null && !Role.ADMINISTRATOR.toString().equals(user.getRole())) {%>
            <% if (session.getAttribute("ShoppingCart") == null) {%>
            <a href="./ViewCart" style="color: white; text-decoration: none;">Shopping Cart (0)</a>
            <% } else {
                 ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
            %>
            <a href="./ViewCart" style="color: white; text-decoration: none;">Shopping Cart (<%= cart.getCart().size()%>)</a>
            <% }
                        }%>

        </div>
        <div id="logo">
            <h1><a href="."><%= WebConfig.getValue(WebConfig.WEBSITE)%></a></h1>
            <p><%= WebConfig.getValue(WebConfig.SLOGUN)%></p>
        </div>
    </div>
</div>
<div id="menu-wrapper">
    <div id="menu-content">
        <ul id="menu">
            <li class="first"><a href="." accesskey="1" title=""><span>Home</span></a></li>
            <li><span>Projects</span>
                <ul>
                    <li class="first"><a href="./ProjectController?Status=<%= ProjectStatus.ON_GOING.toString()%>">On-Going Projects</a></li>
                    <li><a href="./ProjectController?Status=<%= ProjectStatus.UP_COMING.toString()%>">Up-Coming Projects</a></li>
                    <li class="last"><a href="./ProjectController?Status=<%= ProjectStatus.ACCOMPLISHED.toString()%>">Accomplished Projects</a></li>
                </ul>
            </li>
            <li><span>Services Offered</span>
                <ul>
                    <%
                                ArrayList<DomainListDTO> domainList = (ArrayList<DomainListDTO>) request.getAttribute("DomainListDTOs");
                                if (domainList != null) {
                                    for (int i = 0; i < domainList.size(); i++) {
                                        DomainListDTO item = domainList.get(i);
                    %>
                    <% if (i == 0) {%>
                    <li class="first"><a href="./ServicesOffered?iddomainlist=<%= item.getID()%>"><%= item.getName()%></a></li>
                    <% } else if (i == domainList.size() - 1) {%>
                    <li class="last"><a href="./ServicesOffered?iddomainlist=<%= item.getID()%>"><%= item.getName()%></a></li>
                    <% } else {%>
                    <li><a href="./ServicesOffered?iddomainlist=<%= item.getID()%>"><%= item.getName()%></a></li>
                    <% }%>
                    <% }%>
                    <% }%>
                </ul>
            </li>
            <li><a href="./AboutUs" accesskey="4" title=""><span>About Us</span></a></li>
            <li><a href="./ContactUs" accesskey="5" title=""><span>Contact Us</span></a></li>
            <li><a href="./Feedback" accesskey="6" title=""><span>Feedback</span></a></li>
            <li><a href="./FAQ" accesskey="7" title=""><span>FAQ</span></a></li>
            <li>
                <%
                            if (user != null && Role.ADMINISTRATOR.toString().equals(user.getRole())) {
                %>
                <span>Administrator</span>
                <ul>
                    <li class="first"><a href="./CompanyInformation_SelectAll_Controller">Company Information</a></li>
                    <li><a href="./Users">User Management</a></li>
                    <li><span>Projects Management</span>
                        <ul>
                            <li class="first"><a href="./Projects?idps=<%= ProjectStatus.ON_GOING.toString()%>">On-Going Projects</a></li>
                            <li><a href="./Projects?idps=<%= ProjectStatus.UP_COMING.toString()%>">Up-Coming Projects</a></li>
                            <li class="last"><a href="./Projects?idps=<%= ProjectStatus.ACCOMPLISHED.toString()%>">Accomplished Projects</a></li>
                        </ul>
                    </li>
                    <li><a href="./DomainList_SelectAll_Controller">Domain List</a></li>
                    <li><span>Services Offered Management</span>
                        <ul>
                            <%
                                                            if (domainList != null) {
                                                                for (int i = 0; i < domainList.size(); i++) {
                                                                    DomainListDTO item = domainList.get(i);
                            %>
                            <% if (i == 0) {%>
                            <li class="first"><a href="./ServicesOffered_SelectByIDDomainList_Controller?iddomainlist=<%= item.getID()%>"><%= item.getName()%></a></li>
                            <% } else if (i == domainList.size() - 1) {%>
                            <li><a href="./ServicesOffered_SelectByIDDomainList_Controller?iddomainlist=<%= item.getID()%>"><%= item.getName()%></a></li>
                            <% } else {%>
                            <li class="last"><a href="./ServicesOffered_SelectByIDDomainList_Controller?iddomainlist=<%= item.getID()%>"><%= item.getName()%></a></li>
                            <% }%>
                            <% }%>
                            <% }%>
                        </ul>
                    </li>
                    <li><a href="./FeedBacks_SelectAll_Controller">Feedback Management</a></li>
                    <li><a href="./ServiceRequests_SelectAll_Controller">Service Requests Management</a></li>
                    <li><a href="./Bills_SelectAll_Controller">Bills Management</a></li>
                    <li class="last"><a href="./FAQ_SelectAll_Controller">FAQ Management</a></li>
                </ul>
                <%}%>
            </li>
        </ul>
    </div>
</div>