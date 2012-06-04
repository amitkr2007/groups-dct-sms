package com.alluringdecors.controller.admin;

import com.alluringdecors.common.CommonHelpers;
import com.alluringdecors.common.HolderHepler;
import com.alluringdecors.controller.base.BaseController;
import com.alluringdecors.ejb.dao.DomainListDAO;
import com.alluringdecors.ejb.dao.ServicesOfferedDAO;
import com.alluringdecors.ejb.dto.DomainListDTO;
import com.alluringdecors.ejb.dto.ServicesOfferedDTO;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.ejb.EJB;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "ServicesOffered_Insert_Controller", urlPatterns = {"/ServicesOffered_Insert_Controller"})
@MultipartConfig
public class ServicesOffered_Insert_Controller extends BaseController {

    @EJB
    ServicesOfferedDAO bean;
    @EJB
    DomainListDAO dmBean;

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
            ServicesOfferedDTO item = new ServicesOfferedDTO();

            // read filename which is sent as a part
            Part p2 = request.getPart("IDDomainList");
            Scanner s = new Scanner(p2.getInputStream());
            String IDDomainList = s.nextLine();    // read filename from stream
            item.setIDDomainList(Integer.parseInt(IDDomainList));

            p2 = request.getPart("Name");
            s = new Scanner(p2.getInputStream());
            if (s.hasNext()) {
                String Name = s.nextLine();
                item.setName(Name);
            }

            p2 = request.getPart("Price");
            s = new Scanner(p2.getInputStream());
            if (s.hasNext()) {
                String Price = s.nextLine();
                item.setPrice(Double.parseDouble(Price));
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

            boolean isExist = false;
            List<ServicesOfferedDTO> lst = bean.selectAll();
            for (ServicesOfferedDTO servicesOfferedDTO : lst) {
                if (servicesOfferedDTO.getName().trim().equals(item.getName().trim())) {
                    isExist = true;
                }
            }

            if (isExist) {
                request.setAttribute("Message", "This service offred name is existent in database");
            } else {

                boolean kq = bean.insert(item);

                if (kq == true) {
                    //request.setAttribute("Message", "Insert successfully");
                    // Upload Image file
                    HolderHepler hold = new HolderHepler();
                    Part part = request.getPart("Image");
                    if (CommonHelpers.uploadFile(request, part, "", hold)) {
                        // Upload successfull, then upload image in database
                        item.setImage((String) hold.getValue());
                        bean.update(item);
                        request.setAttribute("Message", "Insert successfully");
                    } else {
                        request.setAttribute("Message", "Cannot upload file");
                    }
                } else {
                    request.setAttribute("Message", "Insert failed");
                }
            }

            // Select a domain
            request.setAttribute("DomainListDTO", dmBean.selectById(Integer.parseInt(IDDomainList)));
            ArrayList<ServicesOfferedDTO> ds = bean.selectByIDDomainList(Integer.parseInt(IDDomainList));
            request.setAttribute("ServicesOfferedDTOs", ds);

            String url = "/views/admin/SelectServicesOffered.jsp";
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher(url);
            rd.forward(request, response);
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
