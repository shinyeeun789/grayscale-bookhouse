<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<c:set var="path1" value="<%=request.getContextPath() %>"/>
<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="col">
                <div class="header__top__right">
                    <div class="header__top__links">
                        <c:if test="${!empty sid }">
                            <a href="${path1}/Logout.do"> Logout </a>
                            <c:if test="${sid ne 'admin1234'}">
                                <a href="${path1}/Mypage.do"> MyPage </a>
                            </c:if>
                            <c:if test="${sid eq 'admin1234' }">
                                <a href="${path1}/Contact.do"> Admin Notice </a>
                            </c:if>
                            <a href="${path1}/Contact.do"> Contact Us </a>
                        </c:if>
                        <c:if test="${empty sid}">
                            <a href="${path1}/Login.do"> Login </a>
                            <a href="${path1}/Term.do"> Join </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a class="text-dark fw-bolder" href="${path1}/"> GRAYSCALE </a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="${path1}/ProList.do"> 베스트 </a></li>
                        <li><a href="${path1}/ProList.do"> 신상품 </a></li>
                        <li><a href="#"> 카테고리 </a>
                            <ul class="dropdown">
                                <li><a href="./about.html"> 교과서 </a></li>
                                <li><a href="./shop-details.html"> 참고서 </a></li>
                                <li><a href="./shopping-cart.html"> 문제집 </a></li>
                                <li><a href="./checkout.html"> 기타 </a></li>
                                <li><a href="./blog-details.html"> 해외서적 </a></li>
                            </ul>
                        </li>
                        <li><a href="#"> 고객지원 </a>
                            <ul class="dropdown">
                                <li><a href="${path1}/NoticeList.do?page=1"> 공지사항 </a></li>
                                <li><a href="${path}/QnaList.do?page=1"> QnA </a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <c:if test="${!empty sid and sid ne 'admin1234'}">
                        <a href="#"><img src="${path1}/images/heart.png" alt=""></a>
                        <a href="#"><img src="${path1}/images/cart.png" alt=""> <span>0</span></a>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>
<!-- Header Section End -->