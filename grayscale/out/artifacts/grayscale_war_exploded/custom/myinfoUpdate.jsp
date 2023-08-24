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
    <title> 마이페이지 </title>
    <jsp:include page="../common.jsp" />

    <!-- breadcrumb 가져오기 -->
    <link rel="stylesheet" href="${path}/css/breadcrumb.css">
    <script src="${path}/js/breadcrumb.js"></script>
    <script src="${path}/js/jquery-1.10.0.js"></script>

    <c:if test="${msg eq 'fail'}">
        <script>
            alert("개인정보 변경에 실패했습니다. 잠시 후 다시 시도해주세요.");
        </script>
    </c:if>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../header.jsp"%>
    <div class="section" style="background-color: #eee; padding-top: 20px;">
        <div class="contents">
            <div class="container-fluid p-0">
                <div class="col-auto col-md-10  ">
                    <nav aria-label="breadcrumb " class="first  d-md-flex" >
                        <ol class="breadcrumb indigo lighten-6 first-1 shadow-lg mb-5  ">
                            <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase" href="${path}/"><span> HOME </span></a><img class="ml-md-3" src="https://img.icons8.com/offices/30/000000/double-right.png" width="20" height="20"> </li>
                            <li class="breadcrumb-item font-weight-bold mr-0 pr-0"><a class="black-text uppercase" href="${path}/Mypage.do"><span> MY PAGE </span></a><img class="ml-md-3" src="https://img.icons8.com/offices/30/000000/double-right.png" width="20" height="20">  </li>
                            <li class="breadcrumb-item font-weight-bold mr-0 pr-0"><a class="black-text active-1" href="${path}/MyInfoUpdate.do"><span> 개인정보 변경 </span></a> </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <section style="padding: 80px;">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5"> 개인정보 변경 </h2>

                                    <form name="frm1" id="frm1" action="${path}/MyInfoUpdatePro.do" method="post" onsubmit="return modifyCheck(this)">
                                        <div class="form-outline mb-4">
                                            <input type="text" id="id" name="id" class="form-control form-control-lg" value="${cus.id}" readonly/>
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
                    </div>
                </div>
            </div>
        </section>
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
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>