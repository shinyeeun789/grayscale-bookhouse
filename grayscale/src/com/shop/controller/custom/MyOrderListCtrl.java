package com.shop.controller.custom;

import com.shop.model.CustomDAO;
import com.shop.vo.MyOrderVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/MyOrderList.do")
public class MyOrderListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        CustomDAO dao = new CustomDAO();
        List<MyOrderVO> orderList = dao.getMyOrderList(cid);

        request.setAttribute("orderList", orderList);

        RequestDispatcher view = request.getRequestDispatcher("/custom/myorderList.jsp");
        view.forward(request, response);
    }
}
