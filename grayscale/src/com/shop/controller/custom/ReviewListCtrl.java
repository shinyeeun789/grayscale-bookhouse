package com.shop.controller.custom;

import com.shop.dto.Payment;
import com.shop.dto.Review;
import com.shop.model.PaymentDAO;
import com.shop.model.ReviewDAO;
import com.shop.vo.MyReviewVO;
import com.shop.vo.ReviewVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReviewList.do")
public class ReviewListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        PaymentDAO payDao = new PaymentDAO();
        List<ReviewVO> reviewList = payDao.getReviewPayList(cid);

        ReviewDAO reviewDAO = new ReviewDAO();
        List<MyReviewVO> myReview = reviewDAO.getMyReview(cid);

        request.setAttribute("reviewList", reviewList);
        request.setAttribute("myReview", myReview);

        RequestDispatcher view = request.getRequestDispatcher("/custom/reviewList.jsp");
        view.forward(request, response);
    }
}
