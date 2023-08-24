package com.shop.controller.custom;

import com.shop.model.CustomDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginPro.do")
public class LoginProCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String msg = "fail";

        CustomDAO dao = new CustomDAO();
        boolean pass = false;
        try {
            pass = dao.login(id, pw);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        RequestDispatcher view;

        if(pass){
            msg = "success";
            session.setAttribute("sid", id);
            request.setAttribute("msg", msg);
            response.sendRedirect(request.getContextPath());
        } else {
            response.sendRedirect(request.getContextPath() + "/Login.do?msg=" + msg);
        }
    }
}
