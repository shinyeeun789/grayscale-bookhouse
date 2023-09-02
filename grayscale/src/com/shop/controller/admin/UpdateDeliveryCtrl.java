package com.shop.controller.admin;

import com.shop.model.DeliveryDAO;
import com.shop.vo.DeliveryVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateDelivery.do")
public class UpdateDeliveryCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int dno = Integer.parseInt(request.getParameter("dno"));

        DeliveryDAO dao = new DeliveryDAO();
        DeliveryVO delivery = dao.getDeliveryVO(dno);

        request.setAttribute("delivery", delivery);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/updateDelivery.jsp");
        view.forward(request, response);
    }
}
