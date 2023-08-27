package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DBConnect {
    // 공지사항 테이블 SQL문
    final static String SELECT_NOTICE_COUNT = "select count(*) as cnt from notice";
    final static String NOTICE_SELECT_ALL = "select * from notice order by no desc";
    final static String NOTICE_SELECT_LIMIT = "select * from notice order by no desc limit 10 offset ?";
    final static String NOTICE_SELECT_ONE = "select * from notice where no=?";
    final static String NOTICE_INSERT = "insert into notice values (default,?,?,default,default)";
    final static String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
    final static String NOTICE_DELETE = "delete from notice where no=?";

    // 회원 테이블 SQL문
    final static String CUSTOM_SELECT_ALL = "select * from custom order by regdate desc";
    final static String CUSTOM_SELECT_ONE = "select * from custom where id=?";
    final static String CUSTOM_SELECT_LOG = "select * from custom where id=?";
    final static String CUSTOM_INSERT = "insert into custom(id, pw, name, tel, email, birth, addr, postcode) values (?, ?, ?, ?, ?, ?::timestamp, ?, ?)";
    final static String CUSTOM_UPDATE = "update custom set pw=?, tel=?, email=?, birth=?::timestamp, addr=?, postcode=? where id=?";
    final static String CUSTOM_DELETE = "delete from custom where id=?";

    // QnA 테이블 SQL문
    final static String QNA_SELECT_ALL = "select * from qna order by qno desc";
    final static String QNA_SELECT_ONE = "select * from qna where qno=?";
    final static String QNA_SELECT_LIMIT = "SELECT * FROM qna order BY par DESC, lev ASC, qno ASC LIMIT 10 OFFSET ?";
    final static String SELECT_QNA_COUNT = "select count(*) as cnt from qna";
    final static String QNA_INSERT = "insert into qna(title,content,author,lev,par) values(?,?,?,?,?)";
    final static String QNA_UPDATE = "update qna set title=?, content=? where qno=?";
    final static String QNA_UPDATE_PAR = "update qna set par=qno where lev=0 and par=0";
    final static String QNA_DELETE = "DELETE FROM qna WHERE qno=(SELECT qno FROM qna WHERE lev=1 AND qno=?) OR par=(SELECT par FROM qna WHERE lev=0 AND par=?)";

    // Product 테이블 SQL문
    final static String SELECT_PRODUCT_COUNT = "select count(*) as cnt from product";
    final static String SELECT_PRODUCT_COUNT_WITH_CATE = "select count(*) as cnt from product where cate=?";
    final static String PRODUCT_SELECT_ALL = "select * from product order by pno";
    final static String PRODUCT_LIST_LIMIT = "SELECT * FROM product order BY pno DESC LIMIT 12 OFFSET ?";
    final static String PRODUCT_LIST_CATE_LIMIT = "SELECT * FROM product where cate=? order BY pno DESC LIMIT 12 OFFSET ?";
    final static String SELECT_PRODUCTVO = "select pname, cname, i.rprice, i.amount as amount, price " +
            "from product p left outer join receive r on(p.pno=r.pno) left outer join category c on(p.cate=c.cno) left outer join inventory i on(i.pno=p.pno)";
    final static String SELECT_PNO_PRODUCT = "select * from product where pno=?";
    final static String SELECT_RELATED = "select * from product where cate in (select cate from product where pno=?) order by random() limit 4";
    final static String PRODUCT_INSERT = "insert into product values(default, ?, '', ?, ?, ?, ?, ?, ?, ?, default)";
    final static String PRODUCT_INSERT_UPDATE = "update product set prono = concat(cate, pno) where pno in (select pno from product order by resdate desc limit 1)";

    //입고 처리 패턴
    final static String RECEIVE_INSERT = "insert into receive(pno, amount, rprice) values (?, ?, ?) on conflict(pno) " +
            "do update set amount = (select amount from receive where pno=?)+?, rprice=((select rprice from receive where pno=?) + ?)/2";
    final static String CATEGORY_LOAD = "select * from category";

    // 장바구니 테이블 SQL문
    final static String CART_INSERT = "insert into cart values (default, ?, ?, ?) on conflict(pno) " +
            "do update set amount = (select amount from cart where pno=?)+?";
    final static String CART_DELETE = "delete from cart where cartno=?";
    final static String CART_SELECT_CID = "select cartno, cid, c.pno, pname, amount, price from cart c, product p where c.pno=p.pno and cid=?";

    // 재고 조회
    final static String INVENTORY_SELECT_ONE = "select * from inventory where pno=?";

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);
}
