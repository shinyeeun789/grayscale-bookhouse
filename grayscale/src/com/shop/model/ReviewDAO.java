package com.shop.model;

import com.shop.dto.Review;
import com.shop.vo.MyReviewVO;
import com.shop.vo.ReviewVO;
import org.checkerframework.checker.units.qual.A;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<MyReviewVO> getMyReview(String cid) {
        List<MyReviewVO> reviewList = new ArrayList<>();
        DBConnect con = new PostgreCon();

        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.REVIEW_CID_SELECT);
            pstmt.setString(1, cid);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                MyReviewVO review = new MyReviewVO();
                review.setRno(rs.getInt("rno"));
                review.setPname(rs.getString("pname"));
                review.setStar(rs.getInt("star"));
                review.setContent(rs.getString("content"));
                reviewList.add(review);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return reviewList;
    }

    public ReviewVO getPayInfoOne(int sno) {
        ReviewVO review = new ReviewVO();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn != null) {
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.PAYINFO_SELECT_ONE);
            pstmt.setInt(1, sno);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                review.setSno(rs.getInt("sno"));
                review.setPno(rs.getInt("pno"));
                review.setPname(rs.getString("pname"));
                review.setAmount(rs.getInt("amount"));
                review.setPayprice(rs.getInt("payprice"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return review;
    }

    public int addReview(int sno, int pno, int star, String content, String cid) {
        DBConnect con = new PostgreCon();
        conn = con.connect();
        int cnt = 0;

        try {
            pstmt = conn.prepareStatement(DBConnect.INSERT_REVIEW);
            pstmt.setInt(1, sno);
            pstmt.setInt(2, pno);
            pstmt.setInt(3, star);
            pstmt.setString(4, content);
            pstmt.setString(5, cid);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int deleteReview(int rno) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.REVIEW_DELETE);
            pstmt.setInt(1, rno);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public List<MyReviewVO> getReviewList() {
        List<MyReviewVO> reviewList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.SELECT_ADMIN_REVIEW_LIST);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                MyReviewVO vo = new MyReviewVO();
                vo.setRno(rs.getInt("rno"));
                vo.setPname(rs.getString("pname"));
                vo.setCid(rs.getString("cid"));
                vo.setStar(rs.getInt("star"));
                vo.setContent(rs.getString("content"));
                reviewList.add(vo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return reviewList;
    }

    public List<Review> getPnoReviewList(int pno) {
        List<Review> reviewList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.SELECT_REVIEW_PNO_LIST);
            pstmt.setInt(1, pno);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Review review = new Review();
                review.setRno(rs.getInt("rno"));
                review.setSno(rs.getInt("sno"));
                review.setCid(rs.getString("cid"));
                review.setContent(rs.getString("content"));
                review.setStar(rs.getInt("star"));
                review.setResdate(rs.getString("resdate"));
                reviewList.add(review);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return reviewList;
    }

}
