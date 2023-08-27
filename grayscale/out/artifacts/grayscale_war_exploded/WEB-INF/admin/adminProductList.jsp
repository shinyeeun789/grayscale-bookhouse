<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../../common.jsp"%>

    <style>
        .d-block {
            color: #333;
        }
        .d-block:hover {
            color: #333;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../../header.jsp"%>

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
                                <span> Admin Notice </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <div class="container">
            <div class="row pt-5">
                <div class="col col-lg-2">
                    <div class="border p-4">
                        <a href="${path}/AdminProList.do" class="d-block mt-2 mb-2" style="color:#0275d8; font-weight:bold"> 상품 목록 </a>
                        <a href="${path}/AddProduct.do" class="d-block mb-2"> 상품 등록 </a>
                        <a href="${path}/" class="d-block mb-2"> 상품 입고 </a>
                        <a href="" class="d-block mb-2"> 리뷰 관리 </a>
                        <a href="" class="d-block mb-2"> 할인쿠폰 관리 </a>
                    </div>
                </div>
                <div class="col col-lg-10">
                    <h3 class="mb-2"> PRODUCT LIST </h3>
                    <div class="box_wrap mb-5" style="margin: 0 auto">
                        <table class="table table-striped table-hover" id="tb1">
                            <thead>
                            <tr>
                                <th class="text-center"> 상품명 </th>
                                <th class="text-center"> 카테고리 </th>
                                <th class="text-center"> 입고가 </th>
                                <th class="text-center"> 재고 </th>
                                <th class="text-center"> 현재 가격 </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="pro" items="${proList}">
                                <tr>
                                    <td class="text-center"> ${pro.pname } </td>
                                    <td class="text-center"> ${pro.cname } </td>
                                    <td class="text-right"> ${pro.rprice } </td>
                                    <td class="text-right"> ${pro.amount } </td>
                                    <td class="text-right"> ${pro.price } </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>