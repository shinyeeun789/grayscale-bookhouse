package com.shop.controller.custom;

import com.shop.dto.Custom;
import com.shop.model.CustomDAO;
import com.shop.vo.CustomVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MyInfoUpdate.do")
public class MyInfoUpdateCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String) request.getParameter("id");

        CustomDAO dao = new CustomDAO();
        CustomVO cus = dao.getCustomVO(id);

        request.setAttribute("cus", cus);
        RequestDispatcher view = request.getRequestDispatcher("/custom/myinfoUpdate.jsp");
        view.forward(request, response);
    }
}