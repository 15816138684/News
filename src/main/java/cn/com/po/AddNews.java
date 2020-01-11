package cn.com.po;

import java.io.Serializable;

public class AddNews implements Serializable {
    private Integer id;
    private String title;
    private String data;
    private String src_show;
    private String type;
    private String content;
    private String datail;
    private String author;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getSrc_show() {
        return src_show;
    }

    public void setSrc_show(String src_show) {
        this.src_show = src_show;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDatail() {
        return datail;
    }

    public void setDatail(String datail) {
        this.datail = datail;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "AddNews{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", data='" + data + '\'' +
                ", type='" + type + '\'' +
                ", content='" + content + '\'' +
                ", datail='" + datail + '\'' +
                ", author='" + author + '\'' +
                '}';
    }
}