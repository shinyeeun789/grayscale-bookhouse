<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 글 작성하기 </title>
    <%@ include file="../../common.jsp"%>

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
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <div class=" container-fluid p-0" style="margin-top: 20px">
            <div class="col-auto col-md-10  ">
                <nav aria-label="breadcrumb " class="first  d-md-flex" >
                    <ol class="breadcrumb indigo lighten-6 first-1 shadow-lg mb-5  ">
                        <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase" href="${path}/"><span> HOME </span></a><img class="ml-md-3" src="https://img.icons8.com/offices/30/000000/double-right.png" width="20" height="20"> </li>
                        <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase" href="${path}/NoticeList.do"><span> 공지사항 </span></a><img class="ml-md-3" src="https://img.icons8.com/offices/30/000000/double-right.png" width="20" height="20"> </li>
                        <li class="breadcrumb-item font-weight-bold mr-0 pr-0"><a class="black-text active-1" href="${path}/Notice.do?no=${noti.no}"><span> 작성하기 </span></a> </li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="container-fluid px-4">
            <h2 class="title"> 공지사항 글 작성 </h2>
                <div class="container mb-4">
                    <form name="frm1" id="frm1" action="${path}/AddNoticePro.do" method="post">
                    <div class="jstify-content-md-center">
                        <div class="mb-3">
                            <label for="title" class="form-label"> 제목 </label>
                            <input type="text" class="form-control" id="title" name="title">
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label"> 내용 </label>
                            <textarea class="form-control" id="content" name="content" rows="10"></textarea>
                        </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <input type="submit" class="btn btn-primary btn-block gradient-custom-4 me-md-2" value="작성">
                            </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>
