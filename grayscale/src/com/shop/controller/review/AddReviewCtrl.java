package com.shop.controller.review;

import com.shop.model.ReviewDAO;
import com.shop.vo.ReviewVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddReview.do")
public class AddReviewCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sno = Integer.parseInt(request.getParameter("sno"));

        ReviewDAO dao = new ReviewDAO();
        ReviewVO reviewVO = dao.getPayInfoOne(sno);

        request.setAttribute("payInfo", reviewVO);
        RequestDispatcher view = request.getRequestDispatcher("/review/addReview.jsp");
        view.forward(request, response);
    }
}
