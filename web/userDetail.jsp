
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Admin"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page errorPage="error_page.jsp" %>
<%

    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            hr{
                margin:5px;
            }
          
            .dropdown-item:hover{
               background-color:  lightsteelblue;
            }
            .btn{
                display:inline;
            }
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }

            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }


        </style>
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> JK <span class="sr-only">(current)</span></a>
                    </li>

                   
                    <li class="nav-item">
                        <a class="nav-link" href="profile_admin.jsp"> <span class="	fa fa-address-card-o"></span> Home </a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#" id="user" onclick="display('user')"> <span class="	fa fa-address-card-o"></span> Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact2.jsp"> <span class="	fa fa-address-card-o"></span> Contact</a>
                    </li>




                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= admin.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        
          <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div> 
         <%
                session.removeAttribute("msg");
            }
        %>
        
        
           <div class="show_user mt-5">
        <h1 align="center"> User Details </h1>
        
        <% UserDao ud=new UserDao(ConnectionProvider.getConnection());
          ArrayList<User> list3 = new ArrayList<>();
          list3=ud.getAllUser();
         %>
         <div class="container">
        <table  class="table" border="2px" style="background-color:lightcyan;">
            <tr>
                 <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>about</th>
                 <th>Gender</th>
                  <th colspan="2">Status</th>
            </tr>
         <%   for(User uu:list3)
              {
        %>
            <tr>
                 <td><%= uu.getId() %></td>
                <td><%= uu.getName() %></td>
                <td><%= uu.getEmail() %></td>
                <td><%= uu.getAbout() %></td>
                 <td><%= uu.getGender() %></td>
                 <% if(ud.isBlockedUser(uu.getEmail())){ %>
                 <td style="background-color:lightcoral;">Blocked </td>
                 <td>
                       <form action="BlockedUserServlet">
                             <input type="hidden" name="UserId" value="<%= uu.getId() %>"/>
                              <input type="hidden" name="operation" value="UnBlockUser"/>
                              <button class="btn btn-outline-primary btn-sm" type="submit">UnBlock</button>
                        </form> 
                 </td>
                 <% }else{ %>
                 <td style="background-color:lightgreen;">Normal </td>
                 <td>
                       <form action="BlockedUserServlet">
                             <input type="hidden" name="UserId" value="<%= uu.getId() %>"/>
                              <input type="hidden" name="operation" value="BlockUser"/>
                              <button class="btn btn-outline-primary btn-sm" type="submit">Block</button>
                        </form> 
                 </td>
                 <%} %>
            </tr>
             <%
           }
          %>
        </table>
        </div>
        
       
        
        
        
        
    </div>
        
        
        
        
    </body>
</html>
