package com.alluringdecors.controller.admin;

import com.alluringdecors.common.CommonHelpers;
import com.alluringdecors.common.HolderHepler;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.ProjectsDAO;
import com.alluringdecors.ejb.dto.ProjectsDTO;
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

public class Projects_Update_Controller extends BaseController {

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
            Part p2 = request.getPart("ID");
            Scanner s = new Scanner(p2.getInputStream());
            String id = s.nextLine();
            
            ProjectsDTO item = bean.selectById(Integer.parseInt(id));


            p2 = request.getPart("IDServiceRequest");
            s = new Scanner(p2.getInputStream());
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

            p2 = request.getPart("StartDate");
            s = new Scanner(p2.getInputStream());
            String StartDate = s.nextLine();
            item.setStartDate(new Date(StartDate));
            
            boolean kq = bean.update(item);

            if (kq == true) {
                // Upload Image file
                HolderHepler hold = new HolderHepler();
                Part part = request.getPart("Image");
                if (CommonHelpers.uploadFile(request, part, item.getImage(), hold)) {
                    // Upload successfull, then upload image in database
                    item.setImage((String) hold.getValue());
                    bean.update(item);
                    request.setAttribute("Message", "Update successfully");
                } else {
                    request.setAttribute("Message", "Cannot upload file");
                }

                ProjectsDTO project = bean.selectById(item.getID());
                request.setAttribute("project", project);
                request.setAttribute("action", "Edit");
                String url = "/views/admin/ProjectDetail.jsp";
                ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		rd.forward(request, response);
            } else {
                request.setAttribute("Message", "Update failed");
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
