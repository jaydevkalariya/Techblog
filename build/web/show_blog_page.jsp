<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.AdminDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>

<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.entities.Comment"%>
<%@page import="com.tech.blog.dao.CommentDao"%>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        
        response.sendRedirect("login_page.jsp");
    }


%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> || TechBlog by Learn Code with Durgesh </title>

        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            .fontt{
                color:black;
            }
            #cmt{
                height:700px;
                overflow:scroll;
            }
            

            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;

            }


            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }

            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
           
             .blue{
                color:blue;
/*                background-color:yellow;*/
            }

        </style>
    
        
                   
    </head>
    <body>
        <!--navbar--> 

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"> <span class="	fa fa-bell-o"></span> LearnCode with Durgesh <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp"> <span class="	fa fa-address-card-o"></span> Contact</a>
                    </li>



                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>



        <!--end of navbar-->

        <!--main content of body-->


        <div class="container">
            
            <div class="row my-4">

                <div class="col-md-8 offset-md-2">


                    <div class="card">

                        <div class="card-header primary-background text-white">
                              <a href="profile.jsp" class="btn btn-outline-light btn-sm" style="font-size: 18px"> <b>&larr;</b> Go back</a>
                           
                              <h4 class="post-title" align="center"><%= p.getpTitle()%></h4>
                            


                        </div>

                        <div class="card-body">

                            <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap" >


                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                       AdminDao ad = new AdminDao(ConnectionProvider.getConnection());
                                     User uuu=(User)session.getAttribute("currentUser");
                                    %>
<!--                                    either post done by user or admin-->
                                    <% if(p.getUserId()!=-1){ %>
                                    <p class="post-user-info"> <a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted : </p>
                                    <% }else{ %>
                                     <p class="post-admin-info"> <a href="#!"> <%= ad.getAdminByAdminId(p.getAdminId()).getName()%></a> has posted : </p>
                            
                                    <% } %>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                                </div>
                            </div>


                            <p class="post-content"><%= p.getpContent()%></p> 

                            <br>
                            <br>

                            <div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer primary-background">
                       
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>
                           <%
           if(!ld.isLikedByUser(p.getPid(), uuu.getId()))
                {
                %>
           
             <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="<%= p.getPid()%>"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>

           <% }else{ %>
          
                 <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up blue"></i> <span class="<%= p.getPid()%>"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
           <% } %>
              <% 
               CommentDao cd=new CommentDao(ConnectionProvider.getConnection());
           %>
           <button class="btn btn-outline-light btn-sm" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" > <i class="fa fa-commenting-o"></i> <span class='countcomment'><%= cd.countComments(p.getPid()) %></span>  </button>


 <!--           comments--><br/><br/>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
     
           <section style="background-color: #eee;" id="cmt">
  <div class="container my-5 py-5">
    <div class="row d-flex justify-content-center">
         <div class="col-md-12 col-lg-10 col-xl-8">
        <%
             ArrayList<Comment> list1=cd.getCommentsbyPost(p.getPid());
           
             for(Comment cm:list1)
             {
             
         %>
         
        <div class="card">
          <div class="card-body  <%= -cm.getCmid() %>">
            <div class="d-flex flex-start align-items-center">
              <img class="rounded-circle shadow-1-strong me-3"
                src="pics/<%= ud.getUserByUserId( cm.getuid()).getProfile() %>" alt="avatar" width="60"
                height="60" />
              <div>
                  <h6 class="fw-bold text-primary mb-1"><%= ud.getUserByUserId( cm.getuid()).getName() %></h6>
                <p class="text-muted small mb-0">
                  <%= cm.getDate()%>
                </p>
              </div>
            </div>

            <p class="mt-3 mb-4 pb-2 updatedContent">
             <%= cm.getContent() %>
            </p>

            <div class="small d-flex justify-content-start">
               <a href="#!" onclick="doLike_c(<%= cm.getCmid() %>,<%= uuu.getId()%>)" class=" btn btn-outline-light btn-sm "> <i class="fa fa-thumbs-o-up blue"></i> <span class="<%= cm.getCmid()%> fontt"><%=  ld.countLikeOnComment(cm.getCmid()) %></span>  </a>
               
                <%
                  if( cm.getuid()==uuu.getId())
                  { 
               %>
               <a href="#!" onclick="deleteComment_c(<%= cm.getCmid() %>)" class="btn  btn-sm btn-outline-primary"> Delete  </a>
                <a href="#!"  class="btn  btn-sm btn-outline-primary ml-2" data-toggle="modal" data-target="#editModal"> Update  </a>
             
               <% } %>

               
            </div>
          </div>
                   <!--              modal for updating comments -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title fs-5" id="exampleModalLabel">Edit Comment</h2> 
       <img class="rounded-circle shadow-1-strong me-3"
                src="pics/<%= ud.getUserByUserId( cm.getuid()).getProfile() %>" alt="avatar" width="60"
                height="60" />
      </div>
               
      <div class="modal-body">
           <form id="update-comment-form" action="AddCommentServlet" method="post">
                 <input type="hidden" name="pid" id="pid" value="<%= p.getPid() %>"/>
                
               <input type='hidden' value="updateComment" name="operation"/>
                <input type='hidden' value="<%= cm.getCmid() %>" name="cmid"/>
          <textarea class="form-control" id="content2" rows="4"
                  style="background: #fff;" name="content2"><%= cm.getContent()%></textarea>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <input type="submit"  class="btn btn-primary" value="Save changes"/>
           </form>
      </div>
      <div class="modal-footer">
        
      </div>
      
    </div>
  </div>
</div>
               

               
            <%
                
                }
                %>
                
                <form action="AddCommentServlet" method="post" id="add-comment-form">
                   <input type="hidden" name="operation" value="insertComment"/>
          <div class="card-footer py-3 border-0" style="background-color: #f8f9fa;">
            <div class="d-flex flex-start w-100">
              <img class="rounded-circle shadow-1-strong me-3"
                src="pics/<%= user.getProfile()%>" alt="avatar" width="40"
                height="40" />
              <div class="form-outline w-100">
                <textarea class="form-control" id="content" rows="4"
                  style="background: #fff;" name="content"></textarea>
                <label class="form-label" for="content">Message</label>
                <input type="hidden" name="pid" id="pid" value="<%= p.getPid() %>"/>
                
              </div>
            </div>
            <div class="float-end mt-2 pt-1">
              <input type="submit" class="btn btn-primary btn-sm" id="add_comment"  value="Post comment" />
<!--<button type="button" class="btn btn-primary btn-sm" id="add_comment"  value="Post comment">Post comment</button>-->
              <button type="button" class="btn btn-outline-primary btn-sm">Cancel</button>
            </div>
          </div>
                </form>
        </div>
      </div>
    </div>
  </div>
</section>
  </div>
</div>
          

   
                        </div>
                       



                    </div>


                </div>

            </div>
                           

        </div>



        <!--end of main content  of body-->


 
        <!--profile modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>Type of Person :</td>
                                            <td> <input type="text" value="User" name="type" readonly="readonly" style="border:none; text-align: center;"/></td>
                                        </tr>
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->

        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function ()
                                    {

                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()

                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()

                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")

                                        }


                                    })
                                });

        </script>
        <script>
////            for showing comment box or disclose it
//            function fun()
//            {
//                let cmt=document.getElementById("cmt");
//                console.log("cmt.style.display");
//                if(cmt.style.display!="none")
//                {
//                    cmt.style.display=none;
//                }
//                else{
//                    cmt.style.display="visible";
//                }
//            }
        </script>
        <script>

        </script>
       
      

    </body>
</html>
