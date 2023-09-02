package com.shop.controller.admin;

import com.shop.dto.Delivery;
import com.shop.model.DeliveryDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateDeliveryPro.do")
public class UpdateDeliveryProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int dno = Integer.parseInt(request.getParameter("dno"));
        int type = Integer.parseInt(request.getParameter("type"));
        int cnt = 0;

        Delivery del = new Delivery();
        del.setDno(dno);
        del.setRdate(request.getParameter("rdate"));
        del.setSdate(request.getParameter("sdate"));
        del.setPcom(request.getParameter("pcom"));
        del.setPtel(request.getParameter("ptel"));
        del.setPstate(Integer.parseInt(request.getParameter("pstate")));
        del.setBcode(request.getParameter("bcode"));
        DeliveryDAO dao = new DeliveryDAO();

        cnt = (type == 1) ? dao.updateDelivery(del) : dao.updateDeliveryCode(del);

        PrintWriter out = response.getWriter();

        if(cnt>0){
            response.sendRedirect(request.getContextPath() + "/DeliveryList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
