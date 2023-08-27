package com.shop.vo;

public class ProductListVO {

    private String pname;
    private String cname;
    private int rprice;
    private int price;

    private int amount;

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getRprice() {
        return rprice;
    }

    public void setRprice(int rprice) {
        this.rprice = rprice;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "ProductListVO{" +
                "pname='" + pname + '\'' +
                ", cname='" + cname + '\'' +
                ", rprice=" + rprice +
                ", price=" + price +
                ", amount=" + amount +
                '}';
    }
}
