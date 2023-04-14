/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class CategoryDao {
    Connection con;
     public CategoryDao(Connection con) {
        this.con = con;
    }
     
    public int getTotalNo()
    {
        int ans=0;
         try {
            
            String q = "select count(*) from categories;";
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
                ans=rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ans;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean addCategory(String name,String description)
    {
        boolean f=false;
        String q="insert into categories(name,description) values(?,?)";
        try{
        PreparedStatement stmt=con.prepareStatement(q);
        stmt.setString(1,name);
         stmt.setString(2,description);
         stmt.executeUpdate();
         f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
           return f;
    }
     public boolean deleteCategory(int cid)
    {
        boolean f=false;
        String q="delete from categories where cid=?";
        try{
        PreparedStatement stmt=con.prepareStatement(q);
        stmt.setInt(1,cid);
         stmt.executeUpdate();
         f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
           return f;
    }
}
        
     
    
