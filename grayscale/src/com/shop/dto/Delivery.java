package com.shop.dto;

public class Delivery {

    private int dno;
    private int sno;
    private String cid;
    private String daddr;
    private String custel;
    private String pcom;
    private String ptel;
    private int pstate;
    private String sdate;
    private String rdate;
    private String bcode;

    public int getDno() {
        return dno;
    }

    public void setDno(int dno) {
        this.dno = dno;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getDaddr() {
        return daddr;
    }

    public void setDaddr(String daddr) {
        this.daddr = daddr;
    }

    public String getCustel() {
        return custel;
    }

    public void setCustel(String custel) {
        this.custel = custel;
    }

    public String getPcom() {
        return pcom;
    }

    public void setPcom(String pcom) {
        this.pcom = pcom;
    }

    public String getPtel() {
        return ptel;
    }

    public void setPtel(String ptel) {
        this.ptel = ptel;
    }

    public int getPstate() {
        return pstate;
    }

    public void setPstate(int pstate) {
        this.pstate = pstate;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public String getBcode() {
        return bcode;
    }

    public void setBcode(String bcode) {
        this.bcode = bcode;
    }

    @Override
    public String toString() {
        return "Delivery{" +
                "dno=" + dno +
                ", sno=" + sno +
                ", cid='" + cid + '\'' +
                ", daddr='" + daddr + '\'' +
                ", custel='" + custel + '\'' +
                ", pcom='" + pcom + '\'' +
                ", ptel='" + ptel + '\'' +
                ", pstate=" + pstate +
                ", sdate='" + sdate + '\'' +
                ", rdate='" + rdate + '\'' +
                ", bcode='" + bcode + '\'' +
                '}';
    }
}
