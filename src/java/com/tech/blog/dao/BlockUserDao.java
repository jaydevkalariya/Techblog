package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class BlockUserDao {
     private Connection con;

    public BlockUserDao(Connection con) {
        this.con = con;
    }
    
     public boolean saveBlockUser(User user) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into blocked_user(id,name,email) values (?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
             pstmt.setInt(1, user.getId());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
           
           
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
       public boolean UnBlockUser(User user) {
        boolean f = false;
        try {
            //user -->database

            String query = "delete from blocked_user where id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
             pstmt.setInt(1, user.getId());
           
           
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
       
   
}
