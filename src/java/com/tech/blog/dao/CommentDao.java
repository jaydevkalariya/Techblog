package com.tech.blog.dao;

import com.tech.blog.entities.Comment;
import java.sql.*;
import java.util.ArrayList;


public class CommentDao {
     Connection con;

    public CommentDao(Connection con) {
        this.con = con;
    }
    
    public boolean addComment(int pid,int uid,String content)
    {
        boolean f=false;
        
         try {
          String q="insert into comments(uid,pid,content) values(?,?,?);";
            PreparedStatement p = this.con.prepareStatement(q);
            //values set...
            p.setInt(1, uid);
            p.setInt(2, pid);
            p.setString(3, content);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
     public int countComments(int pid)
    {
        int count=0;
        
         try {
          String q="select * from comments where pid=?;";
            PreparedStatement p = this.con.prepareStatement(q);
            //values set...
            p.setInt(1, pid);
           
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                count++;
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
     public ArrayList<Comment> getAllComments() {
        ArrayList<Comment> list = new ArrayList<>();

        try {

            String q = "select * from comments";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int uid = set.getInt("uid");
                 int pid = set.getInt("pid");
                  int cmid = set.getInt("cmid");
                
                String content = set.getString("content");
                Timestamp date=set.getTimestamp("date");
                Comment c = new Comment(cmid,uid, pid, content,date);
                list.add(c);
            }
            System.out.println(list.size());
                } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
      public ArrayList<Comment> getCommentsbyPost(int ppid) {
        ArrayList<Comment> list = new ArrayList<>();

        try {

            String q = "select * from comments where pid=?";
            PreparedStatement st = this.con.prepareStatement(q);
            st.setInt(1, ppid);
            ResultSet set = st.executeQuery();
            while (set.next()) {
                int uid = set.getInt("uid");
                 int pid = set.getInt("pid");
                  int cmid = set.getInt("cmid");
                
                String content = set.getString("content");
                Timestamp date=set.getTimestamp("date");
                Comment c = new Comment(cmid,uid, pid, content,date);
                list.add(c);
            }
            System.out.println(list.size());
                } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
          public boolean deleteComment(int cmid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("delete from Comments where cmid=? ");
            p.setInt(1, cmid);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
          
             public boolean updateComment(int cmid,String text) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("update Comments set content=? where cmid=? ");
            p.setInt(2, cmid);
             p.setString(1, text);
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
     
     
    
}
