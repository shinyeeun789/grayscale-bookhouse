<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 상품 입고 등록 </title>
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
                                <span> 입고 등록 </span>
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
                        <a href="${path}/AdminDashboard.do" class="d-block mt-2 mb-2"> Dashboard </a>
                        <a href="${path}/AdminProList.do" class="d-block mb-2"> 상품 목록 </a>
                        <a href="${path}/AddProduct.do" class="d-block mb-2"> 상품 등록 </a>
                        <a href="${path}/AddReceive.do" class="d-block mb-2" style="color:#0275d8; font-weight:bold"> 상품 입고 </a>
                        <a href="${path}/DeliveryList.do" class="d-block mb-2"> 배송 정보 관리 </a>
                        <a href="${path}/AdminReview.do" class="d-block mb-2"> 리뷰 관리 </a>
                    </div>
                </div>
                <div class="col col-lg-10 pl-5 pr-5 pb-5 mb-5">
                    <h3 class="mb-2"> 상품 입고 </h3>
                    <form name="frm1" id="frm1" action="${path}/AddReceivePro.do" method="post">
                        <div class="form-outline mb-4">
                            <select name="pno" id="pno" class="form-control form-control-lg">
                                <option value="1" cate="B" price="40000"> 선택안함 </option>
                                <c:forEach var="pro" items="${proList}" varStatus="status">
                                    <option value="${pro.pno}" cate="${pro.cate}" price="${pro.price}">${pro.pname}</option>
                                </c:forEach>
                            </select>
                            <label class="form-label" for="pno"> 상품명 </label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="number" id="amount" name="amount" class="form-control form-control-lg" value="1" min="1" max="1000" required />
                            <label class="form-label" for="amount"> 입고 수량 </label>
                        </div>
                        <div class="form-outline mb-4">
                            <input type="number" class="form-control" id="rprice" name="rprice" min="1000" required />
                            <label for="rprice" class="form-label"> 입고 가격 </label>
                        </div>
                        <div class="d-flex justify-content-center mt-4">
                            <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 상품 입고 </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>
