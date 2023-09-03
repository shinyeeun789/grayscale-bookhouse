<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> grayscale </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp" %>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<%@ include file="../header.jsp" %>

<!-- Hero Section Begin -->
<section class="hero">
    <div class="hero__slider owl-carousel">
        <div class="hero__items set-bg" data-setbg="${path}/images/banner01-1.png">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <h6> GRAYSCALE </h6>
                            <h2> ONLINE BOOKHOUSE </h2>
                            <p> 지금 GRAYSCALE에서 책의 매력을 만나보세요! 다양한 장르와 베스트셀러들이 여러분을 기다리고 있습니다. 독서의 즐거움을 함께 나눠보세요 </p>
                            <a href="${path}/ProductList.do?cate=None&page=1" class="primary-btn">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero__items set-bg" data-setbg="${path}/images/banner02-1.png">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-7 col-md-8">
                        <div class="hero__text">
                            <h6> GRAYSCALE </h6>
                            <h2> BEST SELLER </h2>
                            <p> 온라인 서점의 베스트셀러로 핫한 책들을 한눈에 확인하세요. 업계 최고의 작품들을 저렴한 가격에 만나보세요. 지금 바로 책을 선택하고 읽으며 새로운 세계로 떠나보세요! </p>
                            <a href="${path}/BestProduct.do" class="primary-btn">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="filter__controls">
                    <li data-filter=".best-sellers">Best Sellers</li>
                    <li data-filter=".new-arrivals">New Arrivals</li>
                </ul>
            </div>
        </div>
        <div class="row product__filter">
            <c:forEach var="pro" items="${bestList}">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix best-sellers">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${path}/storage/${pro.imgSrc1}">
                            <span class="label"> BEST </span>
                        </div>
                        <div class="product__item__text">
                            <h6> ${pro.pname} </h6>
                            <a href="${path}/Product.do?pno=${pro.pno}" class="add-cart"> 장바구니 담기</a>
                            <h5> ${pro.price} </h5>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:forEach var="pro" items="${newList}">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${path}/storage/${pro.imgSrc1}">
                            <span class="label">NEW</span>
                        </div>
                        <div class="product__item__text">
                            <h6> ${pro.pname} </h6>
                            <a href="${path}/Product.do?pno=${pro.pno}" class="add-cart"> 장바구니 담기</a>
                            <h5> ${pro.price} </h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Latest Blog Section Begin -->
<section class="latest spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <span>Latest News</span>
                    <h2> NOTICE </h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach var="noti" items="${noticeList}">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__text">
                            <span><img src="${path}/images/calendar.png" alt=""> ${noti.resdate} </span>
                            <h5> ${noti.title} </h5>
                            <a href="${path}/Notice.do?no=${noti.no}">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Latest Blog Section End -->

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
</body>
</html>