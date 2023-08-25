package com.shop.controller.admin;

import com.shop.model.NoticeDAO;
import com.shop.model.QnaDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteQna.do")
public class DeleteQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qno = Integer.parseInt(request.getParameter("qno"));

        QnaDAO dao = new QnaDAO();
        int a = dao.deleteQna(qno);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath() + "/QnaList.do?page=1");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
