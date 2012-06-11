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

@WebServlet(name = "RemoveFromCartController", urlPatterns = {"/RemoveFromCart"})
public class RemoveFromCartController extends BaseController {

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
            // Retrieve Id of service info will be added to cart
            int idServiceOffred = Integer.parseInt(request.getParameter("idserviceoffred"));

            ShoppingCart ObjShoppingCart = null;
            // Shopping cart is not created
            if (session.getAttribute("ShoppingCart") == null) {
                ObjShoppingCart = new ShoppingCart();
            } else {
                // Created Shopping cart
                ObjShoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
            }
            AtomicReference<ShoppingCartItem> refItem = new AtomicReference<ShoppingCartItem>();
            ShoppingCartItem item = null;
            if (isServiceOfferedExistInCart(ObjShoppingCart.getCart(), idServiceOffred, refItem)) {
                ObjShoppingCart.getCart().remove(refItem.get());
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

    public boolean isServiceOfferedExistInCart(ArrayList<ShoppingCartItem> Cart, int idServiceOffered, AtomicReference<ShoppingCartItem> item) {
        if (Cart.isEmpty()) {
            return false;
        }
        for (int i = 0; i < Cart.size(); i++) {
            if (Cart.get(i).getIdServiceOffered() == idServiceOffered) {
                item.set(Cart.get(i));
                return true;
            }
        }
        return false;
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
