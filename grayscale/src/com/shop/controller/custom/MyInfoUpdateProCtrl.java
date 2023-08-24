package com.shop.controller.custom;

import com.shop.dto.Custom;
import com.shop.model.CustomDAO;
import com.shop.util.AES256;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MyInfoUpdatePro.do")
public class MyInfoUpdateProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String addr1 = request.getParameter("address1");
        String addr2 = request.getParameter("address2");
        String postcode = request.getParameter("postcode");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String birth = request.getParameter("birth");

        boolean result = false;
        int suc = 0;

        CustomDAO dao = new CustomDAO();
        Custom user = new Custom();
        String key = "%02x";
        String encrypted = "";
        try {
            encrypted = AES256.encryptAES256(pw, key);
            System.out.println("비밀번호 암호화 : "+encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }

        user.setId(id);
        user.setPw(encrypted);
        user.setName(name);
        user.setAddr(addr1 + "<br>" +addr2);
        user.setPostcode(postcode);
        user.setTel(tel);
        user.setEmail(email);
        user.setBirth(birth);
        suc = dao.updateCustom(user);

        if(suc>0){
            response.sendRedirect(request.getContextPath() + "/Mypage.do");
        } else {
            response.sendRedirect(request.getContextPath() + "/MyInfoUpdate.do?id="+user.getId()+"&msg=fail");
        }
    }
}
