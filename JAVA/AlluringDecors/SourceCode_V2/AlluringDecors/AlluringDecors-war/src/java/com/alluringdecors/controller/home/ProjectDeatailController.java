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
public class ProjectDeatailController extends BaseController
{
    @EJB
    private ProjectsDAO proejctBean;

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
	    int id = Integer.parseInt(request.getParameter("id"));
	    ProjectsDTO proejct = proejctBean.selectById(id);

	    request.setAttribute("ProjectsDTO", proejct);
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/views/home/ProjectDetail.jsp");
            rd.forward(request, response);
	}
	catch(Exception ex)
	{
	    out.print("ProjectDeatailController Client error " + ex.getLocalizedMessage());
	}
	finally
	{
	    out.close();
	}
    }
}
