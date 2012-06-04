package com.alluringdecors.controller.home;

//import com.alluringdecors.model.dao.CompanyInformationDAO;
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
import javax.servlet.http.HttpSession;

public class LoginController extends BaseController
{
    @EJB
    private UserDAO userBean;
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
        HttpSession session = request.getSession(true);
        if ("View".equals(request.getParameter("Action")))
        {
            String url = "/views/home/Login.jsp";
	    ServletContext sc = getServletContext();
	    RequestDispatcher rd = sc.getRequestDispatcher(url);
	    rd.forward(request, response);
        }
        else if("Login".equals(request.getParameter("Action")))
        {
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                UserDTO userdto = userBean.checkForLogin(username, password);
                if (username.equals(userdto.getUserName()) && password.equals(userdto.getPassword()))
                {
                    session.setAttribute("UserInfo", userdto);
		    response.sendRedirect("./Home");
                }
		else
		{
		    request.setAttribute("Message", "The username and password are not right, please re-enter");
		    ServletContext sc = getServletContext();
		    RequestDispatcher rd = sc.getRequestDispatcher("/views/home/Login.jsp");
		    rd.forward(request, response);
		}

            } catch (Exception ex) {
                out.println(ex.getStackTrace());
            } finally {
                out.close();
            }
        }
        else if("Logout".equals(request.getParameter("Action")))
        {
            session.removeAttribute("UserInfo");
            response.sendRedirect("./Home");
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
