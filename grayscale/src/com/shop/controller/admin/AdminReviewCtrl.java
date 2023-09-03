package com.shop.controller.admin;

import com.shop.model.PaymentDAO;
import com.shop.model.ReviewDAO;
import com.shop.vo.MyReviewVO;
import com.shop.vo.ReviewVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminReview.do")
public class AdminReviewCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ReviewDAO reviewDAO = new ReviewDAO();
        List<MyReviewVO> reviewList = reviewDAO.getReviewList();

        request.setAttribute("reviewList", reviewList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/adminReview.jsp");
        view.forward(request, response);
    }
}
