package com.shop.controller.product;

import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Product.do")
public class ProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pno = Integer.parseInt(request.getParameter("pno"));

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProduct(pno);

        // 연관된 제품 가져오기
        List<Product> relatedProducts = dao.getRelated(pno);

        request.setAttribute("relProducts", relatedProducts);
        request.setAttribute("product", product);
        RequestDispatcher view = request.getRequestDispatcher("/product/product.jsp");
        view.forward(request, response);
    }
}
