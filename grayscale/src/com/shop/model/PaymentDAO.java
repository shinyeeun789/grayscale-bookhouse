package com.shop.model;

import com.shop.dto.Delivery;
import com.shop.dto.Payment;
import com.shop.dto.Serve;
import com.shop.vo.CartVO;
import com.shop.vo.ReviewVO;
import org.checkerframework.checker.units.qual.A;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {

    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    // 결제 시 결제 처리 메서드
    public int addPayments(Payment pay, Delivery del, CartVO cart) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            conn.setAutoCommit(false);

            // 1. 결제 데이터 추가
            pstmt = conn.prepareStatement(DBConnect.INSERT_PAYMENT);
            pstmt.setString(1, pay.getCid());
            pstmt.setInt(2, pay.getPno());
            pstmt.setInt(3, pay.getAmount());
            pstmt.setString(4, pay.getPmethod());
            pstmt.setString(5, pay.getPcom());
            pstmt.setString(6, pay.getCnum());
            pstmt.setInt(7, pay.getPayprice());
            cnt += pstmt.executeUpdate();

            // 2. 출고 데이터 추가
            ProductDAO dao = new ProductDAO();
            pstmt = conn.prepareStatement(DBConnect.INSERT_SERVE);
            pstmt.setInt(1, pay.getPno());
            pstmt.setInt(2, pay.getAmount());
            pstmt.setInt(3, dao.getPrice(pay.getPno()));
            cnt += pstmt.executeUpdate();

            // 3-1. 배송 데이터 추가
            pstmt = conn.prepareStatement(DBConnect.INSERT_DELIVERY);
            pstmt.setString(1, del.getCid());
            pstmt.setString(2, del.getDaddr());
            pstmt.setString(3, del.getCustel());
            cnt += pstmt.executeUpdate();

            // 3-2. 배송 테이블에 결제 번호 업데이트
            pstmt = conn.prepareStatement(DBConnect.UPDATE_DELIVERY_SNO);
            cnt += pstmt.executeUpdate();

            // 4. 장바구니 데이터 제거
            pstmt = conn.prepareStatement(DBConnect.CART_DELETE);
            pstmt.setString(1, cart.getCartno());
            cnt += pstmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);
        }
        return cnt;
    }

    public int getSno() {
        int sno = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.SELECT_SNO);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                sno = rs.getInt("sno");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sno;
    }

    public Payment getPayment(int pno) {
        Payment pay = new Payment();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PAYMENT_SELECT_ONE);
            pstmt.setInt(1, pno);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                pay.setSno(rs.getInt("sno"));
                pay.setCid(rs.getString("cid"));
                pay.setPno(rs.getInt("pno"));
                pay.setAmount(rs.getInt("amount"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return pay;
    }

    public int returnPaymentOne(int sno, int pno, int amount, String cid) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            conn.setAutoCommit(false);

            // 1. 반품 시 결제 내용 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_PAYMENT);
            pstmt.setInt(1, sno);
            cnt = cnt + pstmt.executeUpdate();

            // 2. 반품 시 배송 정보 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_DELIVERY);
            pstmt.setInt(1, sno);
            cnt = cnt + pstmt.executeUpdate();

            // 3. 반품 시 출고 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_SERVE);
            pstmt.setInt(1, sno);
            cnt = cnt + pstmt.executeUpdate();

            // 4. 반품 시 장바구니에 다시 담기
            pstmt = conn.prepareStatement(DBConnect.RETURN_CART);
            pstmt.setString(1, cid);
            pstmt.setInt(2, pno);
            pstmt.setInt(3, amount);
            cnt = cnt + pstmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public List<Payment> getMyPaymentList(String cnum, String cid) {
        List<Payment> payList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PAYMENT_SELECT_LIST);
            pstmt.setString(1, cid);
            pstmt.setString(2, cnum);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Payment pay = new Payment();
                pay.setSno(rs.getInt("sno"));
                pay.setCid(rs.getString("cid"));
                pay.setPno(rs.getInt("pno"));
                pay.setAmount(rs.getInt("amount"));
                payList.add(pay);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return payList;
    }

    public int returnPayments(String cnum, String cid, List<Payment> payList) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            conn.setAutoCommit(false);

            // 1. 반품 시 배송 정보 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_DELIVERIES);
            pstmt.setString(1, cnum);
            cnt = cnt + pstmt.executeUpdate();

            // 2. 반품 시 출고 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_SERVES);
            pstmt.setString(1, cnum);
            cnt = cnt + pstmt.executeUpdate();

            // 3. 반품 시 결제 내용 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_PAYMENTS);
            pstmt.setString(1, cnum);
            cnt = cnt + pstmt.executeUpdate();

            // 4. 반품 시 장바구니에 다시 담기
            for(Payment pay:payList) {
                pstmt = conn.prepareStatement(DBConnect.RETURN_CART);
                pstmt.setString(1, cid);
                pstmt.setInt(2, pay.getPno());
                pstmt.setInt(3, pay.getAmount());
                cnt = cnt + pstmt.executeUpdate();
            }
            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public List<ReviewVO> getReviewPayList(String cid) {
        List<ReviewVO> reviewList = new ArrayList<>();

        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.SELECT_REVIEW_LIST);
            pstmt.setString(1, cid);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                ReviewVO review = new ReviewVO();
                review.setSno(rs.getInt("sno"));
                review.setPname(rs.getString("pname"));
                review.setAmount(rs.getInt("amount"));
                review.setRdate(rs.getString("rdate"));
                reviewList.add(review);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return reviewList;
    }

}
