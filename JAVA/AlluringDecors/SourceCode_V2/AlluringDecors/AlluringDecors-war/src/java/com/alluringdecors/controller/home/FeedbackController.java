package com.alluringdecors.controller.home;

import com.alluringdecors.controller.base.BaseController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FeedbackController", urlPatterns = {"/Feedback"})
public class FeedbackController extends BaseController {
    
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
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
