package com.shop.controller.Qna;

import com.shop.dto.Notice;
import com.shop.dto.Qna;
import com.shop.model.NoticeDAO;
import com.shop.model.QnaDAO;
import com.shop.util.Page;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/QnaList.do")
public class QnaListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "QnA 목록을 출력합니다.");

        int curPage = Integer.parseInt(request.getParameter("page"));

        QnaDAO dao = new QnaDAO();
        List<Qna> qnaList = dao.getQnaList((curPage - 1) * 10);
        request.setAttribute("qnaList", qnaList);

        // 페이징 처리
        Page page = new Page();
        try {
            page.paging(curPage, 10, 5, "qna");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("paging", page);
        request.setAttribute("curPage", curPage);

        RequestDispatcher view = request.getRequestDispatcher("/qna/qnaList.jsp");
        view.forward(request, response);
    }
}
