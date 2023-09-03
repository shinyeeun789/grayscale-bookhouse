<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 상품 상세정보 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>

    <script>
        if('${param.msg}'=='fail') { alert("로그인 후 장바구니에 담을 수 있습니다."); }
    </script>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <%@ include file="../header.jsp"%>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>상품 상세보기</h4>
                        <div class="breadcrumb__links">
                            <a href="${path}/">Home</a>
                            <a href="${path}/ProductList.do?cate=None&page=1">Shop</a>
                            <span>상품 상세보기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <div class="product__thumb__pic" style="background-image: url('${path}/storage/${product.imgSrc1}')"></div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <div class="product__thumb__pic" style="background-image: url('${path}/storage/${product.imgSrc2}')">
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <div class="product__thumb__pic" style="background-image: url('${path}/storage/${product.imgSrc3}')">
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img class="w-100" src="${path}/storage/${product.imgSrc1}" alt="상품 이미지1">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img class="w-100" src="${path}/storage/${product.imgSrc2}" alt="상품 이미지2">
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img class="w-100" src="${path}/storage/${product.imgSrc3}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4> ${product.pname} </h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3> ${product.price}원 </h3>
                            <div class="product__details__cart__option">
                                <form action="${path}/AddCartPro.do" method="post" onsubmit="return ${amount > 0}">
                                    <div class="quantity">
                                        <c:if test="${amount>0}">
                                            <input class="form-control" type="number" id="amount" name="amount" value="1" min="0" max="${amount}">
                                        </c:if>
                                        <c:if test="${amount==0}"><strong> 절판된 도서입니다 </strong></c:if>
                                        <input type="hidden" id="pno" name="pno" value="${product.pno}">
                                    </div>
                                    <button type="submit" class="primary-btn"> 장바구니 담기 </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5" role="tab"> 설명 </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab"> 상품 리뷰(${fn:length(reviewList)}) </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5> 상품 설명 </h5>
                                            <p> ${product.pcomment} </p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5> 책의 목차 </h5>
                                            <p> ${product.plist} </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <c:forEach var="review" items="${reviewList}">
                                            <div class="product__details__tab__content__item">
                                                <h5> ${review.cid} (${fn:substring(review.resdate, 0, 10)}) </h5>
                                                <p><c:forEach var="i" begin="1" end="${review.star}">
                                                        ⭐
                                                </c:forEach> (${review.star}점)</p>
                                                <p> ${review.content} </p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                <c:forEach var="relPro" items="${relProducts}">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                        <div class="product__item" onclick="javascript:location.href='${path}/Product.do?pno=${relPro.pno}'" style="cursor: pointer">
                            <div class="product__item__pic" style="background-image: url('${path}/storage/${relPro.imgSrc1}')"></div>
                            <div class="product__item__text">
                                <h6>${relPro.pname}</h6>
                                <a href="${path}/Product.do?pno=${relPro.pno}" class="add-cart"> 장바구니 담기 </a>
                                <h5>${relPro.price}</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Related Section End -->

    <%@ include file="../footer.jsp" %>

    <!-- Js Plugins -->
    <script src="${path}/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/js/bootstrap.min.js"></script>
    <script src="${path}/js/jquery.nice-select.min.js"></script>
    <script src="${path}/js/jquery.nicescroll.min.js"></script>
    <script src="${path}/js/jquery.magnific-popup.min.js"></script>
    <script src="${path}/js/jquery.countdown.min.js"></script>
    <script src="${path}/js/jquery.slicknav.js"></script>
    <script src="${path}/js/mixitup.min.js"></script>
    <script src="${path}/js/owl.carousel.min.js"></script>
    <script src="${path}/js/main.js"></script>
</div>
</body>
</html>
