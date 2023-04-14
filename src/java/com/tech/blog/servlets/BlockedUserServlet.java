
package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tech.blog.dao.BlockUserDao;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;

import com.tech.blog.helper.ConnectionProvider;
import javax.servlet.http.HttpSession;


public class BlockedUserServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           
            String op=request.getParameter("operation");
           
            
             UserDao dao = new UserDao(ConnectionProvider.getConnection());
             BlockUserDao bdao = new BlockUserDao(ConnectionProvider.getConnection());
             
            if(op.equals("BlockUser"))
            {
                int id=Integer.parseInt(request.getParameter("UserId"));
               
                 User user=dao.getUserByUserId(id);
                 HttpSession s=request.getSession();
                if(bdao.saveBlockUser(user))
                {
//                     
                     Message msg = new Message("User Blocked Succesfully...", "success", "alert-success");
                     s.setAttribute("msg", msg);
                     response.sendRedirect("userDetail.jsp");
                     
                }
                else{
                    Message msg = new Message("Sorry, you cant able to block Admin !!", "danger", "alert-danger");
                     s.setAttribute("msg", msg);
                      response.sendRedirect("profile_admin.jsp");
                    
                }
                
                
            }
            else if(op.equals("UnBlockUser"))
            {
                 int id=Integer.parseInt(request.getParameter("UserId"));
               out.print(id);
                 User user=dao.getUserByUserId(id);
                 HttpSession s=request.getSession();
                if(bdao.UnBlockUser(user))
                {
//                     
                     Message msg = new Message("User UnBlocked Succesfully...", "success", "alert-success");
                     s.setAttribute("msg", msg);
                     response.sendRedirect("userDetail.jsp");
                     
                }
                else{
                    Message msg = new Message("User not UnBlocked !!", "danger", "alert-danger");
                     s.setAttribute("msg", msg);
                      response.sendRedirect("profile_admin.jsp");
                    
                }
            }
            
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
