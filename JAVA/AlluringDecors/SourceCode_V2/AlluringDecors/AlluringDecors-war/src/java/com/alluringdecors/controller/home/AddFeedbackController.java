package com.alluringdecors.controller.home;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.FeedBacksDAO;
import com.alluringdecors.ejb.dto.FeedBacksDTO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddFeedbackController", urlPatterns = {"/AddFeedback"})
public class AddFeedbackController extends BaseController {
    @EJB 
    FeedBacksDAO bean;
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
            String fullName = (String) request.getParameter("FullName");
            String email = (String) request.getParameter("Email");
            String title = (String) request.getParameter("Title");
            String content = (String) request.getParameter("Content");

            FeedBacksDTO dto = new FeedBacksDTO();
            dto.setFullName(fullName);
            dto.setEmail(email);
            dto.setTiitle(title);
            dto.setContent(content);
            dto.setIsReplied(false);
            dto.setPostDate(new Date());
            
            boolean kq = bean.insert(dto);
            
            if(kq){
                request.setAttribute("Message", "Your feedback has been sent, after considering we will reply for you.");
            }else{
                request.setAttribute("Message", "Cannot sent your feedback");
            }
            
            String url = "/views/home/Feedback.jsp";
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } finally {
            out.close();
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
