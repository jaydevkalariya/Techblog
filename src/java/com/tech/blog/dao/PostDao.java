/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public int getTotalNo()
    {
        int ans=0;
         try {
            
            String q = "select count(*) from posts;";
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
                ans=rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId,adminId,special) values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
             pstmt.setInt(7, p.getAdminId());
             pstmt.setBoolean(8, p.isSpecial());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    get all the posts
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                int adminId= set.getInt("adminId");
                 boolean type=set.getBoolean("special");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId,adminId,type);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> getLikedPosts(int uid) {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where pid in(select pid from liked where uid=?)");
            p.setInt(1, uid);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                int adminId= set.getInt("adminId");
                 boolean type=set.getBoolean("special");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId,adminId,type);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> getPremiumPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where special=?");
            p.setBoolean(1, true);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                int adminId= set.getInt("adminId");
                 boolean type=set.getBoolean("special");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId,adminId,type);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                int adminId = set.getInt("adminId");
                 boolean type=set.getBoolean("special");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId,adminId,type);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid=set.getInt("catId");
                int userId = set.getInt("userId");
                int adminId = set.getInt("adminId");
                boolean type=set.getBoolean("special");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId,adminId,type);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
     public boolean deletePost(int pid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("delete from posts where pid=? ");
            p.setInt(1, pid);
          
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}