package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;

import com.tech.blog.dao.AdminDao;
import com.tech.blog.entities.Admin;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Durgesh
 */
public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
//          login 
//            fetch username and password from request
            
            String Email = request.getParameter("email");
            String Password = request.getParameter("password");
            String type=request.getParameter("type");
            out.println(type);
            if(type.equals("User")){
            UserDao dao = new UserDao(ConnectionProvider.getConnection());

            User u = dao.getUserByEmailAndPassword(Email, Password);
            
             
            if (u == null) {
                //login.................
//                error///
//                out.println("Invalid Details..try again");
                Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("login_page.jsp");
            } else {
                
//                check if user is blocked by admin or not
               if(dao.isBlockedUser(Email)){
                   
                    Message msg = new Message("Your account is blocked due to inappropriate Activities!!,try again later..", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("login_page.jsp");
               }
               else{
                //......
//                login success
                HttpSession s = request.getSession();
                s.setAttribute("currentUser", u);
                  response.sendRedirect("profile.jsp");
               }
            }
            }
            else{
               
                 AdminDao dao = new AdminDao(ConnectionProvider.getConnection());

            Admin u = dao.getAdminByEmailAndPassword(Email, Password);

            if (u == null) {
           
                Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("login_page.jsp");
            } else {
                //......
//                login success
                HttpSession s = request.getSession();
                s.setAttribute("currentAdmin", u);
                response.sendRedirect("profile_admin.jsp");

            }
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
