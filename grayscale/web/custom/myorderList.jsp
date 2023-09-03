<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 주문/배송조회</title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>

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

        <div class="container">
            <div class="row pt-5">
                <div class="col col-lg-2">
                    <div class="border p-4">
                        <a href="${path}/Mypage.do" class="d-block mt-2 mb-2"> 개인정보 확인 </a>
                        <a href="${path}/MyInfoUpdate.do" class="d-block mb-2"> 개인정보 변경 </a>
                        <a href="${path}/MyOrderList.do" class="d-block mb-2" style="color:#0275d8; font-weight:bold"> 주문/배송 조회 </a>
                        <a href="${path}/ReviewList.do" class="d-block mb-2"> 리뷰 관리 </a>
                    </div>
                </div>
                <div class="col col-lg-10">
                    <c:set var="cnum" value=""/>
                    <c:forEach var="order" items="${orderList}">
                        <c:if test="${cnum eq order.cnum}">
                            <div class="row">
                                <div class="col col-lg-8">
                                    <h4> ${order.pname} </h4>
                                    <p> 총 ${order.amount}권 / 총 ${order.payprice}원 </p>
                                </div>
                                <div class="col col-lg-2 d-flex align-items-center">
                                        ${order.pstate}
                                </div>
                                <div class="col col-lg-2 d-flex align-items-center">
                                    <c:if test="${order.pstate eq '입고'}">
                                        <button type="button" class="btn btn-outline-secondary col col-lg-2" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?sno=${order.sno}'"> 부분 취소 </button>
                                    </c:if>
                                    <c:if test="${order.pstate eq '배송 도착'}">
                                        <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?sno=${order.sno}'"> 부분 환불 </button>
                                    </c:if>
                                </div>
                            </div>
                            <hr class="mb-5">
                        </c:if>
                        <c:if test="${cnum ne order.cnum}">
                            <c:set var="cnum" value="${order.cnum}"></c:set>
                            <div class="row">
                                <div class="col col-lg-10 d-flex align-items-center">
                                    <h4> ${order.sdate} </h4>
                                </div>
                                <c:if test="${order.pstate eq '입고'}">
                                    <button type="button" class="btn btn-secondary col col-lg-2" onclick="javascript:location.href='${path}/ReturnPayments.do?cnum=${order.cnum}'"> 전체 취소 </button>
                                </c:if>
                                <c:if test="${order.pstate eq '배송 도착'}">
                                    <button type="button" class="btn btn-secondary col col-lg-2" onclick="javascript:location.href='${path}/ReturnPayments.do?cnum=${order.cnum}'"> 전체 환불 </button>
                                </c:if>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col col-lg-8">
                                    <h4> ${order.pname} </h4>
                                    <p> 총 ${order.amount}권 / 총 ${order.payprice}원 </p>
                                </div>
                                <div class="col col-lg-2 d-flex align-items-center">
                                        ${order.pstate}
                                </div>
                                <div class="col col-lg-2 d-flex align-items-center">
                                    <c:if test="${order.pstate eq '입고'}">
                                        <button type="button" class="btn btn-outline-secondary col col-lg-2" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?sno=${order.sno}'"> 부분 취소 </button>
                                    </c:if>
                                    <c:if test="${order.pstate eq '배송 도착'}">
                                        <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?sno=${order.sno}'"> 부분 환불 </button>
                                    </c:if>
                                </div>
                            </div>
                            <hr class="mb-5">
                        </c:if>
                    </c:forEach>
                    <c:if test="${empty orderList}">
                        <div class="text-center">
                            <h4> 주문 내역이 없습니다 : ) </h4>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
