package com.shop.controller.Qna;

import com.shop.dto.Qna;
import com.shop.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddQnaPro.do")
public class AddQnaProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int a = 0;
        Qna qna = new Qna();
        HttpSession session = request.getSession();

        qna.setAuthor((String)session.getAttribute("sid"));
        qna.setTitle(request.getParameter("title"));
        qna.setContent(request.getParameter("content"));
        qna.setLev(Integer.parseInt(request.getParameter("lev")));
        int par = request.getParameter("par")!=null ? Integer.parseInt(request.getParameter("par")) : 0;
        qna.setPar(par);

        PrintWriter out = response.getWriter();

        QnaDAO dao = new QnaDAO();
        if(qna.getLev() == 0) {
            a = dao.addQuestion(qna);
        } else {
            a = dao.addAnswer(qna);
        }

        if(a > 0) {
            response.sendRedirect(request.getContextPath() + "/QnaList.do?page=1");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
