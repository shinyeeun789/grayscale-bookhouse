package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DBConnect {
    // 공지사항 테이블 SQL문
    final static String SELECT_NOTICE_COUNT = "select count(*) as cnt from notice";
    final static String NOTICE_SELECT_ALL = "select * from notice order by no desc";
    final static String NOTICE_SELECT_ONE = "select * from notice where no=?";
    final static String NOTICE_INSERT = "insert into notice values (default,?,?,default,default);";
    final static String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
    final static String NOTICE_DELETE = "delete from notice where no=?";

    // 회원 테이블 SQL문
    final static String CUSTOM_SELECT_ALL = "select * from custom order by regdate desc";
    final static String CUSTOM_SELECT_ONE = "select * from custom where id=?";
    final static String CUSTOM_SELECT_LOG = "select * from custom where id=?";
    final static String CUSTOM_INSERT = "insert into custom(id, pw, name, tel, email, birth, addr, postcode) values (?, ?, ?, ?, ?, ?::timestamp, ?, ?)";
    final static String CUSTOM_UPDATE = "update custom set pw=?, tel=?, email=?, birth=?::timestamp, addr=?, postcode=? where id=?";
    final static String CUSTOM_DELETE = "delete from custom where id=?";

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);
}
