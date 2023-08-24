<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>회원가입</title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <jsp:include page="../common.jsp" />
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../header.jsp" %>
    <div class="section">
        <section class="bg-image"
                 style="background-image: url('https://cdn.pixabay.com/photo/2017/07/17/00/58/coffee-2511065_1280.jpg'); background-repeat: no-repeat; background-size: cover; padding: 80px">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5"> SIGN UP </h2>

                                    <form name="frm1" id="frm1" action="${path}/JoinPro.do" method="post" onsubmit="return joinCheck(this)">
                                        <div class="form-outline mb-4">
                                            <input type="text" id="id" name="id" placeholder="영문 소문자, 숫자 혼용하여 아이디 입력" class="form-control form-control-lg" pattern="^[a-z0-9]{8,16}" maxlength="16" autocomplete="off" autofocus required />
                                            <input type="hidden" name="idck" id="idck" value="no">
                                            <c:if test="${empty qid }">
                                                <p id="msg"> 아직 아이디 중복 체크를 하지 않으셨습니다. </p>
                                            </c:if>
                                            <c:if test="${not empty qid }">
                                                <p id="msg"> 다시 아이디 중복 체크해주세요. </p>
                                            </c:if>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end w-900" style="margin: 0 auto;">
                                                <input type="button" class="btn btn-primary " value="중복 확인" onclick="idCheck()">
                                            </div>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="pw" name="pw" class="form-control form-control-lg" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"
                                                   placeholder="숫자, 영문, 특수문자 1개 이상 / 8자리 이상 16자리 이하" maxlength="16" required />
                                            <label class="form-label" for="pw"> 비밀번호 </label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="pw2" name="pw2" class="form-control form-control-lg" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$"
                                                   maxlength="16" required />
                                            <label class="form-label" for="pw2"> 비밀번호 확인 </label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="name" name="name" class="form-control form-control-lg" autocomplete="off" required />
                                            <label class="form-label" for="name"> 회원 이름 </label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="email" id="email" name="email" class="form-control form-control-lg" autocomplete="off" required />
                                            <label class="form-label" for="name"> 이메일 </label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="tel" id="tel" name="tel" class="form-control form-control-lg" placeholder="01012345678" autocomplete="off" required />
                                            <label class="form-label" for="name"> 연락처 </label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="date" id="birth" name="birth" class="form-control form-control-lg" autocomplete="off" required />
                                            <label class="form-label" for="name"> 생년월일 </label>
                                        </div>

                                        <div class="form-outline mb-2">
                                            <input type="text" id="address1" name="address1" placeholder="기본 주소 입력" class="form-control form-control-lg mt-20" readonly required />
                                        </div>
                                        <div class="form-outline mb-2">
                                            <input type="text" id="address2" name="address2" placeholder="상세 주소 입력" class="form-control form-control-lg mt-20" autocomplete="off" required />
                                        </div>
                                        <div class="form-outline mb-2">
                                            <input type="text" id="postcode" name="postcode" placeholder="우편번호" class="form-control form-control-lg mt-20" readonly required />
                                        </div>
                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end w-900" style="margin: 0 auto;">
                                            <input type="button" class="btn btn-primary " value="우편 번호 검색" onclick="findAddr()">
                                        </div>

                                        <div class="d-flex justify-content-center mt-4">
                                            <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 회원가입 </button>
                                        </div>

                                        <p class="text-center text-muted mt-5 mb-0"> 이미 가입하셨나요? <a href="${path}/Login.do" class="fw-bold text-body"><u> 로그인하기</u></a></p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            $(document).ready(function(){
                $("#id").keyup(function(){
                    $("#idck").val("no");
                    if($(this).val()!=""){
                        $("#msg").html("<strong>아이디 입력중입니다.</strong>");
                        $("#id").focus();
                    } else {
                        $("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
                    }
                });
            });
            function idCheck(){
                if($("#id").val()==""){
                    alert("아이디를 입력하지 않았습니다.");
                    $("#id").focus();
                    return;
                }

                var params = { id:$("#id").val() }
                $.ajax({
                    url:"${path }/IdCheck.do",
                    type:"post",
                    dataType:"json",
                    data:params,
                    success:function(data) {
                        var idPass = data.result;
                        if(idPass==false) {
                            console.log("기존에 사용되고 있는 아이디");
                            $("#idck").val("no");
                            $("#msg").html("<strong style='color:#FF4F4F'> 중복된 아이디입니다.</strong>");
                            $("#id").focus();
                        } else if(idPass==true) {
                            console.log("사용 가능한 아이디");
                            $("#idck").val("yes");
                            $("#msg").html("<strong style='color:#333333'>사용 가능한 아이디입니다.</strong>");
                        } else if(idPass=="") {
                            console.log("아이디 확인되지 않음");
                            $("#msg").text("<strong style='color:#8FAADC'>아이디가 확인되지 않았습니다. 다시 시도해주세요.</strong>");
                        }
                    }
                });
            }
        </script>
        <script>
            function joinCheck(f){
                if(f.pw.value!=f.pw2.value){
                    alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                    f.pw.focus();
                    return false;
                }
                if(f.idck.value!="yes"){
                    alert("아이디 중복 체크를 하지 않으셨습니다.");
                    return false;
                }
            }
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