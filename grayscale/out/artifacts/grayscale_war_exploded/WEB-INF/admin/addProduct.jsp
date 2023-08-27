<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 상품 등록 </title>
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
                        <a href="${path}/AdminProList.do" class="d-block mt-2 mb-2"> 상품 목록 </a>
                        <a href="${path}/AddProduct.do" class="d-block mb-2" style="color:#0275d8; font-weight:bold"> 상품 등록 </a>
                        <a href="${path}/AddReceive.do" class="d-block mb-2"> 상품 입고 </a>
                        <a href="" class="d-block mb-2"> 리뷰 관리 </a>
                        <a href="" class="d-block mb-2"> 할인쿠폰 관리 </a>
                    </div>
                </div>
                <div class="col col-lg-10 pl-5 pr-5 pb-5 mb-5">
                    <h3 class="mb-2"> 상품 등록 </h3>
                    <form name="frm1" id="frm1" action="${path}/AddProductPro.do" method="post" enctype="multipart/form-data">
                        <div class="form-outline mb-4">
                            <select name="cate" id="cate" class="form-control form-control-lg">
                                <option value="A"> 선택안함 </option>
                                <c:forEach var="cate" items="${cateList}" varStatus="status">
                                    <option value="${cate.cno}">${cate.cname}</option>
                                </c:forEach>
                            </select>
                            <label class="form-label" for="cate"> 카테고리 </label>
                        </div>

                        <div class="form-outline mb-4">
                            <input type="text" id="pname" name="pname" class="form-control form-control-lg" maxlength="90" required />
                            <label class="form-label" for="pname"> 상품명 </label>
                        </div>
                        <div class="form-outline mb-4">
                            <textarea class="form-control" id="pcomment" name="pcomment" placeholder="상품의 자세한 정보를 입력하세요" maxlength="1990" rows="10" required></textarea>
                            <label for="pcomment" class="form-label"> 상품 정보 </label>
                        </div>
                        <div class="form-outline mb-4">
                            <textarea class="form-control" id="plist" name="plist" placeholder="도서 상품의 목차를 입력하세요" maxlength="1990" rows="10" required></textarea>
                            <label for="pcomment" class="form-label"> 상품 목차 </label>
                        </div>
                        <div class="form-outline mb-4">
                            <input class="form-control form-control-lg" type="number" name="price" id="price" value="1000" min="1000" step="100" required>
                            <label for="pcomment" class="form-label"> 상품 가격 </label>
                        </div>
                        <div class="form-outline mb-4">
                            <input class="form-control form-control-lg" type="file" name="imgsrc1" id="imgsrc1" placeholder="상품 메인이미지" required>
                            <label for="imgsrc1" class="form-label"> 상품 이미지(메인) </label>
                        </div>
                        <div class="form-outline mb-4">
                            <input class="form-control form-control-lg" type="file" name="imgsrc2" id="imgsrc2" placeholder="상품 서브이미지" required>
                            <label for="imgsrc2" class="form-label"> 상품 이미지(서브1) </label>
                        </div>
                        <div class="form-outline mb-4">
                            <input class="form-control form-control-lg" type="file" name="imgsrc3" id="imgsrc3" placeholder="상품 서브이미지" required>
                            <label for="imgsrc3" class="form-label"> 상품 이미지(서브2) </label>
                        </div>
                        <div class="d-flex justify-content-center mt-4">
                            <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 상품 등록하기 </button>
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
