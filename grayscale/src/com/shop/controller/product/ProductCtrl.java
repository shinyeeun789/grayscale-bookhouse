package com.shop.controller.product;

import com.shop.dto.Product;
import com.shop.dto.Review;
import com.shop.model.ProductDAO;
import com.shop.model.ReviewDAO;

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
        int amount = dao.getAmount(pno);

        ReviewDAO reviewDAO = new ReviewDAO();
        List<Review> reviews = reviewDAO.getPnoReviewList(pno);

        // 연관된 제품 가져오기
        List<Product> relatedProducts = dao.getRelated(pno);

        request.setAttribute("product", product);
        request.setAttribute("amount", amount);
        request.setAttribute("relProducts", relatedProducts);
        request.setAttribute("reviewList", reviews);

        RequestDispatcher view = request.getRequestDispatcher("/product/product.jsp");
        view.forward(request, response);
    }
}
