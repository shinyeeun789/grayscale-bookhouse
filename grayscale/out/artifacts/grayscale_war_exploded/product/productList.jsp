<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 상품 목록 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>
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
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="${path}/">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <div class="container">
        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop__sidebar">
                            <div class="shop__sidebar__search">
                                <form action="#">
                                    <input type="text" placeholder="Search...">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="shop__sidebar__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__categories">
                                                    <ul class="nice-scroll">
                                                        <li><a href="${path}/ProductList.do?cate=None&page=1"> 전체 </a></li>
                                                        <li><a href="${path}/ProductList.do?cate=A&page=1"> 교과서 </a></li>
                                                        <li><a href="${path}/ProductList.do?cate=B&page=1"> 참고서 </a></li>
                                                        <li><a href="${path}/ProductList.do?cate=C&page=1"> 문제집 </a></li>
                                                        <li><a href="${path}/ProductList.do?cate=D&page=1"> 기타 </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <h4 class="cate mb-5"></h4>
                        <div class="row">
                            <c:forEach var="pro" items="${proList}" varStatus="status">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic" style="background-image: url('${path}/storage/${pro.imgSrc1}'); background-size: cover" alt="상품 이미지">
                                            <ul class="product__hover">
                                                <li><a href="#"><img src="${path}/images/heart.png" alt=""></a></li>
                                                <li><a href="${path}/Product.do=pno=${pro.pno}"><img src="${path}/images/search.png" alt="상세보기 버튼"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6>${pro.pname}</h6>
                                            <a href="#" class="add-cart">+ Add To Cart</a>
                                            <h5>${pro.price}원</h5>
                                            <div class="product__color__select">
                                                <label for="pc-4">
                                                    <input type="radio" id="pc-4">
                                                </label>
                                                <label class="active black" for="pc-5">
                                                    <input type="radio" id="pc-5">
                                                </label>
                                                <label class="grey" for="pc-6">
                                                    <input type="radio" id="pc-6">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${empty proList}">
                                <div class="col-12">
                                    <h4 class="text-center mb-5">상품이 존재하지 않습니다.</h4>
                                </div>
                            </c:if>
                        </div>
                        <!-- 페이징 -->
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:if test="${paging.prev}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/ProductList.do?cate=${cate}&page=1"> &lt; </a>
                                    </li>
                                </c:if>
                                <c:if test="${not paging.prev}">
                                    <li class="page-item disabled">
                                        <a class="page-link"> &lt; </a>
                                    </li>
                                </c:if>
                                <c:forEach var="page" items="${paging.pageList}">
                                    <c:if test="${page eq curPage}">
                                        <li class="page-item active"><a class="page-link" href="${path}/ProductList.do?cate=${cate}&page=${page}">${page}</a></li>
                                    </c:if>
                                    <c:if test="${page ne curPage}">
                                        <li class="page-item"><a class="page-link" href="${path}/ProductList.do?cate=${cate}&page=${page}">${page}</a></li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${paging.next}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/ProductList.do?cate=${cate}&page=${paging.nextPage}"> &gt; </a>
                                    </li>
                                </c:if>
                                <c:if test="${not paging.next}">
                                    <li class="page-item disabled">
                                        <a class="page-link"> &gt; </a>
                                    </li>
                                </c:if>

                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->
    </div>
    <%@ include file="../footer.jsp" %>

    <script>
        $(document).ready(function() {
            switch ('${cate}') {
                case 'None':
                    $(".cate").text("전체");
                    break;
                case 'A':
                    $(".cate").text("교과서");
                    break;
                case 'B':
                    $(".cate").text("참고서");
                    break;
                case 'C':
                    $(".cate").text("문제집");
                    break;
                case 'D':
                    $(".cate").text("기타");
                    break;
            }
        });
    </script>

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
