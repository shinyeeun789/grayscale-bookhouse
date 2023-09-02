package com.shop.dto;

public class Payment {

    private int sno;
    private String cid;
    private int pno;
    private int amount;
    private String pmethod;
    private String pcom;
    private String cnum;
    private int payprice;

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

    public int getPno() {
        return pno;
    }

    public void setPno(int pno) {
        this.pno = pno;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPmethod() {
        return pmethod;
    }

    public void setPmethod(String pmethod) {
        this.pmethod = pmethod;
    }

    public String getPcom() {
        return pcom;
    }

    public void setPcom(String pcom) {
        this.pcom = pcom;
    }

    public String getCnum() {
        return cnum;
    }

    public void setCnum(String cnum) {
        this.cnum = cnum;
    }

    public int getPayprice() {
        return payprice;
    }

    public void setPayprice(int payprice) {
        this.payprice = payprice;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "sno=" + sno +
                ", cid='" + cid + '\'' +
                ", pno=" + pno +
                ", amount=" + amount +
                ", pcom='" + pcom + '\'' +
                ", cnum='" + cnum + '\'' +
                ", payprice=" + payprice +
                '}';
    }
}
