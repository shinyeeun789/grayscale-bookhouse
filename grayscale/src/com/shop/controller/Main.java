package com.shop.controller;

import com.shop.dto.Notice;
import com.shop.dto.Product;
import com.shop.model.NoticeDAO;
import com.shop.model.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Main extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        String realPath = request.getSession().getServletContext().getRealPath("/");
        application.setAttribute("realPath", realPath);  //${realPath }

        // 인기상품 및 신상품 데이터 가져오기
        ProductDAO proDAO = new ProductDAO();
        List<Product> bestList = proDAO.getBestProductList(8);
        List<Product> newList = proDAO.getNewProductList(8);
        request.setAttribute("bestList", bestList);
        request.setAttribute("newList", newList);

        // 공지사항 데이터 가져오기
        NoticeDAO noticeDAO = new NoticeDAO();
        List<Notice> noticeList = noticeDAO.getMainNotices();
        request.setAttribute("noticeList", noticeList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
        view.forward(request, response);
    }
}
