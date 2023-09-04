package com.shop.controller.cart;

import com.shop.model.CartDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteCart.do")
public class DelCartCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cartno = request.getParameter("cartno");

        CartDAO dao = new CartDAO();
        int cnt = dao.delCart(cartno);

        PrintWriter out = response.getWriter();

        if(cnt > 0) {
            response.sendRedirect(request.getContextPath()+"/CartList.do");
        } else {
            out.println("<script> history.go(-1) </script>");
        }
    }
}
