package com.shop.controller.Qna;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddQuestion.do")
public class AddQuestionCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "질문 글 등록폼이 로딩되었습니다.";

        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/qna/addQuestion.jsp");
        view.forward(request, response);
    }
}
