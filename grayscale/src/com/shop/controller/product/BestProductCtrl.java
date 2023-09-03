package com.shop.controller.product;

import com.shop.dto.Product;
import com.shop.model.DBConnect;
import com.shop.model.PostgreCon;
import com.shop.model.ProductDAO;
import com.shop.util.Page;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/BestProduct.do")
public class BestProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "인기상품 리스트를 출력합니다.");

        // 데이터 가져오기
        ProductDAO dao = new ProductDAO();
        List<Product> proList = dao.getBestProductList();

        request.setAttribute("proList", proList);
        RequestDispatcher view = request.getRequestDispatcher("/product/bestProductList.jsp");
        view.forward(request, response);
    }

}
