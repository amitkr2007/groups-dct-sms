package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.DomainListDAO;
import com.alluringdecors.ejb.dto.DomainListDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DomainList_Insert_Controller", urlPatterns = {"/DomainList_Insert_Controller"})
public class DomainList_Insert_Controller extends BaseController {

    @EJB
    DomainListDAO bean;

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
            DomainListDTO item = new DomainListDTO();
            boolean isExist = false;
            item.setName((String) request.getParameter("Name"));

            List<DomainListDTO> lstDomainList = bean.selectAll();
            for (DomainListDTO domainListDTO : lstDomainList) {
                if (domainListDTO.getName().trim().equals(item.getName().trim())) {
                    isExist = true;
                    break;
                }
            }

            if (isExist) {
                request.setAttribute("Message", "This domain is existent in database");
            } else {
                boolean kq = bean.insert(item);
                request.setAttribute("DomainListDTOs", lstDomainList);

                if (kq) {
                    request.setAttribute("Message", "Insert successfully");
                } else {
                    request.setAttribute("Message", "Insert failed");
                }
            }

            String url = "/views/admin/SelectDomainList.jsp";
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