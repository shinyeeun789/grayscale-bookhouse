package com.shop.vo;

public class MyReviewVO {
    private int rno;
    private String pname;
    private String cid;
    private String content;
    private int star;

    @Override
    public String toString() {
        return "MyReviewVO{" +
                "rno=" + rno +
                ", pname='" + pname + '\'' +
                ", cid='" + cid + '\'' +
                ", content='" + content + '\'' +
                ", star=" + star +
                '}';
    }

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }
}
