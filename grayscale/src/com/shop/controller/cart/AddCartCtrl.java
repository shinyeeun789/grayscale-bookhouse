package com.shop.controller.cart;

import com.shop.dto.Cart;
import com.shop.model.CartDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddCartPro.do")
public class AddCartCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pno = Integer.parseInt(request.getParameter("pno"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        HttpSession session = request.getSession();

        if(session.getAttribute("sid") == null) {
            response.sendRedirect(request.getContextPath() + "/Product.do?msg=fail&pno="+pno);
        } else {
            String cid = (String) session.getAttribute("sid");

            Cart cart = new Cart();
            cart.setCartno(cid.concat(Integer.toString(pno)));
            cart.setPno(pno);
            cart.setCid(cid);
            cart.setAmount(amount);

            CartDAO dao = new CartDAO();
            int cnt = dao.addCart(cart);

            PrintWriter out = response.getWriter();

            if (cnt > 0) {
                response.sendRedirect(request.getContextPath() + "/CartList.do");
            } else {
                out.println("<script> history.go(-1); </script>");
            }
        }
    }
}
