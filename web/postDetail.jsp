
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
                    <li class="nav-item">
                        <a class="nav-link" href="#"> <span class="fa fa-bell-o"></span> JK <span class="sr-only">(current)</span></a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="profile_admin.jsp"> <span class="	fa fa-address-card-o"></span> Home </a>
                    </li>
                     <li class="nav-item active">
                        <a class="nav-link" href="#" id="post" onclick="display('post')"> <span class="	fa fa-address-card-o"></span> Posts</a>
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
        
         
    <div class="show_post mt-3" >
        
        <div class="container">
        <h1 align="center">All Posts</h1>
        
        <div class="row">
    <%
        
        Admin uuu=(Admin)session.getAttribute("currentAdmin");

        PostDao pd = new PostDao(ConnectionProvider.getConnection());
        
  
        List<Post> posts = null;
       
            posts = pd.getAllPosts();
       
       
              
      LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
              
        for (Post p : posts) {
    %>

    <div class="col-md-3 mt-2  temp">
           
         <div class="card <%= -p.getPid() %>" > 
             <div>
                 <br/>
             </div>
                 <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap" height="200"/>
              
            <div class="card-body">
               
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>

            </div>
            <div class="card-footer primary-background text-center">
             
             
                <a href="show_blog_page_admin.jsp?post_id=<%= p.getPid()%>&special=<%= p.isSpecial() %>" class="btn btn-outline-light btn-sm">Read More...</a>
              
                <a href="#!" onclick="deletePost(<%= p.getPid()%>)" class="btn btn-outline-light btn-sm"> delete </a>
             
                 </div>

        </div>


    </div>


    <%
        }
        

    %>

</div>
   
    </div>
          
    </div>
      
    
<!--    javascript-->
 <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
          
<script>
     function deletePost(pid)
{
    const d = {
        pid: pid,
        operation: 'deletePost'
    };
     
    $.ajax({
        url: "AddPostServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
                 console.log("hello");
                 location.reload();
                 $(".-"+pid).css("display","none");
                 
             
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("hello error");
        }
    });
}
    </script>
    
    
        
        
        
    </body>
</html>
