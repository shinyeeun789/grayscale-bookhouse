package com.shop.controller.review;

import com.shop.model.ReviewDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddReviewPro.do")
public class AddReviewProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String cid = (String)session.getAttribute("sid");

        int sno = Integer.parseInt(request.getParameter("sno"));
        int pno = Integer.parseInt(request.getParameter("pno"));
        int star = Integer.parseInt(request.getParameter("star"));
        String content = request.getParameter("content").replace("\r\n", "<br>");

        ReviewDAO dao = new ReviewDAO();
        int cnt = dao.addReview(sno, pno, star, content, cid);

        String msg = "fail";
        if(cnt > 0) {
            msg = "success";
        }
        response.sendRedirect(request.getContextPath() + "/ReviewList.do?msg="+msg);
    }
}
