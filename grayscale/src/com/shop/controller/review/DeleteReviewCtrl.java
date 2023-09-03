package com.shop.controller.review;

import com.shop.model.NoticeDAO;
import com.shop.model.ReviewDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delReview.do")
public class DeleteReviewCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rno = Integer.parseInt(request.getParameter("rno"));
        int type = Integer.parseInt(request.getParameter("type"));

        ReviewDAO dao = new ReviewDAO();
        int cnt = dao.deleteReview(rno);

        PrintWriter out = response.getWriter();

        if(cnt>0){
            if(type == 1) {
                response.sendRedirect(request.getContextPath() + "/AdminReview.do");
            } else {
                response.sendRedirect(request.getContextPath() + "/ReviewList.do");
            }
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
