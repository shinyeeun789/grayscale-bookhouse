package com.shop.dto;

public class Review {

    private int rno;
    private String cid;
    private int sno;
    private int pno;
    private int star;
    private String content;
    private String resdate;

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }


    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public int getPno() {
        return pno;
    }

    public void setPno(int pno) {
        this.pno = pno;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    @Override
    public String toString() {
        return "Review{" +
                "rno=" + rno +
                ", cid='" + cid + '\'' +
                ", sno=" + sno +
                ", pno=" + pno +
                ", star=" + star +
                ", content='" + content + '\'' +
                ", resdate='" + resdate + '\'' +
                '}';
    }
}
