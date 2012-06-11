package com.alluringdecors.controller.home;

import com.alluringdecors.common.CommonHelpers;
import com.alluringdecors.common.EMailHelper;
import com.alluringdecors.common.WebConfig;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.UserDAO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ResetPasswordController", urlPatterns = {"/ResetPassword"})
public class ResetPasswordController extends BaseController {

    @EJB
    UserDAO userBean;

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
            UserDTO selectUser = null;
            boolean isMailValid = false;
            String website = WebConfig.getValue(WebConfig.WEBSITE);
            String emailAddress = request.getParameter("Email");

            // Checking if input email is valid
            List<UserDTO> ds = userBean.selectAll();

            for (UserDTO userDTO : ds) {
                if (userDTO.getEmail().toUpperCase().equals(emailAddress.toUpperCase())) {
                    selectUser = userDTO;
                    isMailValid = true;
                    break;
                }
            }

            // Mail is exist, sent an email to input address
            if (isMailValid) {
                // Generate random email
                String randomStr = GenerateRandomCharacters(10);
                String bakEmail = selectUser.getPassword();
                selectUser.setPassword(randomStr);

                if (userBean.update(selectUser)) {
                    String servletPath = request.getRealPath("/") + "\\views\\templates\\ResetPasswordTemplate.jsp";
                    String mailTemplate = CommonHelpers.getHTML(servletPath);
                    mailTemplate = mailTemplate.replace("[NewPassword]", randomStr);
                    mailTemplate = mailTemplate.replace("[Website]", website);
                    
                    if (EMailHelper.sendingMail("Reset password in " + website, mailTemplate, emailAddress)) {
                        request.setAttribute("Message", "Your password has been reset, please retrieve new password on your email.");
                    }else{
                        selectUser.setPassword(bakEmail);
                        request.setAttribute("Message", "Cannot reset your password, please try it again");
                    }        
                } else {
                    request.setAttribute("Message", "Cannot reset your password, please try it again");
                }

            } else {
                request.setAttribute("Message", "Your input email is not exist, please try it again.");
            }

            String url = "/views/home/ForgotPassword.jsp";
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

    private String GenerateRandomCharacters(int size) {
        Random random = new Random(19580427);
        StringBuilder builder = new StringBuilder();
        char ch;
        for (int i = 0; i < size; i++) {
            ch = (char) ((int) (Math.floor(26 * random.nextDouble() + 65)));
            builder.append(ch);
        }

        return builder.toString();
    }
}
