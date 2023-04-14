/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;


import com.tech.blog.entities.Admin;
import java.sql.*;

public class AdminDao {

    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveAdmin(Admin admin) {
        boolean f = false;
        try {
            //admin -->database

            String query = "insert into admin(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, admin.getName());
            pstmt.setString(2, admin.getEmail());
            pstmt.setString(3, admin.getPassword());
            pstmt.setString(4, admin.getGender());
            pstmt.setString(5, admin.getAbout());
           
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by useremail and userpassword:
    public Admin getAdminByEmailAndPassword(String email, String password) {
        Admin admin = null;

        try {

            String query = "select * from admin where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                admin = new Admin();

//             data from db
                String name = set.getString("name");
//             set to user object
                admin.setName(name);

                admin.setId(set.getInt("id"));
                admin.setEmail(set.getString("email"));
               admin.setPassword(set.getString("password"));
                admin.setGender(set.getString("gender"));
               admin.setAbout(set.getString("about"));
                admin.setDateTime(set.getTimestamp("rdate"));
                admin.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }

        public boolean updateAdmin(Admin admin) {

        boolean f = false;
        try {

            String query = "update admin set name=? , email=? , password=? , gender=? ,about=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, admin.getName());
            p.setString(2, admin.getEmail());
            p.setString(3, admin.getPassword());
            p.setString(4, admin.getGender());
            p.setString(5, admin.getAbout());
            p.setString(6, admin.getProfile());
            p.setInt(7, admin.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Admin getAdminByAdminId(int userId) {
        Admin admin = null;
        try {
            String q = "select * from admin where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                admin = new Admin();

//             data from db
                String name = set.getString("name");
//             set to user object
                admin.setName(name);

                admin.setId(set.getInt("id"));
                admin.setEmail(set.getString("email"));
                admin.setPassword(set.getString("password"));
                admin.setGender(set.getString("gender"));
                admin.setAbout(set.getString("about"));
                admin.setDateTime(set.getTimestamp("rdate"));
                admin.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}