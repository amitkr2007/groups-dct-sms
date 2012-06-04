package com.alluringdecors.controller.admin;

import com.alluringdecors.common.CommonHelpers;
import com.alluringdecors.common.Role;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.UserDAO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Users_Insert_Controlle extends BaseController {

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
            UserDTO item = new UserDTO();
            item.setID(Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id")));
            item.setRole(request.getParameter("role"));
            item.setUserName((String) request.getParameter("username"));
            item.setPassword((String) request.getParameter("password"));
            item.setName((String) request.getParameter("name"));
            item.setAddress((String) request.getParameter("address"));
            item.setPhone((String) request.getParameter("phone"));
            item.setEmail((String) request.getParameter("email"));

            String date = request.getParameter("brithday");
            item.setBirthday(CommonHelpers.parseDate(date));

            item.setSex(Boolean.parseBoolean(request.getParameter("sex")));

            item.setStartDate(new Date());

            // Get list of user in db
            List<UserDTO> lstUsers = bean.selectAll();
            boolean isExist = false;
            for (UserDTO object : lstUsers) {
                if (object.getUserName().equals(item.getUserName())) {
                    isExist = true;
                    break;
                }
            }
            // If user is existent, show error message for user
            if (isExist) {
                request.setAttribute("Message", "Input username is existent in database");
                String url = "/views/home/Register.jsp";
                ServletContext sc = getServletContext();
                RequestDispatcher rd = sc.getRequestDispatcher(url);
                rd.forward(request, response);
                return;
            }
            boolean kq = bean.insert(item);

            if (kq == true) {
                if (Role.ADMINISTRATOR.toString().equals(item.getRole())) {
                    request.setAttribute("Message", "Insert successfully");
                    response.sendRedirect("./Users");
                } else {
                    request.setAttribute("Message", "You have registered successful");
                    String url = "/views/home/Register.jsp";
                    ServletContext sc = getServletContext();
                    RequestDispatcher rd = sc.getRequestDispatcher(url);
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("Message", "Insert failed");
                String url = "/views/admin/SelectUsers.jsp";
                ServletContext sc = getServletContext();
                RequestDispatcher rd = sc.getRequestDispatcher(url);
                rd.forward(request, response);
            }
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
