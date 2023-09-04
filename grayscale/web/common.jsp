<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<!-- 메타포, 오픈그래프, 파비콘, 폰트 등 각 종 자원 로딩 -->
<style>
    * { margin: 0;  padding: 0; }
    body, html { width: 100%; }
</style>

<script src="./js/jquery-1.10.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="${path1}/images/logo.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="${path1}/images/logo01_64.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="${path1}/images/logo01_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<!-- 브라우저에서 지원하는 것 중 제일 고화질의 파일 선택 -->
<link rel="icon" href="${path1}/images/logo01_24.png" sizes="24x24">
<link rel="icon" href="${path1}/images/logo01_48.png" sizes="48x48">
<link rel="icon" href="${path1}/images/logo01_64.png" sizes="64x64">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${path1}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/style.css" type="text/css">
<link rel="stylesheet" href="${path1}/css/common.css">

<style>
    .title { text-align: center; margin: 60px 0px 40px 0px; }
    #hd { border-bottom:2px solid #333; }
    #ft { border-top:2px solid #333; margin-top: 20px; }
    .list { list-style: none; }
    .list li { margin-top: 24px; }
</style>