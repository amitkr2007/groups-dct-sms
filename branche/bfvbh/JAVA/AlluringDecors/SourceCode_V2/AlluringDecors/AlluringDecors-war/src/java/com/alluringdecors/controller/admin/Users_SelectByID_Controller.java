/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.UserDAO;
import com.alluringdecors.ejb.dto.UserDTO;
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
public class Users_SelectByID_Controller extends BaseController
{
    @EJB
    private UserDAO userBean;

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
	PrintWriter out = response.getWriter();
	try
	{
	    String idstr = request.getParameter("id");
	    String url;
	    if (idstr == null)
	    {
		request.setAttribute("user", new UserDTO());
		request.setAttribute("action", "Add");
		url = "/views/admin/UserDetail.jsp";
	    }
	    else
	    {
		int id = Integer.parseInt(idstr);
		UserDTO user = userBean.selectById(id);
		request.setAttribute("user", user);
		request.setAttribute("action", "Edit");
		url = "/views/admin/UserDetail.jsp";
	    }
	    ServletContext sc = getServletContext();
	    RequestDispatcher rd = sc.getRequestDispatcher(url);
	    rd.forward(request, response);
	}
	catch(Exception e)
	{
	    out.print(e.getLocalizedMessage());
	}
	finally
	{
	    out.close();
	}
    }
}
