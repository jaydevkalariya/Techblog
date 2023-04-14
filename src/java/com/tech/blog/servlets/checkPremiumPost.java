/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;
import com.tech.blog.dao.PremiumCodeDao;
import com.tech.blog.entities.Message;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class checkPremiumPost extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) { 
            
            PremiumCodeDao pcd=new PremiumCodeDao(ConnectionProvider.getConnection());
           
            String st=request.getParameter("doo");
           
            int code=Integer.parseInt(request.getParameter("code"));
            
            if(st.equals("addCode"))
            {
            
           
            HttpSession s=request.getSession();
            if(!pcd.checkCode(code))
            {
                if(pcd.addCode(code))
                {
                     Message msg = new Message("Premium Code added Succesfully...", "success", "alert-success");
                      s.setAttribute("msg", msg);
                }
                else
                {
                     Message msg = new Message("Premium Code not added!!", "danger", "alert-danger");
                      s.setAttribute("msg", msg);
                }
               
            } 
            else{
                Message msg = new Message("Premium Code already added...", "warning", "alert-warning");
                      s.setAttribute("msg", msg);
            }
             response.sendRedirect("profile_admin.jsp");
           }
            else{
                if(pcd.checkCode(code))
                {
                    out.println("done");
                }
            }
    }

  
  

}
}