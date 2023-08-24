<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 공지사항 목록 </title>
    <%@ include file="../common.jsp"%>

    <!-- breadcrumb 가져오기 -->
    <link rel="stylesheet" href="${path}/css/breadcrumb.css">
    <script src="${path}/js/breadcrumb.js"></script>
    <script src="${path}/js/jquery-1.10.0.js"></script>

    <style>
        .table tr:first-of-type td:nth-child(2)::before, .table tr:nth-of-type(2) td:nth-child(2)::before {
            background-color: #333;
            content: "📢 NEW";
            color: white;
            padding: 7px;
            border-radius: 100px;
            font-size: 0.8em;
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
                        <li class="breadcrumb-item font-weight-bold mr-0 pr-0"><a class="black-text active-1" href="${path}/NoticeList.do"><span> 공지사항 </span></a> </li>
                    </ol>
                </nav>
            </div>
        </div>
        <h2 class="title"> 공지사항 </h2>
        <div class="container table-responsive">
            <table class="table table-striped table-m">
                <thead>
                <tr class="table-primary">
                    <th scope="col" class="text-center">#</th>
                    <th scope="col" class="text-center"> 제목 </th>
                    <th scope="col" class="text-center"> 작성일 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="notice" items="${notiList}">
                    <tr onclick="javascript: location.href = '${path}/Notice.do?no=${notice.no}'" style="cursor:pointer;">
                        <td class="col-md-2 text-center"> ${notice.no} </td>
                        <td class="col-md-8"> ${notice.title}</td>
                        <td class="col-md-2 text-center"> ${notice.resdate} </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- 페이징 -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${paging.prev}">
                        <li class="page-item">
                            <a class="page-link"> &lt; </a>
                        </li>
                    </c:if>
                    <c:if test="${not paging.prev}">
                        <li class="page-item disabled">
                            <a class="page-link"> &lt; </a>
                        </li>
                    </c:if>
                    <c:forEach var="page" items="${paging.pageList}">
                        <c:if test="${page eq curPage}">
                            <li class="page-item active"><a class="page-link" href="${path}/NoticeList.do?page=${page}">${page}</a></li>
                        </c:if>
                        <c:if test="${page ne curPage}">
                            <li class="page-item"><a class="page-link" href="${path}/NoticeList.do?page=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${paging.prev}">
                        <li class="page-item">
                            <a class="page-link" href="#"> &gt; </a>
                        </li>
                    </c:if>
                    <c:if test="${not paging.prev}">
                        <li class="page-item disabled">
                            <a class="page-link" href="#"> &gt; </a>
                        </li>
                    </c:if>

                </ul>
            </nav>
            <c:if test="${sid eq 'admin1234' }">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="AddNotice.do" class="btn btn-primary btn-block gradient-custom-4"> 글 작성 </a>
                </div>
            </c:if>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
