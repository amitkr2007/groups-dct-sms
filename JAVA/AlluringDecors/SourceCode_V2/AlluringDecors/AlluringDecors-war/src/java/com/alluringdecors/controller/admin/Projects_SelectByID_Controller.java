package com.alluringdecors.controller.admin;

import com.alluringdecors.common.ProjectStatus;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.ProjectsDAO;
import com.alluringdecors.ejb.dto.ProjectsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Projects_SelectByID_Controller extends BaseController {

	@EJB
	private ProjectsDAO projectBean;

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

		String idstr = request.getParameter("id");
		String serviceRequestId = request.getParameter("serviceRequestId");
		String url;
		if (idstr == null)
		{
		    ProjectsDTO projectobj = new ProjectsDTO();
		    projectobj.setProjectStatus(ProjectStatus.ON_GOING.toString());
		    int serviceRequestID = Integer.parseInt(serviceRequestId);
		    projectobj.setIDServiceRequest(serviceRequestID);
		    request.setAttribute("project", projectobj);
		    request.setAttribute("action", "Add");
		    request.setAttribute("serviceRequestId", serviceRequestId);
		    url = "/views/admin/ProjectDetail.jsp";
		}
		else
		{
		    int id = Integer.parseInt(idstr);
		    ProjectsDTO project = projectBean.selectById(id);
		    request.setAttribute("project", project);
		    request.setAttribute("action", "Edit");
		    url = "/views/admin/ProjectDetail.jsp";
		}
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
