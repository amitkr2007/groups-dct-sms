<%--
    Document   : index
    Created on : May 13, 2012, 09:40:48 AM
    Author     : Administrator
--%>


<%@page import="com.alluringdecors.common.ShoppingCartItem"%>
<%@page import="com.alluringdecors.common.CommonHelpers"%>
<%@page import="com.alluringdecors.ejb.dto.ServicesOfferedDTO"%>
<%@page import="com.alluringdecors.ejb.dto.DomainListDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    double totalPay = 0;
    double totalCash = 0;
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
        <link href="contents/InfoItem.css" rel="stylesheet" type="text/css" media="all" />
        <link href="contents/InfoList.css" rel="stylesheet" type="text/css" media="all" />
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
			if($("#Location").val() == ''){
			    $("#LocationErrMsg").html("Location is required");
			    hasError = true;
			}
			else{
			    $("#LocationErrMsg").html("");
			}

			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			if(!emailReg.test($("#EmailLocation").val())) {
			    $("#EmailLocationErrMsg").html("Enter a valid email address.");
			    hasError = true;
			}
			else {
			    $("#EmailLocationErrMsg").html("");
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
                    <h2>View Your Cart</h2>
                    <% if (session.getAttribute("ShoppingCart") == null || ((ShoppingCart) session.getAttribute("ShoppingCart")).getCart().size() == 0) {%>
                    Nothing in your cart
                    <% } else {
                        ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
                    %>
                    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                        <tr>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">No.</a></th>
                            <th class="table-header-repeat line-left minwidth-1"><a href="">Name</a></th>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Quantity</a></th>
                            <th class="table-header-repeat line-left" style="text-align: center;"><a href="">Price</a></th>
                            <th class="table-header-repeat line-left"></th>
                        </tr>
                        <%
                            if (cart != null) {
                                for (int i = 0; i < cart.getCart().size(); i++) {
                                    ShoppingCartItem item = cart.getCart().get(i);
                                    totalPay = (item.getQuantity() * item.getServicesOffered().getPrice());
                                    totalCash += totalPay;
                        %>
                        <tr>
                            <td style="text-align: center;"><%= i + 1%></td>
                            <td><a href="./DetailOfServicesOffered?id=<%= item.getServicesOffered().getID()%>"><%= item.getServicesOffered().getName()%></a></td>
                            <td style="text-align: center;">
                                <script type="text/javascript">
                                    function ReCalcOrder(itemid) {
                                        var num = document.getElementsByName("NumItem" + itemid).item(0);
                                        window.location.href = "./AddToCart?idserviceoffred=" + itemid + "&num=" + num.value;
                                    }
                                </script>
                                <input type="text" name="NumItem<%= item.getIdServiceOffered()%>" value="<%= item.getQuantity()%>" style="width:25px;font-size:10px;text-align:center;" maxlength="2" onkeyup='ReCalcOrder(<%= item.getIdServiceOffered()%>);'>
                            </td>
                            <td style="text-align: center;"><%= item.getServicesOffered().getPrice()%></td>
                            <td class="options-width">
                                <a href="./RemoveFromCart?idserviceoffred=<%= item.getServicesOffered().getID()%>" title="Delete" class="icon-2 info-tooltip"></a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                    <h2>Request Detail</h2>
                    <form action="./Request" method="post">
                        <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                            <tr>
                                <th valign="top">Total cash</th>
                                <td>
                                    <span style="font-weight: bold; color: red;">$<%= totalCash%></span>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th valign="top">Location</th>
                                <td>
                                    <input type="text" name="Location" id="Location" style="width: 500px;" />
                                </td>
                                <td>
				    <label class="error-msg" id="LocationErrMsg"></label>
				</td>
                            </tr>
                            <tr>
                                <th valign="top">Phone's Location</th>
                                <td>
                                    <input type="text" name="PhoneLocation" style="width: 200px;" />
                                </td>
                                <td>

				</td>
                            </tr>
                            <tr>
                                <th valign="top">Email's Location</th>
                                <td>
                                    <input type="text" name="EmailLocation" id="EmailLocation" style="width: 200px;" />
                                </td>
                                <td>
				    <label class="error-msg" id="EmailLocationErrMsg"></label>
				</td>
                            </tr>
                            <tr>
                                <th valign="top">Note</th>
                                <td>
                                    <textarea name="Note" style="width: 500px; height: 80px;"></textarea>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th>&nbsp;</th>
                                <td valign="top">
                                    <input type="submit" id="submit" value="" class="form-request" />
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </form>
                    <% }%>
                </div>
            </div>
            <!-- END MAIN CONTENT -->

            <!-- START FOOTER -->
            <div id="footer">
                <%@include file="../templates/UC_Footer.jsp" %>
            </div>
            <!-- END FOOTER -->
        </div>
    </body>
</html>
