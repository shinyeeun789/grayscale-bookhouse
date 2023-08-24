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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Mypage.do")
public class MypageCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");

        CustomDAO dao = new CustomDAO();
        CustomVO cus = dao.getCustomVO(id);

        request.setAttribute("cus", cus);
        RequestDispatcher view = request.getRequestDispatcher("/custom/mypage.jsp");
        view.forward(request, response);
    }
}
