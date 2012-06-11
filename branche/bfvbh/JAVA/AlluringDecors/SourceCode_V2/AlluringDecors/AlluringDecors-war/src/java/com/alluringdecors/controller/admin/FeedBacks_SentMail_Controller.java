/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.FeedBacksDAO;
import com.alluringdecors.ejb.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class FeedBacks_SentMail_Controller extends BaseController {

   @EJB
    private FeedBacksDAO feedBack;
     
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ArrayList<String> obj = new ArrayList<String>();
            obj.add((String) request.getParameter("FeedBackID"));
            obj.add((String) request.getParameter("ReplyContent"));
            obj.add((String) request.getParameter("ReplyName"));
            obj.add((String) request.getParameter("Address"));
            UserDTO user = (UserDTO)request.getSession().getAttribute("UserInfo");
            boolean kq;
            try {
                kq = true;//feedBack.sendMail(obj,user);
                if (kq == true) {
                    request.setAttribute("Message", "Insert successfully");
                } else {
                    request.setAttribute("Message", "Insert failed");
                }
                String url = "/views/admin/FeedBacks.jsp";
                ServletContext sc = getServletContext();
                RequestDispatcher rd = sc.getRequestDispatcher(url);
                rd.forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(FeedBacks_SentMail_Controller.class.getName()).log(Level.SEVERE, null, ex);
            }

        } finally {            
            out.close();
        }
    }
}
