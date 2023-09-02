package com.shop.controller.custom;

import com.shop.dto.Payment;
import com.shop.model.PaymentDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReturnPayments.do")
public class ReturnPaymentsCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cnum = request.getParameter("cnum");

        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        PaymentDAO payDAO = new PaymentDAO();
        List<Payment> payList = payDAO.getMyPaymentList(cnum, cid);

        int cnt = payDAO.returnPayments(cnum, cid, payList);

        String msg = "fail";
        if(cnt > 1) {
            msg = "success";
        }
        response.sendRedirect(request.getContextPath() + "/MyOrderList.do?msg="+msg);
    }
}
