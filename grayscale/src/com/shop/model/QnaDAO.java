package com.shop.model;

import com.shop.dto.Notice;
import com.shop.dto.Qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QnaDAO {

    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Qna> getQnaList(int pageSize){
        List<Qna> qnaList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_LIMIT);
            pstmt.setInt(1, pageSize);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Qna qna = new Qna();
                qna.setQno(rs.getInt("qno"));
                qna.setTitle(rs.getString("title"));
                qna.setContent(rs.getString("content"));
                qna.setAuthor(rs.getString("author"));
                qna.setLev(rs.getInt("lev"));

                // 작성일 포맷
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(rs.getString("resdate"));
                qna.setResdate(sdf.format(d));

                qnaList.add(qna);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return qnaList;
    }

    public Qna getQna(int qno){
        Qna qna = new Qna();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_ONE);
            pstmt.setInt(1, qno);
            rs = pstmt.executeQuery();

            if(rs.next()){
                qna.setQno(rs.getInt("qno"));
                qna.setTitle(rs.getString("title"));
                qna.setContent(rs.getString("content"));
                qna.setAuthor(rs.getString("author"));
                qna.setLev(rs.getInt("lev"));

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = sdf.parse(rs.getString("resdate"));
                qna.setResdate(sdf.format(d));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return qna;
    }

    public int addQuestion(Qna qna){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            // 질문 글 추가하기
            pstmt = conn.prepareStatement(DBConnect.QNA_INSERT);
            pstmt.setString(1, qna.getTitle());
            pstmt.setString(2, qna.getContent());
            pstmt.setString(3, qna.getAuthor());
            pstmt.setInt(4, qna.getLev());
            pstmt.setInt(5, 0);
            cnt = pstmt.executeUpdate();
            pstmt.close();

            // 질문 글 par 수정하기
            pstmt = conn.prepareStatement(DBConnect.QNA_UPDATE_PAR);
            cnt += pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int addAnswer(Qna qna){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            // 답변 글 추가하기
            pstmt = conn.prepareStatement(DBConnect.QNA_INSERT);
            pstmt.setString(1, qna.getTitle());
            pstmt.setString(2, qna.getContent());
            pstmt.setString(3, qna.getAuthor());
            pstmt.setInt(4, qna.getLev());
            pstmt.setInt(5, qna.getPar());
            cnt = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int updateQna(Qna qna){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "update qna set title=?, content=? where qno=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, qna.getTitle());
            pstmt.setString(2, qna.getContent());
            pstmt.setInt(3, qna.getQno());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int deleteQna(int qno){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.QNA_DELETE);
            pstmt.setInt(1, qno);
            pstmt.setInt(2, qno);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

}
