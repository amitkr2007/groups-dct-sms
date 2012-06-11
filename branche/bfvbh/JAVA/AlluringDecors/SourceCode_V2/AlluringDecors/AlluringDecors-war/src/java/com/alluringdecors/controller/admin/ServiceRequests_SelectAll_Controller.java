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

@WebServlet(name = "ServiceRequests_SelectAll_Controller", urlPatterns = {"/ServiceRequests_SelectAll_Controller"})
public class ServiceRequests_SelectAll_Controller extends BaseController {

    @EJB
    ServiceRequestsDAO bean;
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
            List<ServiceRequestsDTO> ds = bean.selectAll();

            for (ServiceRequestsDTO serviceRequestsDTO : ds) {
                // Set is project creared
                serviceRequestsDTO.setProjectCreated(false);
                List<ProjectsDTO> lstPrj = prjBean.selectByIDServiceRequest(serviceRequestsDTO.getID());
                if(lstPrj.size() > 0){
                    serviceRequestsDTO.setProjectCreated(true);
                }
                
                // Set is bill creared
                serviceRequestsDTO.setBillCreated(false);
                List<BillsDTO> lstBills = billBean.selectByIDServiceRequest(serviceRequestsDTO.getID());
                if(lstBills.size() > 0){
                    serviceRequestsDTO.setBillCreated(true);
                }
            }

            request.setAttribute("ServiceRequestsDTOs", ds);

            String url = "/views/admin/SelectServiceRequests.jsp";
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
