package com.shop.controller.Qna;

import com.shop.dto.Qna;
import com.shop.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateQna.do")
public class UpdateQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "Q&A의 내용을 수정합니다.";
        int qno = Integer.parseInt(request.getParameter("qno"));

        QnaDAO dao = new QnaDAO();
        Qna qna = dao.getQna(qno);

        request.setAttribute("msg", msg);
        request.setAttribute("qna", qna);

        RequestDispatcher view = request.getRequestDispatcher("/qna/updateQna.jsp");
        view.forward(request,response);
    }
}
