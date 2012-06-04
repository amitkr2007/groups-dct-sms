package com.alluringdecors.controller.admin;

import com.alluringdecors.common.CommonHelpers;
import com.alluringdecors.common.EMailHelper;
import com.alluringdecors.common.WebConfig;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.FeedBacksDAO;
import com.alluringdecors.ejb.dao.RepliesDAO;
import com.alluringdecors.ejb.dto.FeedBacksDTO;
import com.alluringdecors.ejb.dto.RepliesDTO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Replies_Insert_Controller", urlPatterns = {"/Replies_Insert_Controller"})
public class Replies_Insert_Controller extends BaseController {

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
            int idfeedback = Integer.parseInt(request.getParameter("IDFeedBack"));
            // Get current session
            HttpSession session = request.getSession(true);
            UserDTO customer = ((UserDTO) session.getAttribute("UserInfo"));

            if (customer != null) {
                FeedBacksDTO feedback = bean.selectById(idfeedback);

                RepliesDTO item = new RepliesDTO();
                item.setIDFeedBack(idfeedback);
                item.setReplyContent((String) request.getParameter("ReplyContent"));
                item.setReplyName(customer.getName());
                item.setReplyDate(new Date());

                String servletPath = request.getRealPath("/") + "\\views\\templates\\ReplyEmailTemplate.jsp";
                String mailTemplate = CommonHelpers.getHTML(servletPath);
                mailTemplate = mailTemplate.replace("[Title]", feedback.getTiitle());
                mailTemplate = mailTemplate.replace("[Content]", feedback.getContent());
                mailTemplate = mailTemplate.replace("[ReplyContent]", item.getReplyContent());
                mailTemplate = mailTemplate.replace("[Website]", WebConfig.getValue(WebConfig.WEBSITE));

                // Sent email successfully
                if (EMailHelper.sendingMail("Reply feedback from " + WebConfig.getValue(WebConfig.WEBSITE), mailTemplate, feedback.getEmail())) {
                    // Insert reply to db
                    boolean kq = replyBean.insert(item);
                    if (kq == true) {
                        request.setAttribute("Message", "Reply successfully");
                    } else {
                        request.setAttribute("Message", "Reply failed");
                    }
                } else {
                    request.setAttribute("Message", "Reply failed.");
                }

                List<RepliesDTO> lstReplies = replyBean.selectByIDFeedBack(idfeedback);

                request.setAttribute("FeedBacksDTO", feedback);
                request.setAttribute("RepliesDTOs", lstReplies);
            }
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
