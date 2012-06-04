package com.alluringdecors.controller.admin;

import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.CompanyInformationDAO;
import com.alluringdecors.ejb.dto.CompanyInformationDTO;
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

@WebServlet(name = "CompanyInformation_Update_Controller", urlPatterns = {"/CompanyInformation_Update_Controller"})
public class CompanyInformation_Update_Controller extends BaseController {

	@EJB CompanyInformationDAO bean;

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
			CompanyInformationDTO item = new CompanyInformationDTO();
			item.setID(Integer.parseInt(request.getParameter("ID")));
			item.setAddress((String)request.getParameter("Address"));
			item.setPhone((String)request.getParameter("Phone"));
			item.setCompanyDescription((String)request.getParameter("CompanyDescription"));
			item.setServiceDescription((String)request.getParameter("ServiceDescription"));
			item.setBriefCompanyDescription((String)request.getParameter("BriefCompanyDescription"));
			item.setBriefServiceDescription((String)request.getParameter("BriefServiceDescription"));

			boolean kq = bean.update(item);

			if (kq == true) {
				request.setAttribute("Message", "Update successfully");
			} else{
				request.setAttribute("Message", "Update failed");
			}

			String url = "/views/admin/SelectCompanyInformation.jsp";
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