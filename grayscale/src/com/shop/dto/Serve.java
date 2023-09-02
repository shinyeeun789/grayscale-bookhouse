package com.shop.dto;

public class Serve {

    private int sno;
    private int pno;
    private int amount;
    private int sprice;
    private String resdate;

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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSprice() {
        return sprice;
    }

    public void setSprice(int sprice) {
        this.sprice = sprice;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    @Override
    public String toString() {
        return "Serve{" +
                "sno=" + sno +
                ", pno=" + pno +
                ", amount=" + amount +
                ", sprice=" + sprice +
                ", resdate='" + resdate + '\'' +
                '}';
    }

}
