<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>
    <c:if test="${param.msg eq 'fail'}">
        <script>
            alert("로그인에 실패했습니다.");
        </script>
    </c:if>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../header.jsp"%>
    <div class="contents">
        <section class="vh-100" style="background-color: #eee;">
            <div class="container vh-100">
                <div class="row d-flex justify-content-center align-items-center vh-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <form action="${path}/LoginPro.do" method="post">
                                    <h3 class="mb-5">Sign in</h3>
                                    <div class="form-outline mb-4">
                                        <input type="id" id="id" name="id" class="form-control form-control-lg" placeholder="아이디 입력" autofocus autocomplete="off" required />
                                    </div>
                                    <div class="form-outline mb-4">
                                        <input type="password" id="pw" name="pw" class="form-control form-control-lg" placeholder="비밀번호 입력" autocomplete="off" required />
                                    </div>
                                    <button class="btn btn-primary btn-lg btn-block w-100" type="submit">Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@ include file="../footer.jsp" %>
    </div>
</div>
</body>
</html>
