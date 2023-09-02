package com.shop.model;

import com.shop.dto.Delivery;
import com.shop.dto.Payment;
import com.shop.dto.Serve;
import com.shop.vo.CartVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

            // 3. 배송 데이터 추가
            pstmt = conn.prepareStatement(DBConnect.INSERT_DELIVERY);
            pstmt.setInt(1, del.getSno());
            pstmt.setString(2, del.getCid());
            pstmt.setString(3, del.getDaddr());
            pstmt.setString(4, del.getCustel());
            cnt += pstmt.executeUpdate();

            // 4. 장바구니 데이터 제거
            pstmt = conn.prepareStatement(DBConnect.CART_DELETE);
            pstmt.setInt(1, cart.getCartno());
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

}
