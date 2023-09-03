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
    final static String SELECT_PRODUCT_PRICE = "select price from product where pno=?";

    // Payment 테이블 SQL문
    final static String SELECT_SNO = "select sno from payment order by sno desc limit 1";
    final static String INSERT_PAYMENT = "insert into payment(cid, pno, amount, pmethod, pcom, cnum, payprice) values(?,?,?,?,?,?,?)";
    final static String PAYMENT_SELECT_ONE = "select * from payment where pno=?";
    final static String PAYMENT_SELECT_LIST = "select * from payment where cid=? and cnum=?";
    final static String PAYINFO_SELECT_ONE = "select sno, pro.pno, pname, amount, payprice from payment pay, product pro where pay.pno=pro.pno and sno=?";
    final static String SELECT_REVIEW_LIST = "select a.sno, pname, amount, rdate from payment a, delivery b, product c where a.sno=b.sno and a.pno=c.pno and a.cid=? and pstate=4 and a.sno not in (select sno from review)";
    final static String SELECT_ADMIN_REVIEW_LIST = "select rno, pname, cid, star, content from review a, product b where a.pno=b.pno";

    // Delivery 테이블 SQL문
    final static String INSERT_DELIVERY = "insert into delivery(cid, daddr, custel) values(?,?,?)";
    final static String UPDATE_DELIVERY_SNO = "update delivery set sno=dno where sno=0";
    final static String DELIVERY_PRODUCT_SELECT_ALL = "SELECT a.dno AS dno, b.cid, pname, payprice, pstate, sdate FROM delivery a, payment b, product c WHERE a.sno=b.sno AND b.pno=c.pno AND pstate=0 order by sdate, dno";
    final static String DELCODE_GROUP_LIST = "select a.dno as dno, cnum, pname, sdate, rdate, bcode, pstate from delivery a, payment b, product c where a.sno=b.sno and b.pno=c.pno and bcode != '' and pstate < 4 group by cnum, dno, pname, sdate, rdate, bcode";
    final static String DELIVERY_PRODUCT_SELECT_ONE = "SELECT a.dno, pname, b.cid, sdate, rdate, a.daddr, custel, a.pcom, ptel, pstate, cnum, bcode FROM delivery a, payment b, product c WHERE a.sno=b.sno AND b.pno=c.pno AND a.dno=?";
    final static String DELIVERY_UPDATE = "update delivery set rdate=?, pcom=?, ptel=?, pstate=?, bcode=? where dno=?";
    final static String DELIVERY_UPDATE_WITH_DELCODE = "update delivery set rdate=?, pcom=?, ptel=?, pstate=?, bcode=? where bcode=?";

    // 리뷰 테이블 SQL문
    final static String REVIEW_CID_SELECT = "select rno, pname, star, content from review r join product p on(r.pno=p.pno) where cid=?";
    final static String INSERT_REVIEW = "insert into review(sno, pno, star, content, cid) values(?,?,?,?,?)";
    final static String REVIEW_DELETE = "delete from review where rno=?";
    final static String SELECT_REVIEW_PNO_LIST = "select * from review where pno=?";

    //입고 처리 패턴
    final static String RECEIVE_INSERT = "insert into receive(pno, amount, rprice) values (?, ?, ?) on conflict(pno) " +
            "do update set amount = (select amount from receive where pno=?)+?, rprice=((select rprice from receive where pno=?) + ?)/2";
    final static String CATEGORY_LOAD = "select * from category";

    // 장바구니 테이블 SQL문
    final static String CART_INSERT = "insert into cart values (?, ?, ?, ?) on conflict(cartno) " +
            "do update set amount = (select amount from cart where cartno=?)+?";
    final static String CART_DELETE = "delete from cart where cartno=?";
    final static String CART_SELECT_CID = "select cartno, cid, c.pno, pname, amount, price from cart c, product p where c.pno=p.pno and cid=?";

    // 재고 조회
    final static String INVENTORY_SELECT_ONE = "select * from inventory where pno=?";

    // 출고 처리 패턴
    final static String SERVE_PAYMENT = "insert into payment values (default, ?, ?, ?, ?, ?, ?, ?)";
    final static String INSERT_SERVE = "insert into serve values(default, ?, ?, ?, default)";
    
    // 마이페이지 주문배송조회
    final static String SELECT_MY_ORDER_LIST = "select pay.sno as sno, sdate, cnum, pname, amount, payprice, pstate from payment pay, delivery del, product pro where pay.sno = del.sno and pro.pno=pay.pno and pay.cid=? order by sdate desc";

    // 반품 처리 SQL문
    final static String RETURN_PAYMENT = "delete from payment where sno=?";
    final static String RETURN_PAYMENTS = "delete from payment where cnum=?";
    final static String RETURN_SERVE = "delete from serve where sno=?";
    final static String RETURN_SERVES = "delete from serve where sno in (select sno from payment where cnum=?)";
    final static String RETURN_CART = "insert into cart values (default, ?, ?, ?)";
    final static String RETURN_DELIVERY = "delete from delivery where sno=?";
    final static String RETURN_DELIVERIES = "delete from delivery where sno in (select sno from payment where cnum=?)";


    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);
}
