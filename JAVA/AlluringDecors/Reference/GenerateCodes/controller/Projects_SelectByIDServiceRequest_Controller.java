package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.ProjectsDAO;
import com.alluringdecors.ejb.dto.ProjectsDTO;
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

@WebServlet(name = "Projects_SelectByIDServiceRequest_Controller", urlPatterns = {"/Projects_SelectByIDServiceRequest_Controller"})
public class Projects_SelectByIDServiceRequest_Controller extends BaseController {

	@EJB ProjectsDAO bean;

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
			int idservicerequest = Integer.parseInt(request.getParameter("idservicerequest"));
			ArrayList<ProjectsDTO> ds = bean.selectByIDServiceRequest(idservicerequest);
			request.setAttribute("ProjectsDTOs", ds);
			String url = "/views/admin/SelectByIDServiceRequestProjects.jsp";
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
