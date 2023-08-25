package com.shop.controller.Qna;

import com.shop.dto.Qna;
import com.shop.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/getQna.do")
public class GetQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qno = Integer.parseInt(request.getParameter("qno"));
        QnaDAO dao = new QnaDAO();
        Qna qna = dao.getQna(qno);
        request.setAttribute("qna", qna);
        RequestDispatcher view = request.getRequestDispatcher("/qna/getQna.jsp");
        view.forward(request, response);
    }
}
