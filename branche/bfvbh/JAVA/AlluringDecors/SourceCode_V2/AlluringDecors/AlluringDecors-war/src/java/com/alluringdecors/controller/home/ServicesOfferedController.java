package com.alluringdecors.controller.home;

//import com.alluringdecors.model.dao.CompanyInformationDAO;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.DomainListDAO;
import com.alluringdecors.ejb.dao.ServicesOfferedDAO;
import com.alluringdecors.ejb.dto.ServicesOfferedDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServicesOfferedController", urlPatterns = {"/ServicesOffered"})
public class ServicesOfferedController extends BaseController {

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
            int iddomainlist = Integer.parseInt(request.getParameter("iddomainlist"));

            ArrayList<ServicesOfferedDTO> ds = bean.selectByIDDomainList(iddomainlist);
            request.setAttribute("ServicesOfferedDTOs", ds);
            request.setAttribute("DomainListDTO", dmBean.selectById(iddomainlist));

            String url = "/views/home/ServicesOffered.jsp";
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
