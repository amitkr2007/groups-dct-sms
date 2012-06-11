package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.UserDAO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Users_Update_Controller", urlPatterns = {"/Users_Update_Controller"})
public class Users_Update_Controller extends BaseController {

    @EJB
    UserDAO bean;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            UserDTO item = bean.selectById(Integer.parseInt(request.getParameter("id")));

            item.setName((String) request.getParameter("name"));
            item.setAddress((String) request.getParameter("address"));
            item.setPhone((String) request.getParameter("phone"));
            item.setEmail((String) request.getParameter("email"));
            item.setSex(Boolean.parseBoolean(request.getParameter("sex")));
            item.setStartDate(new Date());

            boolean kq = bean.update(item);

            if (kq) {
                request.setAttribute("Message", "Update successfully");
            } else {
                request.setAttribute("Message", "Update failed");
            }

            ArrayList<UserDTO> ds = bean.selectAll();
            request.setAttribute("UsersList", ds);
            
            String url = "/views/admin/SelectUsers.jsp";
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception ex) {
            out.println(ex.getMessage());
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
