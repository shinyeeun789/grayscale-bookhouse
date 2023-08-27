package com.shop.controller.Qna;

import com.shop.dto.Qna;
import com.shop.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateQnaPro.do")
public class UpdateQnaProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Qna qna = new Qna();
        qna.setQno(Integer.parseInt(request.getParameter("qno")));
        qna.setTitle(request.getParameter("title"));
        qna.setContent(request.getParameter("content"));

        QnaDAO dao = new QnaDAO();
        int a = dao.updateQna(qna);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath() + "/getQna.do?qno="+qna.getQno());
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
