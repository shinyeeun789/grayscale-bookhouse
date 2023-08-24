<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>

    <style>
        input[type="password"] {
            outline: none;
            border: none;
            width: 100%;
            background-color: rgba(0,0,0,0);
        }
    </style>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../header.jsp"%>

    <div class="contents" style="min-height:100vh">
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4> MyPage </h4>
                            <div class="breadcrumb__links">
                                <a href="${path}/">Home</a>
                                <span> MyPage </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <h2 class="title"> 마이페이지 </h2>
        <div class="container-lg">
            <div class="box_wrap w-75" style="margin: 0 auto">
                <table class="table table-striped table-hover" id="tb1">
                    <tbody>
                    <tr>
                        <th class="text-center w-40"> 아이디 </th>
                        <td> ${cus.id } </td>
                    </tr>
                    <tr>
                        <th class="text-center"> 비밀번호 </th>
                        <td><input type="password" value="${cus.pw}"></td>
                    </tr>
                    <tr>
                        <th class="text-center"> 이름 </th>
                        <td> ${cus.name } </td>
                    </tr>
                    <tr>
                        <th class="text-center"> 이메일 </th>
                        <td> ${cus.email } </td>
                    </tr>
                    <tr>
                        <th class="text-center"> 연락처 </th>
                        <td> ${cus.tel } </td>
                    </tr>
                    <tr>
                        <th class="text-center"> 등급 </th>
                        <td> ${cus.grade } </td>
                    </tr>
                    <tr>
                        <th class="text-center"> 포인트 </th>
                        <td> ${cus.point } </td>
                    </tr>
                    <tr>
                        <th class="text-center"> 생년월일 </th>
                        <td> ${cus.birth } </td>
                    </tr>
                    <tr>
                        <th class="text-center" rowspan="2"> 주소 </th>
                        <td> ${cus.addr1 } </td>
                    </tr>
                    <tr>
                        <td> ${cus.addr2 } </td>
                    </tr>
                    <tr>
                        <th class="text-center"> 가입일시 </th>
                        <td> ${cus.regdate } </td>
                    </tr>
                    </tbody>
                </table>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end w-900" style="margin: 0 auto;">
                    <a href="${path}/MyInfoUpdate.do?id=${cus.id}" class="btn btn-primary "> 개인정보 변경 </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
