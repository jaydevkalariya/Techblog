package com.tech.blog.entities;

import java.sql.*;

public class Post {

    private int pid;
    private String pTitle;
    private String pContent;

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId;
    private int adminId;
    private boolean special;

    public Post() {
    }

    public Post(int pid, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId, int userId,int adminId,boolean type) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
        this.adminId = adminId;
        this.special=type;
    }

    public boolean isSpecial() {
        return special;
    }

    public void setSpecial(boolean special) {
        this.special = special;
    }

    public Post(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId, int userId,int adminId,boolean type) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
         this.special=type;
         this.adminId=adminId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}