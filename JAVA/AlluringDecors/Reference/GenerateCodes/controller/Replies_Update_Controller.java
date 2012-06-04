package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.RepliesDAO;
import com.alluringdecors.ejb.dto.RepliesDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Replies_Update_Controller", urlPatterns = {"/Replies_Update_Controller"})
public class Replies_Update_Controller extends BaseController {

	@EJB RepliesDAO bean;

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
			RepliesDTO item = new RepliesDTO();
			item.setID(Integer.parseInt(request.getParameter("ID")));
			item.setIDFeedBack(Integer.parseInt(request.getParameter("IDFeedBack")));
			item.setReplyContent((String)request.getParameter("ReplyContent"));
			item.setReplyName((String)request.getParameter("ReplyName"));
			item.setReplyDate(string(request.getParameter("ReplyDate")));

			boolean kq = bean.update(item);

			if (kq == true) {
				request.setAttribute("Message", "Update successfully");
			} else{
				request.setAttribute("Message", "Update failed");
			}

			String url = "/views/admin/SelectReplies.jsp";
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request, response);
		}catch(Exception ex){
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
