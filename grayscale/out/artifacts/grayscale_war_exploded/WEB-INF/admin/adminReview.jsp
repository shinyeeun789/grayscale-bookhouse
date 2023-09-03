<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 리뷰 관리 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../../common.jsp"%>
    <c:if test="${param.msg eq 'fail'}">
        <script>
            alert("리뷰 작성에 실패했습니다");
        </script>
    </c:if>

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
                                <span> MyPage </span>
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
                        <a href="${path}/AddReceive.do" class="d-block mb-2"> 상품 입고 </a>
                        <a href="${path}/DeliveryList.do" class="d-block mb-2"> 배송 정보 관리 </a>
                        <a href="${path}/AdminReview.do" class="d-block mb-2"> 리뷰 관리 </a>
                    </div>
                </div>
                <div class="col col-lg-10">
                        <h3> MY REVIEW </h3>
                        <div class="box_wrap mb-5" style="margin: 0 auto">
                            <table class="table table-striped table-hover" id="tb1">
                                <thead>
                                <tr>
                                    <th class="text-center"> 작성자 </th>
                                    <th class="text-center"> 책 제목 </th>
                                    <th class="text-center"> 별점 </th>
                                    <th class="text-center"> 리뷰 내용 </th>
                                    <th class="text-center"> 비고 </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="review" items="${reviewList}">
                                    <tr>
                                        <td class="text-center align-middle"> ${review.cid } </td>
                                        <td class="text-center align-middle"> ${review.pname } </td>
                                        <td class="text-center align-middle">
                                            <c:forEach var="i" begin="1" end="${review.star}">
                                                ⭐
                                            </c:forEach>
                                        </td>
                                        <td class="text-center align-middle"> ${review.content } </td>
                                        <td class="text-center align-middle"><button type="button" class="btn btn-outline-primary" onclick="javascript:location.href='${path}/delReview.do?rno=${review.rno}&type=1'"> 삭제 </button></td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${fn:length(reviewList) eq 0}">
                                    <tr class="text-center">
                                        <td colspan="5" class="align-middle"> 작성된 리뷰가 없습니다. </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
