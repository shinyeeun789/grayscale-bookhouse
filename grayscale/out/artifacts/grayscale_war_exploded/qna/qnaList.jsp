<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Q&A 목록 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../common.jsp"%>

    <!-- breadcrumb 가져오기 -->
    <link rel="stylesheet" href="${path}/css/breadcrumb.css">
    <script src="${path}/js/breadcrumb.js"></script>
    <script src="${path}/js/jquery-1.10.0.js"></script>
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
                            <h4> Q&A </h4>
                            <div class="breadcrumb__links">
                                <a href="${path}/">Home</a>
                                <span> Q&A </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <div class="container table-responsive vh-100" style="margin-top: 70px">
            <table class="table table-striped table-m">
                <thead>
                <tr>
                    <th scope="col" class="text-center"> # </th>
                    <th scope="col" class="text-center"> 제목 </th>
                    <th scope="col" class="text-center"> 작성자 </th>
                    <th scope="col" class="text-center"> 작성일 </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="qna" items="${qnaList}">
                    <tr onclick="javascript: location.href = '${path}/getQna.do?qno=${qna.qno}'" style="cursor:pointer;">
                        <td class="col-md-2 text-center"> ${qna.qno} </td>
                        <c:if test="${qna.lev eq 1}">
                            <td class="col-md-6"> ㄴ ${qna.title} </td>
                        </c:if>
                        <c:if test="${qna.lev ne 1}">
                            <td class="col-md-6"> ${qna.title} </td>
                        </c:if>
                        <td class="col-md-2 text-center"> ${qna.author} </td>
                        <td class="col-md-2 text-center"> ${qna.resdate} </td>
                    </tr>
                </c:forEach>
                <c:if test="${paging.pageList.size() eq 0}">
                    <tr>
                        <td class="col-md-12 text-center" colspan="4"> 등록된 Q&A가 없습니다 :) </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
            <!-- 페이징 -->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${paging.prev}">
                        <li class="page-item">
                            <a class="page-link" href="${path}/qnaList.do?page=1"> &lt; </a>
                        </li>
                    </c:if>
                    <c:if test="${not paging.prev}">
                        <li class="page-item disabled">
                            <a class="page-link"> &lt; </a>
                        </li>
                    </c:if>
                    <c:forEach var="page" items="${paging.pageList}">
                        <c:if test="${page eq curPage}">
                            <li class="page-item active"><a class="page-link" href="${path}/qnaList.do?page=${page}">${page}</a></li>
                        </c:if>
                        <c:if test="${page ne curPage}">
                            <li class="page-item"><a class="page-link" href="${path}/qnaList.do?page=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${paging.next}">
                        <li class="page-item">
                            <a class="page-link" href="${path}/qnaList.do?page=${paging.nextPage}"> &gt; </a>
                        </li>
                    </c:if>
                    <c:if test="${not paging.next}">
                        <li class="page-item disabled">
                            <a class="page-link"> &gt; </a>
                        </li>
                    </c:if>

                </ul>
            </nav>
            <c:if test="${sid ne null and sid ne 'admin1234'}">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="${path}/AddQuestion.do" class="btn btn-dark"> 글 작성 </a>
                </div>
            </c:if>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>