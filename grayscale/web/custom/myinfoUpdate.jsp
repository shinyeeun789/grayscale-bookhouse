<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title> 개인정보 변경 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>

    <c:if test="${msg eq 'fail'}">
        <script>
            alert("개인정보 변경에 실패했습니다. 잠시 후 다시 시도해주세요.");
        </script>
    </c:if>

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
    <%@ include file="../header.jsp"%>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4> MyPage </h4>
                        <div class="breadcrumb__links">
                            <a href="${path}/">Home</a>
                            <a href="${path}/Mypage.do">MyPage</a>
                            <span> 개인정보 변경 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <div class="container mb-5">
        <div class="row pt-5">
            <div class="col col-lg-2">
                <div class="border p-4">
                    <a href="${path}/Mypage.do" class="d-block mt-2 mb-2"> 개인정보 확인 </a>
                    <a href="${path}/MyInfoUpdate.do" class="d-block mb-2" style="color:#0275d8; font-weight:bold"> 개인정보 변경 </a>
                    <a href="${path}/MyOrderList.do" class="d-block mb-2"> 주문/배송 조회 </a>
                    <a href="" class="d-block mb-2"> 리뷰 관리 </a>
                </div>
            </div>
            <div class="col col-lg-10">
                <h3 class="mb-2"> 개인정보 변경 </h3>
                <form name="frm1" id="frm1" action="${path}/MyInfoUpdatePro.do" method="post" onsubmit="return modifyCheck(this)">
                    <div class="form-outline mb-4">
                        <input type="text" id="id" name="id" class="form-control form-control-lg" value="${cus.id}" readonly/>
                        <label class="form-label" for="id"> 아이디 </label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="password" id="pw" name="pw" class="form-control form-control-lg" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"
                               placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하" maxlength="16" value="${cus.pw}"} required />
                        <label class="form-label" for="pw"> 비밀번호 </label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="text" id="name" name="name" class="form-control form-control-lg" value="${cus.name}" readonly />
                        <label class="form-label" for="name"> 회원 이름 </label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="email" id="email" name="email" class="form-control form-control-lg" value="${cus.email}" autocomplete="off" required />
                        <label class="form-label" for="name"> 이메일 </label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="tel" id="tel" name="tel" class="form-control form-control-lg" placeholder="하이픈 없이 입력" value="${cus.tel}" autocomplete="off" required />
                        <label class="form-label" for="name"> 연락처 </label>
                    </div>

                    <div class="form-outline mb-4">
                        <input type="date" id="birth" name="birth" class="form-control form-control-lg" autocomplete="off" value="${cus.birth}" required />
                        <label class="form-label" for="name"> 생년월일 </label>
                    </div>

                    <div class="form-outline mb-2">
                        <input type="text" id="address1" name="address1" placeholder="기본 주소 입력" class="form-control form-control-lg mt-20" value="${cus.addr1}" readonly required />
                    </div>
                    <div class="form-outline mb-2">
                        <input type="text" id="address2" name="address2" placeholder="상세 주소 입력" class="form-control form-control-lg mt-20" value="${cus.addr2}" autocomplete="off" required />
                    </div>
                    <div class="form-outline mb-2">
                        <input type="text" id="postcode" name="postcode" placeholder="우편번호" class="form-control form-control-lg mt-20" value="${cus.postcode}" readonly required />
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end w-900" style="margin: 0 auto;">
                        <input type="button" class="btn btn-primary " value="우편 번호 검색" onclick="findAddr()">
                    </div>

                    <div class="d-flex justify-content-center mt-4">
                        <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 개인정보 변경 </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {

        });
        function findAddr(){
            new daum.Postcode({
                oncomplete:function(data){
                    console.log(data);
                    var roadAddr = data.roadAddress;
                    var jibunAddr = data.jibunAddress;
                    document.getElementById("postcode").value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("address1").value = roadAddr;
                    } else if(jibunAddr !== ''){
                        document.getElementById("address1").value = jibunAddr;
                    }
                    document.getElementById("address2").focus();
                }
            }).open();
        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>