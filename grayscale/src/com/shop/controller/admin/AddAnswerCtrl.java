package com.shop.controller.admin;

import com.shop.dto.Notice;
import com.shop.dto.Qna;
import com.shop.model.NoticeDAO;
import com.shop.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddAnswer.do")
public class AddAnswerCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "답변 글 등록폼이 로딩되었습니다.";
        int qno = Integer.parseInt(request.getParameter("qno"));

        QnaDAO dao = new QnaDAO();
        Qna qna = dao.getQna(qno);

        request.setAttribute("qna", qna);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/addAnswer.jsp");
        view.forward(request, response);
    }
}
