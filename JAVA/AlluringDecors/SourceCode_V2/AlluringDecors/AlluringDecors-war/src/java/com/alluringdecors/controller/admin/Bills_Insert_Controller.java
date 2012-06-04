package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.BillsDAO;
import com.alluringdecors.ejb.dto.BillsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Bills_Insert_Controller", urlPatterns = {"/Bills_Insert_Controller"})
public class Bills_Insert_Controller extends BaseController {

    @EJB
    BillsDAO bean;

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
            BillsDTO item = new BillsDTO();

            item.setIDServiceRequest(Integer.parseInt(request.getParameter("IDServiceRequest")));
            item.setDatePaid(new Date());

            double totalPaid = Double.parseDouble(request.getParameter("TotalPaidAmount"));
            double paidAmount = Double.parseDouble(request.getParameter("PaidAmount"));

            item.setTotalPaidAmount(totalPaid);

            if (paidAmount > totalPaid) {
                item.setDueAmount(paidAmount - totalPaid);
                item.setBalanceAmount(0.0);
            } else if (paidAmount < totalPaid) {
                item.setDueAmount(0.0);
                item.setBalanceAmount(totalPaid - paidAmount);
            } else {
                item.setDueAmount(0.0);
                item.setBalanceAmount(0.0);
            }

            boolean kq = bean.insert(item);

            if (kq == true) {
                request.setAttribute("Message", "Insert successfully");
            } else {
                request.setAttribute("Message", "Insert failed");
            }

            String url = "/views/admin/SelectBills.jsp";
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
