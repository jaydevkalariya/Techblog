
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            
            
            
            
            
            
            
            
            



main {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
  padding: 20px;
}

section {
  border: 1px solid #ccc;
  padding: 20px;
  background-color: lightblue;
}

h2 {
  margin-top: 0;
}

.metrics {
  display: flex;
  justify-content: space-between;
}

.metric {
  text-align: center;
  border:1px solid black;
  border-radius:30%;
  height:100%;
  width:80%;
  margin:0 2%;
  background-color: blue;
  color: white;
}

.metric h3 {
  margin-top: 0;
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
                        <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> JK <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-check-square-o"></span>Add Categories
                        </a> 
                        <div class="dropdown-menu text-center mt-2" aria-labelledby="navbarDropdown" style="background-color:lightcyan;">
                            <% 
                                   CategoryDao d = new CategoryDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {
                         %>
                        <div class="dropdown-item " style="height:2em;"> <%= cc.getName() %> &nbsp;&nbsp;&nbsp; <button onclick="deleteCategory(<%= cc.getCid() %>)" class="btn btn-outline-dark mb-2" style="background-color:transparent;height:1.9em;border:none"><i class="material-icons " style="font-size:1.5em;color:black;;">delete</i></button> </div>
                          <hr/>
                        <%} %> <br/>
                          <a class="btn  btn-outline-primary" href="#!" data-toggle="modal" data-target="#addCategory" data-whatever="@getbootstrap">+</a>
                           </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span>Add Premium Code
                        </a> 
                    <div class="dropdown-menu text-center mt-2" aria-labelledby="navbarDropdown" style="background-color:lightcyan"> 
                            <form action="checkPremiumPost"/>
                            <input type="hidden" name="doo" value="addCode"/>
                            Enter Premium Code:
                            <div class="form-group ml-3 mr-3 mt-1">
                            <input type="text" name="code" id="code" class="form-control" />
                            </div>
                            <input type="submit" value="Add"/>
                           </form>
                           </div>
                    </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> Do Post</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="postDetail.jsp" id="post" > <span class="	fa fa-address-card-o"></span> Posts</a>
                    </li>
<!--                    onclick="display('post')"-->
                     <li class="nav-item">
                        <a class="nav-link" href="userDetail.jsp" id="user" "> <span class="	fa fa-address-card-o"></span> Users</a>
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
<!--                    end of nav bar-->
                    
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
     
        UserDao ud=new UserDao(ConnectionProvider.getConnection());
        PostDao pd=new PostDao(ConnectionProvider.getConnection());
        %>
        
<!--  start main body-->
      
  <main>
    <section id="dashboard">
       <img src="https://img.freepik.com/premium-vector/blogger-circular-concept-blue-outline-illustration_104589-712.jpg" alt="alt" height="450em" width="100%"/>
  
      <div class="metrics mt-5">
        <div class="metric">
          <h3>Users</h3>
          <p><%= ud.getTotalNo() %></p>
        </div>
        <div class="metric">
          <h3>Blogs</h3>
          <p><%= pd.getTotalNo() %></p>
        </div>
        <div class="metric">
          <h3>Categories</h3>
          <p><%= d.getTotalNo() %></p>
        </div>
      </div>
         </section>
    <section >
        <img src="https://smartblogger.com/wp-content/uploads/2222/01/best-website-builder-fb-1.png" alt="something is wrong" width="100%" height="300em">
        
        <div class="container mt-3">
            <h3 align="center">why Techblog?</h3>
            <br>
            <ul align="center">
                <li>Up-to-date information</li>   </br>
                <li> Clear, concise writing </li> </br>
                <li> Engaging visuals</li> </br>
                <li> Unique insights and perspectives</li>  </br> 
            </ul>
        </div>
    </section>
  </main>


<!--  ending main body-->
        
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
                            <img src="pics/<%= admin.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= admin.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= admin.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= admin.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= admin.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%=admin.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= admin.getDateTime().toString()%></td>

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
                                            <td><input type="text" value="Admin" name="type" readonly="readonly" style="border:none; text-align: center;"/></td>
                                        </tr>
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= admin.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= admin.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= admin.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= admin.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= admin.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= admin.getAbout()%>
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
        
       <!--modal for adding categories-->
       <div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
         <form action="AddCategoryServlet" id="add-category-form">
      <div class="modal-body">
         <input type="hidden" name="doo" value="Add"/>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Category Name:</label>
            <input type="text" class="form-control" id="recipient-name" name="name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Category Description:</label>
            <textarea class="form-control" id="message-text" name="description"></textarea>
          </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" >Save</button>
      </div>
         </form>
    </div>
  </div>
</div>
<!--       end of adding categories-->

<!--add posts modal-->
 <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                            <input type="text" name="operation" value="addPost" readonly="readonly" style="margin:0.5em 5em ;font-size:20px; text-align: center;"/>
                             <input type="text" name="persontype" value="Admin" readonly="readonly"/>
                            
                             <div class="form-group">
                                 <select class="form-control" name="post_type">
                                    <option selected disabled>---Select Post Type---</option>
                                    <option >Normal blog</option>
                                    <option >Premium blog</option>      
                                 </select>
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        CategoryDao catd = new CategoryDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = catd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic" >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>
<!--end of add post modal-->


                               
                      
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
         <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
          
        <script>
            $("body").children().first().before($(".modal"));
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
                 $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                 swal({
                                      title: "Good job!",
                                      text: "saved succesfully",
                                      type: "success"
                                    }).then(function() {
                                         window.location = "profile_admin.jsp";
                                     });
                            } else
                            {
                                swal({
                                      title: "try again..",
                                      text: "something went wrong!!",
                                      type: "error"
                                    }).then(function() {
                                         window.location = "profile_admin.jsp";
                                     });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
                 });
               
        </script>
        <script>
             $(document).ready(function (e) {
                $("#add-category-form").on("submit",function (event) {
                   
//                    event.preventDefault();
                    console.log("you have clicked on submi");
                    let form=new FormData(this);
                    
                 $.ajax({
                     
                    url: "AddCategoryServlet",
                    data:  form,
                    enctype: 'multipart/form-data',
                     processData: false,
                     contentType: false,
                     cache: false,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                       swal("done");

                   },
                    error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        }
                   
                   
                });
            });});
        </script>
        <script>

            function deleteCategory(catId) {

                $.ajax({
                    url: "AddCategoryServlet",
                    data: {cid: catId,
                           doo: "Delete"},
                     success: function (data, textStatus, jqXHR) {
                            window.location.reload();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            
                            swal("Error!!", "Something went wrong try again....", "error");
                        }
                    })
                

            }

            
          
        </script>
    </body>
</html>
