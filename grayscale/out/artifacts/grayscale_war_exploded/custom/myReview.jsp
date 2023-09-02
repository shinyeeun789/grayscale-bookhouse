<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title> 개인정보 변경 </title>
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
    <%@include file="../header.jsp"%>

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

    <div class="container mt-5" style="min-height:50vh">
        <div class="row">
            <div class="col col-lg-3 mb-3 p-3">
                <div class="p-4 border">
                    <a href="${path}/AdminDashboard.do" class="d-block menu_item"> ADMIN MAIN </a>
                    <a href="${path}/AdminProductList.do" class="d-block menu_item mt-2"> 상품 관리 </a>
                    <a href="${path}/DeliveryList.do" class="d-block menu_item mt-2" style="color:#7FAD39; font-weight:bold"> 배송 정보 관리 </a>
                    <a href="${path}/MemberMgmt.do" class="d-block menu_item mt-2"> 회원 관리 </a>
                </div>
            </div>
            <div class="col col-lg-9 mt-3 mb-5">
                <div class="container">
                    <h4 class="mb-2"> 결제완료 주문건 </h4>
                    <p class="mb-1"> ❗️송장번호를 추가하고 싶은 경우 상품명을 클릭해주세요 :) </p>
                    <table class="table table-striped">
                        <thead>
                        <tr class="text-center"><th> # </th><th> 상품명 </th><th> 주문자 ID </th><th> 결제일 </th><th> 배송상태 </th></tr>
                        </thead>
                        <tbody>
                        <c:forEach var="del" items="${delList}">
                            <tr class="text-center">
                                <td class="align-middle">${del.del_no} </td>
                                <td class="align-middle"><a href="${path}/UpdateDelivery.do?del_no=${del.del_no}&type=1" class="title">${del.title}</a></td>
                                <td class="align-middle">${del.custom_id}</td>
                                <td class="align-middle">${del.pay_resdate} </td>
                                <td class="align-middle">${del.current_state} </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${fn:length(delList) eq 0}">
                            <tr class="text-center">
                                <td colspan="5" class="align-middle"> 결제완료 주문건이 없습니다. </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="container mt-5">
                    <h4 class="mb-3"> 배송상태 변경 </h4>
                    <table class="table table-striped">
                        <thead>
                        <tr class="text-center"><th> 송장번호 </th><th> 상품명 </th><th> 배송 시작일 </th><th> 배송 예정일 </th><th> 배송상태 </th></tr>
                        </thead>
                        <tbody>
                        <c:forEach var="del" items="${delCodeList}">
                            <tr class="text-center">
                                <td class="align-middle">${del.del_code} </td>
                                <td class="align-middle"><a href="${path}/UpdateDelivery.do?del_no=${del.del_no}&type=2" class="title">${del.title}</a></td>
                                <td class="align-middle">${fn:substring(del.del_date, 0, 10)} </td>
                                <td class="align-middle">${del.res_date} </td>
                                <td class="align-middle">${del.current_state} </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${fn:length(delCodeList) eq 0}">
                            <tr class="text-center">
                                <td colspan="5" class="align-middle"> 배송상태 변경건이 없습니다. </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section Begin -->
    <%@include file="../footer.jsp"%>
    <!-- Footer Section End -->
</div>
</body>
</html>