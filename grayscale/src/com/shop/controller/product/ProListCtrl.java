package com.shop.controller.product;

import com.shop.dto.Product;
import com.shop.model.ProductDAO;
import com.shop.util.Page;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ProductList.do")
public class ProListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "상품 리스트를 출력합니다.");
        String cate = request.getParameter("cate");
        int curPage = Integer.parseInt(request.getParameter("page"));

        // 데이터 가져오기
        ProductDAO dao = new ProductDAO();
        List<Product> proList = null;
        if(!cate.equals("None")) {
            proList = dao.getCateProductListLimit(cate, (curPage-1)*10);
        } else {
            proList = dao.getProductListLimit((curPage-1)*10);
        }

        // 페이징 처리
        Page page = new Page();
        try {
            page.paging(curPage, 12, 5, "product", cate);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("proList", proList);
        request.setAttribute("cate", cate);
        request.setAttribute("paging", page);
        request.setAttribute("curPage", curPage);
        RequestDispatcher view = request.getRequestDispatcher("/product/productList.jsp");
        view.forward(request, response);
    }
}
