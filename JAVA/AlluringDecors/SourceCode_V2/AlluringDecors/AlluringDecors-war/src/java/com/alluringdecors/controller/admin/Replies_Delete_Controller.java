package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.FeedBacksDAO;
import com.alluringdecors.ejb.dao.RepliesDAO;
import com.alluringdecors.ejb.dto.FeedBacksDTO;
import com.alluringdecors.ejb.dto.RepliesDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Replies_Delete_Controller", urlPatterns = {"/Replies_Delete_Controller"})
public class Replies_Delete_Controller extends BaseController {

    @EJB
    FeedBacksDAO bean;
    @EJB
    RepliesDAO replyBean;

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
            int idfeedback = Integer.parseInt(request.getParameter("idfeedback"));
            boolean kq = replyBean.delete(id);

            if (kq == true) {
                request.setAttribute("Message", "Delete successfully");
            } else {
                request.setAttribute("Message", "Delete failed");
            }

            FeedBacksDTO ds = bean.selectById(idfeedback);
            List<RepliesDTO> lstReplies = replyBean.selectByIDFeedBack(idfeedback);

            request.setAttribute("FeedBacksDTO", ds);
            request.setAttribute("RepliesDTOs", lstReplies);

            String url = "/views/admin/DetailOfFeedback.jsp";
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
