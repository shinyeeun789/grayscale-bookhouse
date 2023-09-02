package com.shop.model;

import com.shop.dto.Delivery;
import com.shop.vo.DeliveryVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {

    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<DeliveryVO> getAdminDeliveryList() {
        List<DeliveryVO> delList = new ArrayList<>();
        DBConnect con = new PostgreCon();

        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_PRODUCT_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                DeliveryVO del = new DeliveryVO();
                del.setDno(rs.getInt("dno"));
                del.setPname(rs.getString("pname"));
                del.setCid(rs.getString("cid"));
                del.setPstate(rs.getInt("pstate"));
                del.setSdate(rs.getString("sdate"));
                delList.add(del);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return delList;
    }

    public List<DeliveryVO> getDelCodeList() {
        List<DeliveryVO> delList = new ArrayList<>();
        DBConnect con = new PostgreCon();

        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELCODE_GROUP_LIST);
            rs = pstmt.executeQuery();
            while (rs.next()){
                DeliveryVO del = new DeliveryVO();
                del.setDno(rs.getInt("dno"));
                del.setCnum(rs.getString("cnum"));
                del.setPname(rs.getString("pname"));
                del.setSdate(rs.getString("sdate"));
                del.setRdate(rs.getString("rdate"));
                del.setPstate(rs.getShort("pstate"));
                del.setBcode(rs.getString("bcode"));
                delList.add(del);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return delList;
    }

    public DeliveryVO getDeliveryVO(int dno) {
        DeliveryVO del = new DeliveryVO();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_PRODUCT_SELECT_ONE);
            pstmt.setInt(1, dno);
            rs = pstmt.executeQuery();
            if(rs.next()){
                del.setDno(rs.getInt("dno"));
                del.setPname(rs.getString("pname"));
                del.setCid(rs.getString("cid"));
                del.setSdate(rs.getString("sdate"));
                del.setRdate(rs.getString("rdate"));
                del.setAddr(rs.getString("daddr"));
                del.setCustel(rs.getString("custel"));
                del.setPcom(rs.getString("pcom"));
                del.setPtel(rs.getString("ptel"));
                del.setPstate(rs.getInt("pstate"));
                del.setCnum(rs.getString("cnum"));
                del.setBcode(rs.getString("bcode"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return del;
    }

    public int updateDelivery(Delivery delivery) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_UPDATE);
            pstmt.setString(1, delivery.getRdate());
            pstmt.setString(2, delivery.getPcom());
            pstmt.setString(3, delivery.getPtel());
            pstmt.setInt(4, delivery.getPstate());
            pstmt.setString(5, delivery.getBcode());
            pstmt.setInt(6, delivery.getDno());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int updateDeliveryCode(Delivery delivery) {
        int cnt =0;
        DBConnect con = new PostgreCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_UPDATE_WITH_DELCODE);
            pstmt.setString(1, delivery.getRdate());
            pstmt.setString(2, delivery.getPcom());
            pstmt.setString(3, delivery.getPtel());
            pstmt.setInt(4, delivery.getPstate());
            pstmt.setString(5, delivery.getBcode());
            pstmt.setString(6, delivery.getBcode());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

}
