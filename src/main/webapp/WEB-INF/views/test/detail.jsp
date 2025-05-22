<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.travel.dto.detail.DetailItemDTO" %>
<%@ page import="org.example.travel.dto.nearby.NearByItemDTO" %>
<%@ page import="java.util.List" %>

<%
    DetailItemDTO detail = (DetailItemDTO) request.getAttribute("detail");
    List<NearByItemDTO> nearbyList = (List<NearByItemDTO>) request.getAttribute("nearby");
%>
<html>
<head>
    <title><%= detail.getTitle() %> 상세정보</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e36935031673a834fba88fed46cd2d"></script>
    <script>
        $(document).ready(function () {
            var lat = <%= detail.getMapy() %>;
            var lng = <%= detail.getMapx() %>;

            var map = new kakao.maps.Map(document.getElementById('map'), {
                center: new kakao.maps.LatLng(lat, lng),
                level: 3
            });

            new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lng),
                map: map
            });

            var currentIndex = 0;
            var $slides = $('.slider-image');
            var $dots = $('.slider-dot');

            function showSlide(index) {
                $slides.removeClass('active').eq(index).addClass('active');
                $dots.removeClass('active').eq(index).addClass('active');
            }

            $('.slider-arrow.left').click(function () {
                currentIndex = (currentIndex - 1 + $slides.length) % $slides.length;
                showSlide(currentIndex);
            });

            $('.slider-arrow.right').click(function () {
                currentIndex = (currentIndex + 1) % $slides.length;
                showSlide(currentIndex);
            });

            $dots.click(function () {
                currentIndex = $(this).index();
                showSlide(currentIndex);
            });
        });
    </script>
    <style>
        <%-- 기존 스타일 생략 --%>
    </style>
</head>
<body>

<!-- ✅ 헤더 -->
<header>
    <div class="logo"><strong>✅ 여행 가자</strong></div>
    <div>
        <a href="#">전체 목록</a>
        <a href="#">지역별 목록</a>
        <a href="#">미정</a>
    </div>
</header>

<!-- ✅ 상세보기 전체 -->
<div class="container">
    <div class="page-header">
        <h1 class="page-title"><%= detail.getTitle() %></h1>
    </div>

    <!-- 🔹 이미지 + 정보 -->
    <div class="main-content">
        <div>
            <div class="slider-wrapper">
                <img class="slider-image active" src="<%= detail.getFirstimage() != null ? detail.getFirstimage() : "/img/sample1.jpg" %>" alt="이미지1">
                <img class="slider-image" src="<%= detail.getFirstimage2() != null ? detail.getFirstimage2() : "/img/sample2.jpg" %>" alt="이미지2">
                <img class="slider-image" src="/img/sample3.jpg" alt="이미지3">
                <button class="slider-arrow left">&lt;</button>
                <button class="slider-arrow right">&gt;</button>
                <div class="slider-dots">
                    <span class="slider-dot active"></span>
                    <span class="slider-dot"></span>
                    <span class="slider-dot"></span>
                </div>
            </div>
        </div>

        <div class="info-box">
            <h3>여행지 정보</h3>
            <p><strong>지역:</strong> <span class="tag">#<%= detail.getAreacode() %></span></p>
            <p><strong>주소:</strong> <%= detail.getAddr1() %> <%= detail.getAddr2() %></p>
            <p><strong>문의 및 안내:</strong> <%= detail.getTel() != null && !detail.getTel().isEmpty() ? detail.getTel() : "정보 없음" %></p>
        </div>
    </div>

    <!-- 🔹 설명 -->
    <div class="description">
        <h3>상세정보</h3>
        <p><%= detail.getOverview() %></p>
    </div>

    <!-- 🔹 지도 -->
    <div id="map"></div>

    <!-- 🔹 주변 관광지 -->
    <div class="related-section">
        <h3 class="section-title">📍 주변 관광지</h3>
        <div class="related-cards">
            <%
                if (nearbyList != null && !nearbyList.isEmpty()) {
                    for (NearByItemDTO nearby : nearbyList) {
            %>
            <div class="card" style="background-image: url('<%= nearby.getFirstimage() != null && !nearby.getFirstimage().isEmpty() ? nearby.getFirstimage() : "/img/sample1.jpg" %>');"
                 onclick="location.href='/places/detail?contentId=<%= nearby.getContentid() %>'">
                <div class="overlay">관광지 상세보기</div>
                <div class="label"><%= nearby.getTitle() %></div>
            </div>
            <%
                }
            } else {
            %>
            <p>주변 관광지 정보가 없습니다.</p>
            <%
                }
            %>
        </div>
    </div>
</div>

<!-- ✅ 푸터 -->
<footer>
    © 2025 여행 플랫폼 프로젝트 팀
</footer>

</body>
</html>
