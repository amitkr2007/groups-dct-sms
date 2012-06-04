package com.alluringdecors.controller.home;

import com.alluringdecors.common.ShoppingCart;
import com.alluringdecors.common.ShoppingCartItem;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.CompanyInformationDAO;
import com.alluringdecors.ejb.dao.ServicesOfferedDAO;
import com.alluringdecors.ejb.dto.CompanyInformationDTO;
import com.alluringdecors.ejb.dto.ServicesOfferedDTO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ViewCartController", urlPatterns = {"/ViewCart"})
public class ViewCartController extends BaseController {

    @EJB
    ServicesOfferedDAO bean;
    
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

            ShoppingCart ObjShoppingCart = null;
            // Shopping cart is not created
            if (session.getAttribute("ShoppingCart") == null) {
                ObjShoppingCart = new ShoppingCart();
            } else {
                // Created Shopping cart
                ObjShoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
            }
            
            session.setAttribute("ShoppingCart", ObjShoppingCart);
                        
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
