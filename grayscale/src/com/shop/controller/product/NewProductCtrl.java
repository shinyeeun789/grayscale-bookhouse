package com.shop.controller.product;

import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/NewProduct.do")
public class NewProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "신상품 리스트를 출력합니다.");

        // 데이터 가져오기
        ProductDAO dao = new ProductDAO();
        List<Product> proList = dao.getNewProductList(21);

        request.setAttribute("proList", proList);
        RequestDispatcher view = request.getRequestDispatcher("/product/newProductList.jsp");
        view.forward(request, response);
    }
}
