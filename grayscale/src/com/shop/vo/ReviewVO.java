package com.shop.vo;

public class ReviewVO {

    private int pno;
    private int sno;
    private String pname;
    private int amount;
    private int payprice;
    private String rdate;

    public int getPno() {
        return pno;
    }

    public void setPno(int pno) {
        this.pno = pno;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPayprice() {
        return payprice;
    }

    public void setPayprice(int payprice) {
        this.payprice = payprice;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    @Override
    public String toString() {
        return "ReviewVO{" +
                "pno=" + pno +
                ", sno=" + sno +
                ", pname='" + pname + '\'' +
                ", amount=" + amount +
                ", payprice=" + payprice +
                ", rdate='" + rdate + '\'' +
                '}';
    }
}
