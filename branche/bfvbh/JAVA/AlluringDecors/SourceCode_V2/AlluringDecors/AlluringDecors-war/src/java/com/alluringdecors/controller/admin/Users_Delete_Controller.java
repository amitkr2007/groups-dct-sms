/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class Users_Delete_Controller extends BaseController {

    @EJB
    private UserDAO userBean;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean result = userBean.delete(id);
            if (result) {
                String url = "./Users";
                response.sendRedirect(url);
            } else {
                String url = "/view/admin/SelectUsers.jsp";
                request.setAttribute("error", "Cannot delete user have id equal " + id);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception ex) {
            out.print(ex.getStackTrace());
        } finally {
            out.close();
        }
    }
}
