package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.BillsDAO;
import com.alluringdecors.ejb.dao.ServiceRequestDetailDAO;
import com.alluringdecors.ejb.dao.ServiceRequestsDAO;
import com.alluringdecors.ejb.dto.BillsDTO;
import com.alluringdecors.ejb.dto.ServiceRequestDetailDTO;
import com.alluringdecors.ejb.dto.ServiceRequestsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Bills_SelectByID_Controller", urlPatterns = {"/Bills_SelectByID_Controller"})
public class Bills_SelectByID_Controller extends BaseController {

    @EJB
    BillsDAO bean;
    @EJB
    ServiceRequestsDAO svcRqtBean;
    @EJB
    ServiceRequestDetailDAO svDtbean;

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
            int id = Integer.parseInt(request.getParameter("id"));

            BillsDTO ds = bean.selectById(id);
            request.setAttribute("BillsDTO", ds);

            // Update service request details
            ServiceRequestsDTO obj = svcRqtBean.selectById(ds.getIDServiceRequest());
            List<ServiceRequestDetailDTO> lstSvRqtDt = svDtbean.selectByIDServiceRequest(obj.getID());
            obj.setServiceRequestDetail(lstSvRqtDt);

            request.setAttribute("ServiceRequestsDTO", obj);

            String url = "/views/admin/DetailOfBill.jsp";
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
