package com.shop.controller.notice;

import com.shop.dto.Notice;
import com.shop.model.NoticeDAO;
import com.shop.util.Page;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/NoticeList.do")
public class NoticeListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "공지사항 목록을 출력합니다.");

        int curPage = Integer.parseInt(request.getParameter("page"));

        NoticeDAO dao = new NoticeDAO();
        List<Notice> notiList = dao.getNoticeList();
        request.setAttribute("notiList", notiList);
        
        // 페이징 처리
        Page page = new Page();
        try {
            page.paging(curPage, 10, 10, "notice");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("paging", page);
        request.setAttribute("curPage", curPage);

        RequestDispatcher view = request.getRequestDispatcher("/notice/noticeList.jsp");
        view.forward(request, response);
    }
}
