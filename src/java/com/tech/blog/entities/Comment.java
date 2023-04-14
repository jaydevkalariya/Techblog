
package com.tech.blog.entities;
import java.sql.*;

public class Comment {
    private int uid;
     private int pid;
     private int cmid;

    public int getCmid() {
        return cmid;
    }

    public void setCmid(int cmid) {
        this.cmid = cmid;
    }
    private String content;
    private Timestamp date;

    public Comment(int cmid,int uid,int pid, String content,Timestamp date) {
        this.cmid=cmid;
        this.uid = uid;
         this.pid = pid;
        this.content = content;
        this.date=date;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Comment() {
    }

    public Comment(String content) {
        this.content = content;
    }

    public int getuid() {
        return uid;
    }

    public void setuid(int uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
    
}
