<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 공통 헤더 -->
<div class="navigation-bar">
    <h1>
        <a href="./" class="logo-link">
            <img src="/images/icon_car.png" alt="여행 아이콘" style="width: 50px; vertical-align: middle; margin-right: 10px;">
            여행 가자
        </a>
    </h1>
    <div class="nav-menu">
        <%
            String uri = request.getRequestURI();
        %>
        <a href="./list" class="<%= uri.endsWith("/list") ? "active" : "" %>">전체목록</a>
        <a href="./district" class="<%= uri.contains("/district") ? "active" : "" %>">지역별 관광지</a>
        <a href="./accom" class="<%= uri.contains("/accom") ? "active" : "" %>">지역별 숙박시설</a>
        <a href="./food" class="<%= uri.endsWith("/food") ? "active" : "" %>">지역별 음식점</a>

    </div>
</div>
