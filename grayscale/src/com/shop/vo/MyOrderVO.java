package com.shop.vo;

import java.util.Arrays;

public class MyOrderVO {

    private int sno;
    private String sdate;
    private String cnum;
    private String pname;
    private int amount;
    private int payprice;
    private String pstate;
    private String[] state_list = {"입고", "상차", "하차", "배송 중", "배송 도착"};

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public String getCnum() {
        return cnum;
    }

    public void setCnum(String cnum) {
        this.cnum = cnum;
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

    public String getPstate() {
        return pstate;
    }

    public void setPstate(String pstate) {
        this.pstate = pstate;
    }

    public String[] getState_list() {
        return state_list;
    }

    public void setState_list(String[] state_list) {
        this.state_list = state_list;
    }

    @Override
    public String toString() {
        return "MyOrderVO{" +
                "sno=" + sno +
                ", sdate='" + sdate + '\'' +
                ", cnum='" + cnum + '\'' +
                ", pname='" + pname + '\'' +
                ", amount=" + amount +
                ", payprice=" + payprice +
                ", pstate='" + pstate + '\'' +
                ", state_list=" + Arrays.toString(state_list) +
                '}';
    }

}
