<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 장바구니 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <%@ include file="../header.jsp" %>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4> 장바구니 </h4>
                        <div class="breadcrumb__links">
                            <a href="${path}/">Home</a>
                            <span> 장바구니 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <form class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="text-center"> 상품명</th>
                                <th class="text-center"> 개수</th>
                                <th class="text-center"> 금액</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cart" items="${cartList}">
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__text">
                                            <h6> ${cart.pname} </h6>
                                            <h5 class="cart_ori_price"> ${cart.price} </h5>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                            ${cart.amount}
                                    </td>
                                    <td class="cart__price text-center amount_price"> ${cart.price * cart.amount} </td>
                                    <td class="cart__close"><i class="fa fa-close" style="cursor:pointer" onclick="javascript:location.href='${path}/DeleteCart.do?cartno=${cart.cartno}'"></i></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="${path}/ProductList.do?cate=None&page=1">Continue Shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="${path}/CartList.do"><i class="fa fa-spinner"></i> Update cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span class="sub_total"></span></li>
                            <li>Total <span class="total"></span></li>
                        </ul>
                        <a href="${path}/AddPayment.do" class="primary-btn"> 구매하기 </a>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
    <%@ include file="../footer.jsp" %>

    <script>
        $(document).ready(function() {
            var total = 0;
            $(".amount_price").each(function() {
                total += parseInt($(this).html());
                $(".sub_total").html(total);
                $(".total").html(total);
            })
            console.log("total " + total);
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
