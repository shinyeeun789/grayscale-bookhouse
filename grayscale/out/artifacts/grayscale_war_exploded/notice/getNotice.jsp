<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 글 보기 </title>
    <%@ include file="../common.jsp"%>

    <!-- breadcrumb 가져오기 -->
    <link rel="stylesheet" href="${path}/css/breadcrumb.css">
    <script src="${path}/js/breadcrumb.js"></script>
    <script src="${path}/js/jquery-1.10.0.js"></script>

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
        <div class=" container-fluid p-0" style="margin-top: 20px">
            <div class="col-auto col-md-10  ">
                <nav aria-label="breadcrumb " class="first  d-md-flex" >
                    <ol class="breadcrumb indigo lighten-6 first-1 shadow-lg mb-5  ">
                        <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase" href="${path}/"><span> HOME </span></a><img class="ml-md-3" src="https://img.icons8.com/offices/30/000000/double-right.png" width="20" height="20"> </li>
                        <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase" href="${path}/NoticeList.do"><span> 공지사항 </span></a><img class="ml-md-3" src="https://img.icons8.com/offices/30/000000/double-right.png" width="20" height="20"> </li>
                        <li class="breadcrumb-item font-weight-bold mr-0 pr-0"><a class="black-text active-1" href="${path}/Notice.do?no=${noti.no}"><span> 상세 글 보기 </span></a> </li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="container-fluid px-4">
            <h2 class="title"> 공지사항 </h2>
            <div class="container mb-4">
                <div class="row jstify-content-md-center">
                    <div class="col-2 mb-3">
                        <label for="no" class="form-label"> 연번 </label>
                        <input type="text" class="form-control" id="no" name="no" value="${noti.no}" disabled>
                    </div>
                    <div class="col-10 mb-3">
                        <label for="title" class="form-label"> 제목 </label>
                        <input type="text" class="form-control" id="title" name="title" value="${noti.title}" disabled>
                    </div>
                    <div class="col-8 mb-3">
                        <label for="resdate" class="form-label"> 작성일 </label>
                        <input type="text" class="form-control" id="resdate" name="resdate" value="${noti.resdate}" disabled>
                    </div>
                    <div class="col-4 mb-3">
                        <label for="writer" class="form-label"> 조회수 </label> <input
                            type="text" class="form-control" id="writer" name="writer" value="${noti.visited}" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label"> 내용 </label>
                        <textarea class="form-control" id="content" name="content" rows="10" disabled>${noti.content}</textarea>
                    </div>
                    <c:if test="${sid eq 'admin1234' }">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="ModifyNotice.do?no=${noti.no}" class="btn btn-primary btn-block btn-lg gradient-custom-4 me-md-2">modify</a>
                            <a href="DelNotice.do?bno=${noti.no}" class="btn btn-danger btn-block btn-lg gradient-custom-4" onclick="return confirm('삭제하시겠습니까?')">remove</a>
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
