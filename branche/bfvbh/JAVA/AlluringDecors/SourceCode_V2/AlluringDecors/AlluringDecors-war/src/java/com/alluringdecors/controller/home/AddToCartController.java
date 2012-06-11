package com.alluringdecors.controller.home;

import com.alluringdecors.common.ShoppingCart;
import com.alluringdecors.common.ShoppingCartItem;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.CompanyInformationDAO;
import com.alluringdecors.ejb.dao.DomainListDAO;
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

@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCart"})
public class AddToCartController extends BaseController {

    @EJB
    ServicesOfferedDAO bean;
    @EJB
    DomainListDAO dmBean;

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
            String url = "/views/home/DetailOfServicesOffered.jsp";
            int idServiceOffred = -1;

            // Get current session
            HttpSession session = request.getSession(true);
            // Get CustomerInfo session
            int idcustomer = ((UserDTO) session.getAttribute("UserInfo")).getID();

            // Retrieve Id of service info will be added to cart
            if (request.getParameter("idserviceoffred") != null) {
                idServiceOffred = Integer.parseInt(request.getParameter("idserviceoffred"));

                if (request.getParameter("num") == null) {
                    int iddomainlist = Integer.parseInt(request.getParameter("iddomainlist"));

                    ArrayList<ServicesOfferedDTO> ds = bean.selectByIDDomainList(iddomainlist);
                    request.setAttribute("ServicesOfferedDTOs", ds);
                    request.setAttribute("DomainListDTO", dmBean.selectById(iddomainlist));

                    url = "/views/home/ServicesOffered.jsp";
                }
            } else if (request.getParameter("idserviceoffred2") != null) {
                idServiceOffred = Integer.parseInt(request.getParameter("idserviceoffred2"));
                ServicesOfferedDTO ds = bean.selectById(idServiceOffred);
                request.setAttribute("ServicesOfferedDTO", ds);
            }

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
                // Update exist item
                item = refItem.get();
                if (request.getParameter("num") == null) {
                    item.setQuantity(item.getQuantity() + 1);
                } else {
                    item.setQuantity(Integer.parseInt(request.getParameter("num")));
                    url = "/views/home/ViewCart.jsp";
                }
            } else {
                // Insert new item
                item = new ShoppingCartItem();
                item.setIdCustomer(idcustomer);
                item.setIdServiceOffered(idServiceOffred);
                item.setQuantity(1);
                item.setServicesOffered(bean.selectById(idServiceOffred));

                ObjShoppingCart.getCart().add(item);
            }

            session.setAttribute("ShoppingCart", ObjShoppingCart);

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
