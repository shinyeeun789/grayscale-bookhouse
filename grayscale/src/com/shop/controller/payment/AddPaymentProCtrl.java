package com.shop.controller.payment;

import com.shop.dto.Cart;
import com.shop.dto.Delivery;
import com.shop.dto.Payment;
import com.shop.dto.Serve;
import com.shop.model.CartDAO;
import com.shop.model.PaymentDAO;
import com.shop.vo.CartVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddPaymentPro.do")
public class AddPaymentProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int payCnt = 0;
        int cnt = 0;

        HttpSession session = request.getSession();
        String cid = (String)session.getAttribute("sid");
        CartDAO cartDAO = new CartDAO();
        List<CartVO> cartList = cartDAO.getByIdCartList(cid);

        // 결제 처리 리스트
        PaymentDAO payDAO = new PaymentDAO();

        List<Payment> payList = new ArrayList<>();
        for(CartVO cart : cartList) {
            Payment payment = new Payment();
            payment.setCid(cid);
            payment.setPno(cart.getPno());
            payment.setAmount(cart.getAmount());
            payment.setPmethod(request.getParameter("pmethod"));
            payment.setPcom(request.getParameter("pcom"));
            payment.setCnum(request.getParameter("cnum"));
            payment.setPayprice(Integer.parseInt(request.getParameter("payAmount")));
            payList.add(payment);
        }

        List<Delivery> delList = new ArrayList<>();
        for(CartVO cart : cartList) {
            Delivery delivery = new Delivery();
            delivery.setSno(payDAO.getSno());
            delivery.setCid(cid);
            delivery.setDaddr(request.getParameter("addr1")+"<br>"+request.getParameter("addr2")+"<br>"+request.getParameter("postcode"));
            delivery.setCustel(request.getParameter("tel"));
            delList.add(delivery);
        }

        // 출고 처리 리스트
        List<Serve> serveList = new ArrayList<>();
        for (CartVO cart : cartList) {
            Serve serve = new Serve();
            serve.setPno(cart.getPno());
            serve.setAmount(cart.getAmount());
            serve.setSprice(cart.getPrice());
            serveList.add(serve);
        }

        // 결제 처리 트랜잭션
        for(int i=0; i<cartList.size(); i++) {
            cnt += payDAO.addPayments(payList.get(i), delList.get(i), cartList.get(i));
        }

        response.sendRedirect(request.getContextPath() + "/MyOrderList.do");
    }
}
