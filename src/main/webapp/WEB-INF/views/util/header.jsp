<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/resources/js/scripts.js"></script>

    <style type="text/css">

        .navbar{
            position:fixed;
            z-index:1;
            width:100%;
            height: 100px;
            background-color: #00CED1;
        }

        .main-content {
            padding-top: 100px; /* navbar 높이만큼 여백 */
        }

        .button-group button {
            margin-left: 10px;
            font-size: 20px;
            padding: 5px 10px;
            cursor: pointer;
            background: none;
            border: none;
        }
    </style>


</head>

<body>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light custom-skyblue-bg">
    <div class="container-fluid px-4 d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="/"><img src="/images/tg1.png" style="width:230px;"></a>
        <%--<a class="navbar-brand" href="/index"></a>--%>

        <!-- 오른쪽 버튼 그룹 -->
        <div class="button-group">
            <button type="button" onclick="location.href='./AllList'">전체 관광명소</button>
            <button type="button" onclick="location.href='./DistrictList'">지역별 관광명소</button>
            <button>OPEN API</button>

        </div>
    </div>
</nav>

</body>

<header></header>