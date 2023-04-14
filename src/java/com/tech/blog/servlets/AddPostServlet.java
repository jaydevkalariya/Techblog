/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.entities.Admin;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Durgesh
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String operation=request.getParameter("operation");
           
             PostDao dao = new PostDao(ConnectionProvider.getConnection());
            
       if(operation.equals("addPost")){
           

            String persontype=request.getParameter("persontype");
            
            int cid = Integer.parseInt(request.getParameter("cid"));
            
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
             int a=-1;
            Part part = request.getPart("pic");
             
//            getting currentuser id
         
            HttpSession session = request.getSession();
            Post p;
           
            if(persontype.equals("Admin"))
            {// for admin
                 boolean posttype=false;
                if(request.getParameter("post_type").equals("Premium blog"))
                    posttype=true;
                    
            
            Admin admin = (Admin) session.getAttribute("currentAdmin");
          
             p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, a,admin.getId(),posttype);
           
            }
            else{//for User
            User user = (User) session.getAttribute("currentUser");
             p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId(),a,false);
            }
           
           if(dao.savePost(p)){
                String path = request.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                out.println("done");
            } else {
                out.println("error");
            }
            }
            
            
            if(operation.equals("deletePost"))
            {
                int pid=Integer.parseInt(request.getParameter("pid"));
                boolean f=false;
                f=dao.deletePost(pid);
                out.println(f);
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