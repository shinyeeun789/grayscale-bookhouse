package com.shop.controller.admin;

import com.shop.model.ProductDAO;
import com.shop.vo.ProductListVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminProList.do")
public class AdminProListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "관리자 페이지의 상품 리스트입니다.";

        ProductDAO dao = new ProductDAO();
        List<ProductListVO> proList = dao.getProductList();

        request.setAttribute("msg", msg);
        request.setAttribute("proList", proList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/adminProductList.jsp");
        view.forward(request,response);
    }
}
