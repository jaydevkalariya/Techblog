/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.dao.CategoryDao;
import com.tech.blog.entities.Message;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class AddCategoryServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           
            
             CategoryDao cd=new CategoryDao(ConnectionProvider.getConnection());
            String st=request.getParameter("doo");
            if(st.equals("Add"))
            {
          
            
                   String name=request.getParameter("name");
                  String description=request.getParameter("description");
            
            
              boolean f=cd.addCategory(name, description);
             
              if(f)
              {
                out.println("true");
                response.sendRedirect("profile_admin.jsp");
              }
                  
            } //for delete
            else{
                 int cid=Integer.parseInt(request.getParameter("cid"));
                 boolean f=cd.deleteCategory(cid);
                 HttpSession s=request.getSession();
                  if(f)
                  {
                     Message msg = new Message("Deleted Succesfully...", "success", "alert-success");
                     s.setAttribute("msg", msg);
                    
                  }
                  else{
                       Message msg = new Message("not deleted...", "danger", "alert-danger");
                     s.setAttribute("msg", msg);
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
