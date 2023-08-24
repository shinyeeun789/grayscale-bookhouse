package com.shop.test;

import com.shop.model.DBConnect;
import com.shop.model.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DaoTest6 {

    static Connection conn = null;
    static PreparedStatement pstmt = null;

    public static void main(String[] args) {
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("MariaDB 연결 성공");
        }
    }

}
