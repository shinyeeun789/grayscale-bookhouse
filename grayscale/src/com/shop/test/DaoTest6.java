package com.shop.test;

import com.shop.dto.Notice;
import com.shop.model.DBConnect;
import com.shop.model.MariaDBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoTest6 {

    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("MariaDB 연결 성공");
        }

        List<Notice> notiList = new ArrayList<>();
        String sql = "select * from notice order by no desc limit 10";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                notiList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }

        for(Notice n:notiList){
            System.out.println(n.toString());
        }
    }
}
