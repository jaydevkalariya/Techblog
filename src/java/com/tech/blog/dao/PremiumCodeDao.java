package com.tech.blog.dao;
import com.tech.blog.entities.PremiumCode;
import java.sql.*;

public class PremiumCodeDao {
    private Connection con;

    public PremiumCodeDao(Connection con) {
        this.con = con;
    }
    
     public boolean addCode(int code) {
        boolean f = false;
        try {
            
            String q = "insert into premiumcode(code) values(?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setInt(1, code);
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public boolean checkCode(int code)
    {
        boolean f = false;
        try {
           
            String query = "select * from premiumcode where code=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, code);
           
             ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                f=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
