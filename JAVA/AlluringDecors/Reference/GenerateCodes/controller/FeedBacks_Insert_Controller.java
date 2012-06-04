package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.FeedBacksDAO;
import com.alluringdecors.ejb.dto.FeedBacksDTO;
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

@WebServlet(name = "FeedBacks_Insert_Controller", urlPatterns = {"/FeedBacks_Insert_Controller"})
public class FeedBacks_Insert_Controller extends BaseController {

	@EJB FeedBacksDAO bean;

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
			FeedBacksDTO item = new FeedBacksDTO();
			item.setTiitle((String)request.getParameter("Tiitle"));
			item.setContent((String)request.getParameter("Content"));
			item.setFullName((String)request.getParameter("FullName"));
			item.setEmail((String)request.getParameter("Email"));
			item.setPostDate(string(request.getParameter("PostDate")));
			item.setIsReplied(Boolean.parseBoolean(request.getParameter("IsReplied")));

			boolean kq = bean.insert(item);

			if (kq == true) {
				request.setAttribute("Message", "Insert successfully");
			} else{
				request.setAttribute("Message", "Insert failed");
			}

			String url = "/views/admin/SelectFeedBacks.jsp";
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