package cn.com.po;

import java.io.Serializable;

public class Blog implements Serializable {
    private String id;
    private String title;
    private String data;
    private String content;
    private String src_show;
    private String datail;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSrc_show() {
        return src_show;
    }

    public void setSrc_show(String src_show) {
        this.src_show = src_show;
    }

    public String getDatail() {
        return datail;
    }

    public void setDatail(String datail) {
        this.datail = datail;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", data='" + data + '\'' +
                ", content='" + content + '\'' +
                ", src_show='" + src_show + '\'' +
                ", datail='" + datail + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}