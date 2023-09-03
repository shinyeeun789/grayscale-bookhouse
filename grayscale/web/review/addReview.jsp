<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 리뷰 작성 </title>
    <c:set var="path" value="<%=request.getContextPath()%>" />
    <%@ include file="../encoding.jsp"%>
    <%@ include file="../common.jsp"%>

    <style>
        .form-control:disabled {
            opacity: 1;
            border: none;
        }
    </style>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../header.jsp"%>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4> 리뷰 작성 </h4>
                        <div class="breadcrumb__links">
                            <a href="${path}/">Home</a>
                            <a href="javascript: history.go(-1)"> 리뷰 관리 </a>
                            <span> 리뷰 작성 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <div class="container-fluid px-4 mt-5 mb-5">
        <div class="row justify-content-md-center">
            <div class="col-sm-8 mb-3 mb-sm-0">
                <div class="card w-100 mb-3">
                    <div class="card-body">
                        <div class="form-outline mb-4">
                            <h4> 구매 정보 </h4>
                        </div>
                        <div class="form-outline mb-4">
                            <label for="pname" class="form-label"> 제목 </label>
                            <input type="text" id="pname" class="form-control" value="${payInfo.pname}" readonly>
                        </div>
                        <div class="row">
                            <div class="form-outline mb-4 col col-6">
                                <label for="amount" class="form-label"> 개수 </label>
                                <input type="text" id="amount" class="form-control" value="${payInfo.amount}" readonly>
                            </div>
                            <div class="form-outline mb-4 col col-6">
                                <label for="payprice" class="form-label"> 결제금액 </label>
                                <input type="text" id="payprice" class="form-control" value="${payInfo.payprice}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-md-center">
            <div class="col-sm-8 mb-3 mb-sm-0">
                <div class="card w-100 mb-3">
                    <div class="card-body">
                        <form action="${path}/AddReviewPro.do" method="post">
                            <div class="form-outline mb-4">
                                <h4> 리뷰 작성 </h4>
                            </div>
                            <div class="form-outline mb-4">
                                <div class="row">
                                    <input type="radio" class="col col-1" name="star" id="star1" value="1"><label class="col col-1" for="star1" id="lb1"> 1점 </label>
                                    <input type="radio" class="col col-1" name="star" id="star2" value="2"><label class="col col-1" for="star2" id="lb2"> 2점 </label>
                                    <input type="radio" class="col col-1" name="star" id="star3" value="3"><label class="col col-1" for="star3" id="lb3"> 3점 </label>
                                    <input type="radio" class="col col-1" name="star" id="star4" value="4"><label class="col col-1" for="star4" id="lb4"> 4점 </label>
                                    <input type="radio" class="col col-1" name="star" id="star5" value="5"><label class="col col-1" for="star5" id="lb5"> 5점 </label>
                                </div>
                            </div>
                            <div class="form-outline mb-4">
                                <label for="content" class="form-label"> 내용 </label>
                                <input type="hidden" id="sno" name="sno" value="${payInfo.sno}">
                                <input type="hidden" id="pno" name="pno" value="${payInfo.pno}">
                                <textarea class="form-control" id="content" name="content" rows="10"></textarea>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <input type="submit" class="btn btn-dark btn-block gradient-custom-4" value="리뷰 등록하기">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
