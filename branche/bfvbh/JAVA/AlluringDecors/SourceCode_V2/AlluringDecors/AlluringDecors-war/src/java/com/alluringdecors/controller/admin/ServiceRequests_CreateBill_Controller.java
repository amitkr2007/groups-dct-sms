package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.BillsDAO;
import com.alluringdecors.ejb.dao.ProjectsDAO;
import com.alluringdecors.ejb.dao.ServiceRequestDetailDAO;
import com.alluringdecors.ejb.dao.ServiceRequestsDAO;
import com.alluringdecors.ejb.dto.BillsDTO;
import com.alluringdecors.ejb.dto.ProjectsDTO;
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

@WebServlet(name = "ServiceRequests_CreateBill_Controller", urlPatterns = {"/ServiceRequests_CreateBill_Controller"})
public class ServiceRequests_CreateBill_Controller extends BaseController {

    @EJB
    ServiceRequestsDAO bean;
    @EJB
    ServiceRequestDetailDAO svDtbean;
    @EJB
    ProjectsDAO prjBean;
    @EJB
    BillsDAO billBean;

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
            // Select detail of service request
            int id = Integer.parseInt(request.getParameter("idservicerequest"));

            // Update service request details
            ServiceRequestsDTO obj = bean.selectById(id);
            List<ServiceRequestDetailDTO> lstSvRqtDt = svDtbean.selectByIDServiceRequest(obj.getID());
            obj.setServiceRequestDetail(lstSvRqtDt);

            request.setAttribute("ServiceRequestsDTO", obj);
            
            String url = "/views/admin/CreateBill.jsp";
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
