package com.shop.controller.payment;

import com.shop.model.CartDAO;
import com.shop.model.CustomDAO;
import com.shop.vo.CartVO;
import com.shop.vo.CustomVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddPayment.do")
public class AddPaymentCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        CartDAO cartDAO = new CartDAO();
        List<CartVO> cartList = cartDAO.getByIdCartList(sid);
        request.setAttribute("cartList", cartList);

        CustomDAO cusDAO = new CustomDAO();
        CustomVO customVO = cusDAO.getCustomVO(sid);
        request.setAttribute("custom", customVO);

        RequestDispatcher view = request.getRequestDispatcher("/payment/addPayment.jsp");
        view.forward(request, response);

    }
}
