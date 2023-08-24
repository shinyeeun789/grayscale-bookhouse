package com.shop.util;

import com.shop.model.DBConnect;
import com.shop.model.PostgreCon;
import org.junit.runner.Request;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Page {
    private int startRow;
    private int endRow;
    private boolean prev = true;
    private boolean next = true;
    private List<Integer> pageList;

    public void paging(int pageNum, int pageSize, int pageBlock, String dbName) throws SQLException {
        // 전체 데이터 개수 가져오기
        int totalCount = 0;             // 전체 페이지 수

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DBConnect con = new PostgreCon();
        conn = con.connect();
        switch(dbName) {
            case "notice":
                pstmt = conn.prepareStatement(DBConnect.SELECT_NOTICE_COUNT);
                break;
        }
        rs = pstmt.executeQuery();
        if(rs.next()) {
            totalCount = rs.getInt("cnt");
        }

        int totalPage = (int) Math.ceil((double)totalCount / pageSize);
        startRow = (pageNum - 1) * pageSize + 1;            // 해당 페이지에 처음 출력될 글
        endRow = pageNum * pageSize;                        // 해당 페이지에 마지막으로 출력될 글

        int startPage = (int) ((pageNum - 1) / pageBlock) * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if(endPage > totalPage) {
            endPage = totalPage;
        }

        prev = (startPage < pageBlock) ? false : true;
        next = (endPage < totalPage) ? true : false;

        pageList = new ArrayList<>();

        for(int i=startPage; i<=endPage; i++) {
            pageList.add(i);
        }
    }

    public int getStartRow() {
        return startRow;
    }

    public int getEndRow() {
        return endRow;
    }

    public List<Integer> getPageList() {
        return pageList;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }
}
