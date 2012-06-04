/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.controller.home;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.ProjectsDAO;
import com.alluringdecors.ejb.dto.ProjectsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class ProjectController extends BaseController
{
    @EJB
    private ProjectsDAO projectBean;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException
    {
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	try
	{
	    String status = request.getParameter("Status");
	    ArrayList<ProjectsDTO> lstProjectgs = projectBean.selectByIDProjectStatus(status);

	    request.setAttribute("ListProjects", lstProjectgs);
            request.setAttribute("Status", status);
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/views/home/Projects.jsp");
            rd.forward(request, response);
	}
	catch(Exception ex)
	{
	    out.print("ProjectController Client error " + ex.getLocalizedMessage());
	}
	finally
	{
	    out.close();
	}
    }
}
