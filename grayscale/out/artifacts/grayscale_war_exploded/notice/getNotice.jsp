<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 글 보기 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>

    <style>
        .form-control:disabled {
            opacity: 1;
            border: none;
        }
    </style>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4> 공지사항 글 상세보기 </h4>
                            <div class="breadcrumb__links">
                                <a href="${path}/">Home</a>
                                <a href="${path}/NoticeList.do?page=1">공지사항</a>
                                <span> 공지사항 글 상세보기 </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <div class="container-fluid px-4 mt-5">
            <div class="row justify-content-md-center">
                <div class="col-sm-8 mb-3 mb-sm-0">
                    <div class="card w-100 mb-3">
                        <div class="card-body">
                            <div class="row justify-content-md-center">
                                <div class="col-12 mb-3">
                                    <h5 class="card-text">[${noti.no}] <b>${noti.title}</b></h5>
                                </div>
                                <div class="col-8 mb-3">
                                    <p class="card-text">작성일 ${noti.resdate}</p>
                                </div>
                                <div class="col-4 mb-3">
                                    <p class="card-text text-end">조회수 ${noti.visited}회</p>
                                </div>
                                <div class="col-12 mb-3">
                                    <textarea class="form-control" rows="10" disabled>${noti.content}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <c:if test="${sid eq 'admin1234' }">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="${path}/NoticeList.do?page=1" class="btn btn-dark"> 목록 </a>
                            <a href="${path}/UpdateNotice.do?no=${noti.no}" class="btn btn-primary"> 수정 </a>
                            <a href="${path}/DeleteNotice.do?no=${noti.no}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?')"> 삭제 </a>
                        </div>
                    </c:if>
                    <c:if test="${sid ne 'admin1234'}">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="${path}/NoticeList.do?page=1" class="btn btn-dark"> 목록으로 </a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
