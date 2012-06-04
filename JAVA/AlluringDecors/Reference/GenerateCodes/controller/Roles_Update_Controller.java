package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.RolesDAO;
import com.alluringdecors.ejb.dto.RolesDTO;
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

@WebServlet(name = "Roles_Update_Controller", urlPatterns = {"/Roles_Update_Controller"})
public class Roles_Update_Controller extends BaseController {

	@EJB RolesDAO bean;

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
			RolesDTO item = new RolesDTO();
			item.setID(Integer.parseInt(request.getParameter("ID")));
			item.setName((String)request.getParameter("Name"));

			boolean kq = bean.update(item);

			if (kq == true) {
				request.setAttribute("Message", "Update successfully");
			} else{
				request.setAttribute("Message", "Update failed");
			}

			String url = "/views/admin/SelectRoles.jsp";
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
