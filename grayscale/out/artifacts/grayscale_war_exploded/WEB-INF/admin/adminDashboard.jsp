<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="../../common.jsp"%>

    <style>
        .d-block {
            color: #333;
        }
        .d-block:hover {
            color: #333;
            font-weight: bold;
        }
    </style>

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<div class="container-fluid m-0 p-0">
    <%@ include file="../../header.jsp"%>

    <div class="contents" style="min-height:100vh">
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4> Admin Dashboard </h4>
                            <div class="breadcrumb__links">
                                <a href="${path}/">Home</a>
                                <span> Admin Dashboard </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <div class="container">
            <div class="row pt-5">
                <div class="col col-lg-2">
                    <div class="border p-4">
                        <a href="${path}/AdminDashboard.do" class="d-block mt-2 mb-2" style="color:#0275d8; font-weight:bold"> Dashboard </a>
                        <a href="${path}/AdminProList.do" class="d-block mb-2"> 상품 목록 </a>
                        <a href="${path}/AddProduct.do" class="d-block mb-2"> 상품 등록 </a>
                        <a href="${path}/AddReceive.do" class="d-block mb-2"> 상품 입고 </a>
                        <a href="${path}/DeliveryList.do" class="d-block mb-2"> 배송 정보 관리 </a>
                        <a href="${path}/AdminReview.do" class="d-block mb-2"> 리뷰 관리 </a>
                    </div>
                </div>
                <div class="col col-lg-10">
                    <h3 class="mb-2"> PRODUCT LIST </h3>
                    <canvas class="my-4 w-100" id="myChart" width="1326" height="559" style="display: block; box-sizing: border-box; height: 373px; width: 884px;"></canvas>

                    <h3 class="mb-3"> 상품별 판매액 </h3>
                    <div class="table-responsive middle mb-5 pb-5">
                        <table class="table table-striped table-md">
                            <thead class="text-center">
                            <tr>
                                <th scope="col"> # </th>
                                <th scope="col"> 상품명 </th>
                                <th scope="col"> 판매액 </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="pro" items="${profitList}" varStatus="idx">
                                <tr>
                                    <td class="text-center"> ${idx.index + 1} </td>
                                    <td> ${pro.pname} </td>
                                    <td class="text-center"> ${pro.sales} </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>

    <script>
        $(document).ready(function() {
            const labelList = [];
            const sales = [];

            $.ajax({
                url:"${path}/getProfit.do",
                type:"post",
                dataType:"json",
                success: function(data) {
                    for(var i=0; i<data.length; i++) {
                        var temp = data[i];
                        labelList[i] = temp.date;
                        sales[i] = temp.sales;
                        console.log(labelList[i] + " : ");
                        console.log(sales[i] + "!!!!!!!!!!");
                    }

                    var ctx = document.getElementById("myChart");
                    var myChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: labelList,
                            datasets: [{
                                label: '월별 매출액',
                                data: sales,
                                fill: true,
                                backgroundColor: '#282c37',
                                borderColor: '#282c37',
                                borderWidth: 1
                            }],
                        },
                        options: {
                            legend: {
                                display: true
                            }
                        }
                    });
                }, error: function(request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error);
                }
            });
        });
    </script>
</div>
</body>
</html>
