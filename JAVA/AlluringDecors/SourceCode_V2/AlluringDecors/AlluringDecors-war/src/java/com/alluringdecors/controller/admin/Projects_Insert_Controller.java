package com.alluringdecors.controller.admin;

import com.alluringdecors.common.CommonHelpers;
import com.alluringdecors.common.HolderHepler;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.ProjectsDAO;
import com.alluringdecors.ejb.dto.ProjectsDTO;
import com.alluringdecors.ejb.dto.ServicesOfferedDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Scanner;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class Projects_Insert_Controller extends BaseController {

    @EJB
    ProjectsDAO bean;

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
            ProjectsDTO item = new ProjectsDTO();

            // read filename which is sent as a part
            Part p2 = request.getPart("IDServiceRequest");
            Scanner s = new Scanner(p2.getInputStream());
            String IDServiceRequest = s.nextLine();
            item.setIDServiceRequest(Integer.parseInt(IDServiceRequest));

            p2 = request.getPart("ProjectStatus");
            s = new Scanner(p2.getInputStream());
            String ProjectStatus = s.nextLine();
            item.setProjectStatus(ProjectStatus);

            p2 = request.getPart("Name");
            s = new Scanner(p2.getInputStream());
            if (s.hasNext()) {
                String Name = s.nextLine();
                item.setName(Name);
            }

            p2 = request.getPart("Description");
            s = new Scanner(p2.getInputStream());
            String Description = "";
            while (s.hasNext()) {
                Description += s.nextLine();
            }
            if (!"".equals(Description)) {
                item.setDescription(Description);
            }

            p2 = request.getPart("BriefDescription");
            s = new Scanner(p2.getInputStream());
            if (s.hasNext()) {
                String BriefDescription = s.nextLine();
                item.setBriefDescription(CommonHelpers.Truncate(BriefDescription, 300));
            }

	    p2 = request.getPart("Image");
	    HolderHepler hold = new HolderHepler();
	    if (CommonHelpers.uploadFile(request, p2, "", hold)) {
		// Upload successfull, then upload image in database
		item.setImage((String) hold.getValue());
		request.setAttribute("message", "Insert successfully");
	    } else {
		request.setAttribute("message", "Cannot upload file");
	    }

            boolean kq = bean.insert(item);

            if (kq == true) {
		request.setAttribute("message", "Insert successfully");
                response.sendRedirect("./Projects?idps=" + item.getProjectStatus());
            } else {
                request.setAttribute("message", "Insert failed");
                String url = "/views/admin/SelectProjects.jsp";
                ServletContext sc = getServletContext();
                RequestDispatcher rd = sc.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        } catch (Exception ex) {
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
