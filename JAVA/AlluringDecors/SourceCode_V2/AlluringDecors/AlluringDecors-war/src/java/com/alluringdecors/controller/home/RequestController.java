package com.alluringdecors.controller.home;

import com.alluringdecors.common.RequestStatus;
import com.alluringdecors.common.ShoppingCart;
import com.alluringdecors.common.ShoppingCartItem;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.CompanyInformationDAO;
import com.alluringdecors.ejb.dao.ServiceRequestDetailDAO;
import com.alluringdecors.ejb.dao.ServiceRequestsDAO;
import com.alluringdecors.ejb.dao.ServicesOfferedDAO;
import com.alluringdecors.ejb.dto.CompanyInformationDTO;
import com.alluringdecors.ejb.dto.ServiceRequestDetailDTO;
import com.alluringdecors.ejb.dto.ServiceRequestsDTO;
import com.alluringdecors.ejb.dto.ServicesOfferedDTO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.atomic.AtomicReference;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RequestController", urlPatterns = {"/Request"})
public class RequestController extends BaseController {

    @EJB
    ServicesOfferedDAO bean;
    @EJB
    ServiceRequestsDAO svcRqBean;
    @EJB
    ServiceRequestDetailDAO svcRqDtBean;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // Get current session
            HttpSession session = request.getSession(true);

            UserDTO customer = ((UserDTO) session.getAttribute("UserInfo"));

            if (customer != null) {
                ShoppingCart ObjShoppingCart = null;

                // Shopping cart is not created
                if (session.getAttribute("ShoppingCart") == null) {
                    response.sendRedirect("index.jsp");
                    return;
                } else {
                    ObjShoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
                }
                if (ObjShoppingCart.getCart().isEmpty()) {
                    response.sendRedirect("index.jsp");
                    return;
                }

                // Insert new order
                ServiceRequestsDTO newRequest = new ServiceRequestsDTO();
                newRequest.setIDUser(customer.getID());
                newRequest.setRequestStatus(RequestStatus.REQUEST_RECEIVED.toString());
                newRequest.setRequestDate(new Date());
                newRequest.setLocation((String) request.getParameter("Location"));
                newRequest.setMailLocation((String) request.getParameter("EmailLocation"));
                newRequest.setPhoneLocation((String) request.getParameter("PhoneLocation"));
                newRequest.setNote((String) request.getParameter("Note"));

                // Insert new request
                boolean kq = svcRqBean.insert(newRequest);

                if (kq == true) {
                    // Insett request detail
                    for (int i = 0; i < ObjShoppingCart.getCart().size(); i++) {
                        // Get service offered
                        ServicesOfferedDTO svcOffered = bean.selectById(ObjShoppingCart.getCart().get(i).getIdServiceOffered());
                        // Create service request detail
                        ServiceRequestDetailDTO requestDetail = new ServiceRequestDetailDTO();
                        requestDetail.setIDServiceRequest(newRequest.getID());
                        requestDetail.setIDServiceOffered(svcOffered.getID());
                        requestDetail.setQuantity(ObjShoppingCart.getCart().get(i).getQuantity());
                        requestDetail.setPrice(svcOffered.getPrice());
                        requestDetail.setLocationRequest((String) request.getParameter("Location"));
                        // Insert request detail
                        svcRqDtBean.insert(requestDetail);
                    }
                    request.setAttribute("Message", "Your request have been sent, after verification we will feedback for you.");
                    session.setAttribute("ShoppingCart", null);
                } else {
                    request.setAttribute("Message", "There is any issues, we cannot receive your request");
                }
            }
            String url = "/views/home/ViewCart.jsp";
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
        } finally {
            out.close();
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
