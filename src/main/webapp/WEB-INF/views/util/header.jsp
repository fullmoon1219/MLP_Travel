<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 공통 헤더 -->
<div class="navigation-bar">
    <h1>
        <a href="./" class="logo-link">
            <img src="/images/icon_car.png" alt="여행 아이콘"
                 style="width: 50px; vertical-align: middle; margin-right: 10px;">
            여행 가자
        </a>
    </h1>
    <div class="nav-menu">
        <%
            String path = (String) request.getAttribute("activePath");

            if (path == null) path = "";
        %>

        <a href="./search" class="<%= path.startsWith("/search") ? "active" : "" %>">검색</a>
        <a href="./district" class="<%= path.startsWith("/district") ? "active" : "" %>">관광지</a>
        <a href="./accom" class="<%= path.startsWith("/accom") ? "active" : "" %>">숙박시설</a>
        <a href="./food" class="<%= path.startsWith("/food") ? "active" : "" %>">음식점</a>

    </div>
</div>
