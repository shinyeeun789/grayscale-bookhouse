package com.shop.controller.custom;

import com.shop.dto.Payment;
import com.shop.model.PaymentDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReturnPaymentOne.do")
public class ReturnPaymentOneCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        int sno = Integer.parseInt(request.getParameter("sno"));
        String cid = (String)session.getAttribute("sid");

        PaymentDAO payDAO = new PaymentDAO();
        Payment pay = payDAO.getPayment(sno);

        int cnt = payDAO.returnPaymentOne(sno, pay.getPno(), pay.getAmount(), cid);

        String msg = "fail";
        if(cnt >= 4) {
            msg = "success";
        }
        response.sendRedirect(request.getContextPath() + "/MyOrderList.do?msg="+msg);
    }
}
