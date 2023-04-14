<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<style>
    .blue{
        color:blue;
        font-size: 20px;
/*        background-color:yellow;*/
    }
    .highlight{
        border:5px solid black;
    }
    .card{
         background-color: lightcyan;
    }
      .highlight2{
        background-color:greenyellow;
/*        color:red;*/
    }
</style>
<div class="row">

    <%
        
        User uuu=(User)session.getAttribute("currentUser");
        
//       Thread.sleep(1000);
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        }
        else if(cid == -1){
           posts=d.getLikedPosts(uuu.getId());
        }
        else if(cid == -2){
           posts=d.getPremiumPosts();
        }
        else {
            posts = d.getPostByCatId(cid);
        }
        
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
            return;
        }
              
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
              
        for (Post p : posts) {
    %>

    <div class="col-md-6 mt-2  temp">
          <%
           if( uuu.getId()==p.getUserId() && p.isSpecial())
                {
                %>     
        <div class="card highlight highlight2 <%= -p.getPid()%>" >
           <% }else if(p.isSpecial()){ %>
        <div class="card highlight2 <%= -p.getPid()%>" >  
           <% }else if(uuu.getId()==p.getUserId()){ %>
        <div class="card highlight <%= -p.getPid()%>" > 
            <% }else{ %>
         <div class="card" > 
             <% } %>
          
             <div>
                 <br/>
             </div>
                 <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap" height="200"/>
              
            <div class="card-body">
               
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>

            </div>
            <div class="card-footer primary-background text-center">
             
                <%
           if(!ld.isLikedByUser(p.getPid(), uuu.getId()))
                {
                %>
             <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="<%= p.getPid()%>"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>

           <% }else{ %>
          
                 <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up blue"></i> <span class="<%= p.getPid()%>"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
           <% } %>
                
               <% 
                   if( p.isSpecial()){
               %>
                <a href="#!" onclick="checkCode(<%= p.getPid()%>)"  class="btn btn-outline-light btn-sm">Read More...</a>
                <%
                    }else{
                %>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>&special=<%= p.isSpecial() %>" class="btn btn-outline-light btn-sm">Read More...</a>
               <% } %>
                <%
                  if( uuu.getId()==p.getUserId())
                {
                %>
                <a href="#!" onclick="deletePost(<%= p.getPid()%>)" class="btn btn-outline-light btn-sm"> delete </a>
              <% } %>
                 </div>

        </div>


    </div>


    <%
        }
        

    %>

</div>
    <script>
          function checkCode(pid) {
                      var code=prompt("Enter secret Code for Premium Blog:");
                      var doo="checkCode";
                  const d = {
                     code: code,
                     doo:doo
                         };
                         
                  $.ajax({
                        url: "checkPremiumPost",
                        data: d,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                           console.log(data);
                            if (data.trim() == 'done')
                            {
                                location.href="show_blog_page.jsp?post_id="+pid+"";
                            } else
                            {
                                swal("Error!!", "Code for Premium blog is invalid!!", "error");   
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        }
                    });
                }
    </script>