package com.shop.vo;

public class ProfitVO {
    private String date;
    private String pname;
    private int sales = 0;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    @Override
    public String toString() {
        return "ProfitVO{" +
                "date='" + date + '\'' +
                ", pname='" + pname + '\'' +
                ", sales=" + sales +
                '}';
    }
}
