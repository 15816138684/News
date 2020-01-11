package cn.com.po;

import java.util.List;

public class Comment {
    private int id;

    private String date;

    private String comment;

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    private int p_id;

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", date='" + date + '\'' +
                ", comment='" + comment + '\'' +
                ", p_id=" + p_id +
                ", nextComment=" + nextComment +
                ", blog_id=" + blog_id +
                ", username='" + username + '\'' +
                '}';
    }



    private List<Comment> nextComment;
    public int getId() {
        return id;
    }

    public List<Comment> getNextComment() {
        return nextComment;
    }

    public void setNextComment(List<Comment> nextComment) {
        this.nextComment = nextComment;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    private int blog_id;

    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
