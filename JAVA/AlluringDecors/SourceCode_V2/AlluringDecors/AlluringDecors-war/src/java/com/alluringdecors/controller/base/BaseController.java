/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.controller.base;

import com.alluringdecors.ejb.dao.DomainListDAO;
import com.alluringdecors.ejb.dto.DomainListDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class BaseController extends HttpServlet {

    @EJB
    DomainListDAO beanDomainList;

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //System.out.printf("Inplement base controller");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	setGeneralData(request, response);
        processRequest(request, response);
    }

    /*
     * All of general data which is used for all of pages will be retrieved at here
     */
    private void setGeneralData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Default all of pages must be get DomainList
        ArrayList<DomainListDTO> ds = beanDomainList.selectAll();
        request.setAttribute("DomainListDTOs", ds);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	setGeneralData(request, response);
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
