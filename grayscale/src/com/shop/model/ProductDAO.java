package com.shop.model;

import com.shop.dto.Category;
import com.shop.dto.Notice;
import com.shop.dto.Product;
import com.shop.vo.ProductListVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductDAO {

    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Category> getCategoryList() {
        List<Category> cateList = new ArrayList<Category>();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CATEGORY_LOAD);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Category cate = new Category();
                cate.setCno(rs.getString("cno"));
                cate.setCname(rs.getString("cname"));
                cateList.add(cate);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cateList;
    }

    public List<ProductListVO> getProductList() {
        List<ProductListVO> proList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_ALL_WITH_CATE);
            rs = pstmt.executeQuery();
            while(rs.next()){
                ProductListVO pro = new ProductListVO();
                pro.setPname(rs.getString("pname"));
                pro.setCname(rs.getString("cname"));
                pro.setRprice(rs.getInt("rprice"));
                pro.setPrice(rs.getInt("price"));
                pro.setAmount(rs.getInt("amount"));

                proList.add(pro);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return proList;
    }

    public int addProduct(Product pro) {
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_INSERT);
            pstmt.setString(1, pro.getCate());
            pstmt.setString(2, pro.getPname());
            pstmt.setString(3, pro.getPcomment());
            pstmt.setString(4, pro.getPlist());
            pstmt.setInt(5, pro.getPrice());
            pstmt.setString(6, pro.getImgSrc1());
            pstmt.setString(7, pro.getImgSrc2());
            pstmt.setString(8, pro.getImgSrc3());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }

        con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_INSERT_UPDATE);
            cnt = cnt + pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

}
