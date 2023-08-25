<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글 수정하기</title>
    <c:set var="path" value="<%=request.getContextPath()%>" />
    <%@ include file="../../common.jsp"%>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../../header.jsp"%>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4> 공지사항 글 수정하기 </h4>
                        <div class="breadcrumb__links">
                            <a href="${path}/">Home</a>
                            <a href="${path}/NoticeList.do?page=1">공지사항</a>
                            <span> 공지사항 글 수정하기 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <div class="container-fluid px-4 mt-5 mb-5">
        <div class="row justify-content-md-center">
            <div class="col-sm-8 mb-3 mb-sm-0">
                <div class="card w-100 mb-3">
                    <div class="card-body">
                        <form action="${path}/UpdateNoticePro.do" method="post">
                            <div class="form-outline mb-4">
                                <label for="title" class="form-label"> 제목 </label>
                                <input type="text" class="form-control" id="title" name="title" value="${noti.title}" required>
                                <input type="hidden" id="no" name="no" value="${noti.no}">
                            </div>
                            <div class="form-outline mb-4">
                                <label for="content" class="form-label"> 내용 </label>
                                <textarea class="form-control" id="content" name="content" rows="10">${noti.content}</textarea>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <input type="submit" class="btn btn-dark btn-block gradient-custom-4" value="글 수정하기">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>
