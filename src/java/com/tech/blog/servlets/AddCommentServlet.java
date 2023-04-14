
package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;
import com.tech.blog.entities.User;
import com.tech.blog.dao.CommentDao;
import com.tech.blog.helper.ConnectionProvider;

public class AddCommentServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCommentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
           
           String operation=request.getParameter("operation");
           
            HttpSession hs=request.getSession(false);
           User u=(User)hs.getAttribute("currentUser");
           int uid=u.getId();
              
           CommentDao cd=new CommentDao(ConnectionProvider.getConnection());
          
            out.print("last");
           if (operation.equals("insertComment")) {
               out.print("last");
               String content=request.getParameter("content");
               int pid=Integer.parseInt(request.getParameter("pid"));
                boolean f=cd.addComment(pid, uid, content);
                if(f)
              {
               out.println("true");
               response.sendRedirect("show_blog_page.jsp?post_id="+pid);
              }
           }
           if (operation.equals("deleteComment")) {
               out.print("last");
                int  cmid = Integer.parseInt(request.getParameter("cmid"));
                
                boolean f=false;
                f=cd.deleteComment(cmid);
                out.println(f);   
            }
            if(operation.equals("updateComment")){
               out.println("hello");
                 int pid=Integer.parseInt(request.getParameter("pid"));
                int  cmid = Integer.parseInt(request.getParameter("cmid"));
                String content=request.getParameter("content2");
                 out.println("hm");
                boolean f=false;
               
                f=cd.updateComment(cmid,content);
                out.println(f);   
                response.sendRedirect("show_blog_page.jsp?post_id="+pid);
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
