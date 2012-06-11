package com.alluringdecors.controller.admin;

import com.alluringdecors.common.RequestStatus;
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

@WebServlet(name = "ServiceRequests_Update_Controller", urlPatterns = {"/ServiceRequests_Update_Controller"})
public class ServiceRequests_Update_Controller extends BaseController {

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
            ServiceRequestsDTO item = bean.selectById(Integer.parseInt(request.getParameter("ID")));
            item.setRequestStatus((String) request.getParameter("RequestStatus"));

            // Set is bill creared
            item.setBillCreated(false);
            List<BillsDTO> lstBills = billBean.selectByIDServiceRequest(item.getID());
            if (lstBills.size() > 0) {
                item.setBillCreated(true);
            }

            // Update service request details
            List<ServiceRequestDetailDTO> lstSvRqtDt = svDtbean.selectByIDServiceRequest(item.getID());
            item.setServiceRequestDetail(lstSvRqtDt);

            boolean isPermission = false;

            if (!item.isBillCreated()) {
                if (item.getRequestStatus().equals(RequestStatus.PAYMENT_RECEIVED.toString()) || item.getRequestStatus().equals(RequestStatus.SERVICE_BEGAN.toString()) || item.getRequestStatus().equals(RequestStatus.SERVICE_COMPLETED.toString())) {
                    request.setAttribute("Message", "Cannot update " + item.getRequestStatus() + " status of this service request when it's bill has not been created");
                } else {
                    isPermission = true;
                }
            } else {
                if (item.getRequestStatus().equals(RequestStatus.REJECTED.toString()) || item.getRequestStatus().equals(RequestStatus.REQUEST_RECEIVED.toString())) {
                    request.setAttribute("Message", "Cannot update " + item.getRequestStatus() + " status of this service request when it's bill has been created");
                } else {
                    isPermission = true;
                }
            }

            if (isPermission) {
                boolean kq = bean.update(item);

                if (kq == true) {
                    request.setAttribute("Message", "Update successfully");
                } else {
                    request.setAttribute("Message", "Update failed");
                }
            }
            // Select all of service request
            List<ServiceRequestsDTO> ds = bean.selectAll();

            for (ServiceRequestsDTO serviceRequestsDTO : ds) {
                // Set is project creared
                serviceRequestsDTO.setProjectCreated(false);
                List<ProjectsDTO> lstPrj = prjBean.selectByIDServiceRequest(serviceRequestsDTO.getID());
                if (lstPrj.size() > 0) {
                    serviceRequestsDTO.setProjectCreated(true);
                }
                // Set is bill creared
                serviceRequestsDTO.setBillCreated(false);
                lstBills = billBean.selectByIDServiceRequest(serviceRequestsDTO.getID());
                if (lstBills.size() > 0) {
                    serviceRequestsDTO.setBillCreated(true);
                }
            }

            request.setAttribute("ServiceRequestsDTOs", ds);
            request.setAttribute("ServiceRequestsDTO", item);

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
