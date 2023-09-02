<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title> 배송정보 관리 </title>
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

        td a {
            color: #333;
        }
        td a:hover {
            color: #333;
        }
    </style>
</head>

<body>
<div class="container-fluid m-0 p-0">
    <%@include file="../../header.jsp"%>

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
                        <a href="${path}/Mypage.do" class="d-block mt-2 mb-2"> 개인정보 확인 </a>
                        <a href="${path}/MyInfoUpdate.do" class="d-block mb-2"> 개인정보 변경 </a>
                        <a href="${path}/MyOrderList.do" class="d-block mb-2"> 주문/배송 조회 </a>
                        <a href="${path}/DeliveryList.do" class="d-block mb-2" style="color:#0275d8; font-weight:bold"> 배송 정보 관리 </a>
                        <a href="" class="d-block mb-2"> 리뷰 관리 </a>
                    </div>
                </div>
                <div class="col col-lg-10 mb-5">
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
                                    <td class="align-middle">${del.dno} </td>
                                    <td class="align-middle"><a href="${path}/UpdateDelivery.do?dno=${del.dno}&type=1" class="title">${del.pname}</a></td>
                                    <td class="align-middle">${del.cid}</td>
                                    <td class="align-middle">${fn:substring(del.sdate, 0, 10)} </td>
                                    <td class="align-middle">${del.curState} </td>
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
                                    <td class="align-middle">${del.cnum} </td>
                                    <td class="align-middle"><a href="${path}/UpdateDelivery.do?dno=${del.dno}&type=2" class="title">${del.pname}</a></td>
                                    <td class="align-middle">${fn:substring(del.sdate, 0, 10)} </td>
                                    <td class="align-middle">${fn:substring(del.rdate, 0, 10)} </td>
                                    <td class="align-middle">${del.curState} </td>
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
    </div>
    <%@ include file="../../footer.jsp" %>
</div>

</body>
</html>
