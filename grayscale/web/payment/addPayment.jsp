<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 상품 결제 </title>
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
                        <h4> 상품 결제 </h4>
                        <div class="breadcrumb__links">
                            <a href="${path}/">Home</a>
                            <a href="${path}/CartList.do"> 장바구니 </a>
                            <span> 상품 결제 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="${path}/AddPaymentPro.do" method="post" onsubmit="return payCheck(this)">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="checkout__title"> 주문자 정보 </h6>
                            <div class="checkout__input">
                                <p> 이름 </p>
                                <input type="text" value="${custom.name}" disabled>
                            </div>
                            <div class="checkout__input">
                                <p> 주문자 주소 </p>
                                <input type="text" class="checkout__input__add" value="${custom.addr1}" disabled>
                                <input type="text" value="${custom.addr2}" disabled>
                                <input type="text" value="${custom.postcode}" disabled>
                            </div>
                            <div class="checkout__input">
                                <p> 주문자 연락처 </p>
                                <input type="text" value="${custom.tel}" disabled>
                            </div>

                            <div class="row mt-5">
                                <h6 class="checkout__title col col-9 align-text-bottom"> 배송지 정보 </h6>
                                <a onclick="copyInfo()" class="checkout__title col col-3" style="color:#0275d8; cursor:pointer"> 주문자 정보와 동일 </a>
                            </div>
                            <div class="checkout__input">
                                <p> 이름 <span>*</span></p>
                                <input type="hidden" id="cid" name="cid">
                                <input type="text" id="name" name="name" required>
                            </div>
                            <div class="checkout__input">
                                <p> 배송지 주소 <span>*</span></p>
                                <input type="text" placeholder="주소" id="addr1" name="addr1" readonly required>
                                <input type="text" placeholder="상세 주소" id="addr2" name="addr2" required>
                                <div class="row">
                                    <div class="col-lg-10">
                                        <div class="checkout__input">
                                            <input type="text" placeholder="지번" id="postcode" name="postcode" readonly required>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="checkout__input">
                                            <button type="button" class="btn btn-primary" style="height: 50px" onclick="findAddr()"> 주소 찾기 </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p> 배송지 연락처 </p>
                                <input type="text" id="tel" name="tel" required>
                            </div>
                            <input type="hidden" id="pmethod" name="pmethod">
                            <input type="hidden" id="pcom" name="pcom">
                            <input type="hidden" id="cnum" name="cnum">
                            <input type="hidden" name="payAmount" id="payAmount">
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title"> 장바구니 목록 </h4>
                                <div class="checkout__order__products">상품명 <span>가격</span></div>
                                <ul class="checkout__total__products">
                                    <c:forEach var="pro" items="${cartList}" varStatus="status">
                                        <li class="row pl-3">
                                            ${status.index + 1}. <span class="col-8 text-truncate"> ${pro.pname}</span> <span class="amount_price col-3 pr-0 text-right">${pro.price * pro.amount}</span>
                                        </li>
                                        <input type="hidden" id="pno" name="pno" value="${pro.pno}">
                                        <input type="hidden" id="amount" name="amount" value="${pro.amount}">
                                    </c:forEach>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>Subtotal <span class="sub_total"></span></li>
                                    <li>Total <span class="total"></span></li>
                                </ul>
                                <p> 결제한 후 구매하기 버튼을 눌러주세요 : ) </p>
                                <div class="row">
                                    <div class="col col-6">
                                        <input type="hidden" name="payCk" id="payCk" value="no">
                                        <button type="button" class="site-btn" onclick="addPayment()"> 결제하기 </button>
                                    </div>
                                    <div class="col col-6">
                                        <button type="submit" class="site-btn"> 구매하기 </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <%@ include file="../footer.jsp"%>

    <script>
        var total = 0;
        $(document).ready(function() {
            // 전체 결제 금액 구하기
            $(".amount_price").each(function () {
                total += parseInt($(this).html());
                $(".sub_total").html(total);
                $(".total").html(total);
            });
        });

        // 주문자 정보와 동일
        function copyInfo() {
            $("#name").val("${custom.name}");
            $("#addr1").val("${custom.addr1}");
            $("#addr2").val("${custom.addr2}");
            $("#postcode").val("${custom.postcode}");
            $("#tel").val("${custom.tel}");
        }

        // 결제완료 상태인지 확인하기
        function payCheck(f) {
            var payCk = f.payCk.value;
            if(payCk == "no") {
                alert("결제 완료 후 구매하기 버튼을 눌러주세요");
                return false;
            }
        }
    </script>

    <script>
        // 주소 연동 API
        function findAddr() {
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);
                    var roadAddr = data.roadAddress;
                    var jibunAddr = data.jibunAddress;
                    document.getElementById("postcode").value = data.zonecode;
                    if(roadAddr !== '') {
                        document.getElementById("addr1").value = roadAddr;
                    } else if(jibunAddr !== ''){
                        document.getElementById("addr1").value = jibunAddr;
                    }
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
        //결제모듈 API 연동
        var totalPay=0;

        function addPayment() {
            var email = '';
            var cname = $("#name").val();
            var tel = $("#tel").val();
            var addr = $("#addr1").val() + " " + $("#addr2").val();
            var postcode = $("#postcode").val();
            var proName = '상품명';

            totalPay = parseInt($(".total").html());

            //상품명_현재시간
            var d = new Date();
            var date = d.getFullYear() + '' + (d.getMonth() + 1) + '' + d.getDate() + '' + d.getHours() + '' + d.getMinutes() + '' + d.getSeconds();
            var IMP = window.IMP;               // 생략 가능한 코드
            IMP.init('imp73810516');            // 결제 API를 사용하기 위한 코드 입력!
            IMP.request_pay({		            // 결제 요청
                pg: 'kicc',
                merchant_uid: '상품명_' + date,  //상점 거래 ID
                name: proName,				    // 결제 명
                amount: totalPay,				// 결제금액
                buyer_email: email,             // 구매자 email
                buyer_name: cname,				// 구매자 이름
                buyer_tel: tel,		            // 구매자 전화번호
                buyer_addr: addr,		        // 구매자 주소
                buyer_postcode: postcode		// 구매자 우편번호
            }, function (rsp) {
                if (rsp.success) {
                    $("#payAmount").val(rsp.paid_amount);
                    $("#pmethod").val(rsp.pay_method);
                    $("#pcom").val(rsp.pg_provider);
                    $("#cnum").val(rsp.apply_num);
                    $("#payCk").val("yes");
                    return true;
                } else {
                    alert("실패 : " + rsp.error_msg);
                    $("#payCk").val("no");
                    return false;
                }
            });
        }
    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</div>

<!-- Js Plugins -->
<script src="${path}/js/jquery-3.3.1.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script src="${path}/js/jquery.nicescroll.min.js"></script>
<script src="${path}/js/jquery.magnific-popup.min.js"></script>
<script src="${path}/js/jquery.countdown.min.js"></script>
<script src="${path}/js/jquery.slicknav.js"></script>
<script src="${path}/js/mixitup.min.js"></script>
<script src="${path}/js/owl.carousel.min.js"></script>
<script src="${path}/js/main.js"></script>
</body>
</html>
