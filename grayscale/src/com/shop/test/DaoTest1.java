package com.shop.test;

import com.shop.dto.*;
import com.shop.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoTest1 {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static Statement stmt = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        List<Notice> notiList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "select * from custom order by id desc";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                noti.setVisited(rs.getInt("visited"));
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
