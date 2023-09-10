<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title> 배송정보 변경 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <c:set var="state_list" value="${fn:split('입고,상차,하차,배송 중,배송 도착',',')}"/>
    <%@ include file="../../common.jsp"%>
</head>

<body>
<div class="container-fluid m-0 p-0">
    <%@include file="../../header.jsp"%>

    <div class="contents" style="min-height:100vh">
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4> MyPage </h4>
                            <div class="breadcrumb__links">
                                <a href="${path}/">Home</a>
                                <span> Admin Notice </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <div class="container-md p-5 mt-5">
            <h4 class="mb-2"> 주문 정보 </h4>
            <div class="border p-4">
                <div class="row">
                    <div class="form-outline mb-4 col col-3">
                        <input type="text" name="dno" class="form-control form-control"value="${delivery.dno}" readonly />
                        <label class="form-label" for="pname"> 배송번호 </label>
                    </div>

                    <div class="form-outline mb-4 col col-9">
                        <input type="text" id="pname" name="pname" class="form-control form-control" value="${delivery.pname}" readonly />
                        <label class="form-label" for="pname"> 상품명 </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-6">
                        <input type="text" class="form-control" id="cid" name="cid" value="${delivery.cid}" readonly>
                        <label for="cid" class="form-label"> 주문자 ID </label>
                    </div>
                    <div class="form-outline mb-4 col col-6">
                        <input type="text" class="form-control" id="custel" name="custel" value="${delivery.custel}" readonly>
                        <label for="custel" class="form-label"> 주문자 전화번호 </label>
                    </div>
                </div>
                <div class="form-outline">
                    <input class="form-control form-control" type="text" name="daddr" id="daddr" value="${delivery.addr}" readonly>
                    <label for="daddr" class="form-label"> 배송지주소 </label>
                </div>
            </div>

            <h4 class="mt-5 mb-2"> 배송 정보 </h4>
            <form name="frm1" id="frm1" action="${path}/UpdateDeliveryPro.do" method="post" class="border p-4">
                <div class="row">
                    <div class="form-outline mb-4 col col-6">
                        <input type="hidden" id="dno" name="dno" value="${delivery.dno}">
                        <input type="hidden" id="type" name="type" value="${param.type}">
                        <input type="date" id="sdate" name="sdate" class="form-control form-control" value="${fn:substring(delivery.sdate, 0, 10)}" readonly />
                        <label class="form-label" for="sdate"> 배송시작일 </label>
                    </div>
                    <div class="form-outline mb-4 col col-6">
                        <input type="date" id="rdate" name="rdate" class="form-control form-control" value="${fn:substring(delivery.rdate, 0, 10)}" required />
                        <label class="form-label" for="rdate"> 배송예정일 </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-4">
                        <input type="text" class="form-control" id="pcom" name="pcom" value="${delivery.pcom}" required>
                        <label for="pcom" class="form-label"> 배송사 </label>
                    </div>
                    <div class="form-outline mb-4 col col-8">
                        <input type="text" class="form-control" id="ptel" name="ptel" value="${delivery.ptel}" required>
                        <label for="ptel" class="form-label"> 배송기사 전화번호 </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-8">
                        <input class="form-control" type="text" name="bcode" id="bcode" value="${delivery.bcode}" required>
                        <label for="bcode" class="form-label"> 송장번호 </label>
                    </div>
                    <div class="form-outline mb-4 col col-4">
                        <select class="form-control" name="pstate" id="pstate">
                            <c:forEach var="state" items="${state_list}" varStatus="status">
                                <c:if test="${delivery.curState eq state}">
                                    <option value="${status.index}" selected> ${state} </option>
                                </c:if>
                                <c:if test="${delivery.curState ne state}">
                                    <option value="${status.index}"> ${state} </option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <label for="pstate" class="form-label"> 배송상태 </label>
                    </div>
                </div>

                <div class="d-flex justify-content-center mt-4">
                    <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 배송정보 수정 </button>
                </div>
            </form>
        </div>
    </div>

    <%@include file="../../footer.jsp"%>
</div>
</body>
</html>
