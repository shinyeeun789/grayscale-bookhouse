package com.shop.model;

import com.shop.dto.Notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NoticeDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Notice> getNoticeList(int pageSize){
        List<Notice> notiList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_LIMIT);
            pstmt.setInt(1, pageSize);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));

                // 작성일 포맷
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(rs.getString("resdate"));
                noti.setResdate(sdf.format(d));

                noti.setVisited(rs.getInt("visited"));
                notiList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return notiList;
    }

    public Notice getNotice(int no){
        Notice noti = new Notice();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_ONE);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            if(rs.next()){
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(rs.getString("resdate"));
                noti.setResdate(sdf.format(d));
                noti.setVisited(rs.getInt("visited"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
       return noti;
    }

    public int addNotice(Notice noti){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_INSERT);
            pstmt.setString(1, noti.getTitle());
            pstmt.setString(2, noti.getContent());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int updateNotice(Notice noti){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_UPDATE);
            pstmt.setString(1, noti.getTitle());
            pstmt.setString(2, noti.getContent());
            pstmt.setInt(3, noti.getNo());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int deleteNotice(int no){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_DELETE);
            pstmt.setInt(1, no);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public List<Notice> getMainNotices() {
        List<Notice> noticeList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.SELECT_MAIN_NOTICES);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(rs.getString("resdate"));
                noti.setResdate(sdf.format(d));
                noti.setVisited(rs.getInt("visited"));

                noticeList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return noticeList;
    }
}
