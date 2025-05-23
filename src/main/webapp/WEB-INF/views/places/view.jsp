<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="org.example.travel.dto.detail.DetailItemDTO" %>
<%@ page import="org.example.travel.dto.nearby.NearByItemDTO" %>
<%@ page import="java.util.List" %>

<%
    DetailItemDTO detailDTO = (DetailItemDTO) request.getAttribute("detail");
    String contentId = (String) request.getAttribute("contentId");
    String pageNo = (String) request.getAttribute("page");

    List<NearByItemDTO> nearbyTourist = (List<NearByItemDTO>) request.getAttribute("nearbyTourist");
    List<NearByItemDTO> nearbyFood = (List<NearByItemDTO>) request.getAttribute("nearbyFood");
    List<NearByItemDTO> nearbyAccom = (List<NearByItemDTO>) request.getAttribute("nearbyAccom");
%>

<html>
<head>
    <title><%=detailDTO.getTitle()%> 상세정보</title>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e36935031673a834fba88fed46cd2d"></script>

    <link rel="stylesheet" href="/css/style_view.css">

    <script>
        $(document).ready(function () {
            // 지도
            var lat = <%=detailDTO.getMapy()%>;
            var lng = <%=detailDTO.getMapx()%>;
            var map = new kakao.maps.Map(document.getElementById('map'), {
                center: new kakao.maps.LatLng(lat, lng),
                level: 3
            });
            new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lng),
                map: map
            });

            // 이미지 슬라이드
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

            // 주변 관광지 (카드 슬라이드 + dot)
            const $cards = $('.recommend-cards-container .card');
            const cardsPerPage = 3;
            const totalPages = Math.ceil($cards.length / cardsPerPage);
            let currentPage = 0;

            for (let i = 0; i < totalPages; i++) {
                $('.recommend-dots').append('<span class="recommend-dot"></span>');
            }
            const $dots2 = $('.recommend-dot');

            function updateCards() {
                $cards.hide();
                const start = currentPage * cardsPerPage;
                $cards.slice(start, start + cardsPerPage).show();

                // dot 표시 갱신
                $dots2.removeClass('active').eq(currentPage).addClass('active');
            }

            $('.recommend-arrow.left').click(function () {
                if (currentPage > 0) {
                    currentPage--;
                    updateCards();
                }
            });

            $('.recommend-arrow.right').click(function () {
                if (currentPage < totalPages - 1) {
                    currentPage++;
                    updateCards();
                }
            });

            updateCards();

            // 주변 숙소 (카드 슬라이드 + dot)
            const $accomCards = $('.accom-cards-container .accom-card');
            const accomPerPage = 3;
            const accomPages = Math.ceil($accomCards.length / accomPerPage);
            let accomCurrent = 0;

            for (let i = 0; i < accomPages; i++) {
                $('.accom-dots').append('<span class="accom-dot"></span>');
            }
            const $accomDots = $('.accom-dot');

            function updateAccom() {
                $accomCards.hide();
                const start = accomCurrent * accomPerPage;
                $accomCards.slice(start, start + accomPerPage).show();

                $accomDots.removeClass('active').eq(accomCurrent).addClass('active');
            }

            $('.accom-arrow.left').click(function () {
                if (accomCurrent > 0) {
                    accomCurrent--;
                    updateAccom();
                }
            });

            $('.accom-arrow.right').click(function () {
                if (accomCurrent < accomPages - 1) {
                    accomCurrent++;
                    updateAccom();
                }
            });

            updateAccom();

            // 주변 음식점
            const $foodCards = $('.food-cards-container .food-card');
            const foodPerPage = 3;
            const foodPages = Math.ceil($foodCards.length / foodPerPage);
            let foodCurrent = 0;

            for (let i = 0; i < foodPages; i++) {
                $('.food-dots').append('<span class="food-dot"></span>');
            }
            const $foodDots = $('.food-dot');

            function updateFood() {
                $foodCards.hide();
                const start = foodCurrent * foodPerPage;
                $foodCards.slice(start, start + foodPerPage).show();

                $foodDots.removeClass('active').eq(foodCurrent).addClass('active');
            }

            $('.food-arrow.left').click(function () {
                if (foodCurrent > 0) {
                    foodCurrent--;
                    updateFood();
                }
            });

            $('.food-arrow.right').click(function () {
                if (foodCurrent < foodPages - 1) {
                    foodCurrent++;
                    updateFood();
                }
            });

            updateFood();
        });
    </script>
</head>
<body>

<!-- ✅ 헤더 -->
<header>
    <a onclick="location.href='/main'" class="logo">🚗 여행가자</a>
    <nav class="nav-menu">
        <button onclick="location.href='/list'">전체</button>
        <button onclick="location.href='/regionList'">지역</button>
        <button onclick="location.href='/accomodationsList'">숙박</button>
    </nav>
</header>

<!-- ✅ 상세보기 전체 -->
<div class="container">
    <div class="page-header">
        <h1 class="page-title"><%=detailDTO.getTitle()%></h1>
    </div>

    <!-- 🔹 이미지 + 정보 -->
    <div class="main-content">
        <div>
            <div class="slider-wrapper">
                <img class="slider-image active" src="<%=detailDTO.getFirstimage()%>" alt="이미지1">
                <img class="slider-image" src="<%=detailDTO.getFirstimage2()%>" alt="이미지2">

                <button class="slider-arrow left">&lt;</button>
                <button class="slider-arrow right">&gt;</button>

                <div class="slider-dots">
                    <span class="slider-dot active"></span>
                    <span class="slider-dot"></span>
                </div>
            </div>
        </div>
        <div class="info-box">
            <h3>여행지 정보</h3>
            <!-- 지역코드 -> 지역명 변환 코드 필요 -->
            <p><strong>지역:</strong> <span class="tag" onclick="location.href='/regionlist'"><%="(코드수정)"%></span></p>
            <p><strong>분류:</strong> <%=detailDTO.getCat1()%></p>
            <p><strong>상세 분류:</strong> <%=detailDTO.getCat3()%></p>
            <p><strong>주소:</strong> <%=detailDTO.getAddr1() + " " + detailDTO.getAddr2()%></p>
            <p><strong>문의 및 안내:</strong> <%=detailDTO.getTel()%></p>
        </div>
    </div>

    <!-- 🔹 설명 -->
    <div class="description">
        <h3>상세정보</h3>
        <p>
            <%=detailDTO.getOverview()%>
        </p>
    </div>

    <!-- 🔹 지도 -->
    <div id="map"></div>

    <!-- 🔹 주변 관광지 -->
    <div class="related-section">
        <h3 class="section-title">주변 관광지</h3>

        <div class="recommend-static-wrapper">
            <button class="recommend-arrow left">&lt;</button>

            <div class="recommend-cards-container">

                <%
                    for (NearByItemDTO to : nearbyTourist) {
                        String url = "/view?page=" + pageNo + "&contentId=" + to.getContentid();
                        String imageUrl = to.getFirstimage();
                        if (imageUrl == null || imageUrl.trim().isEmpty()) {
                            imageUrl = "/image/sample.png";
                        }

                        out.println("<div class='card' onclick=\"location.href='" + url + "'\">");
                        out.println("<div class='card-image' style=\"background-image: url('" + imageUrl + "');\">");
                        out.println("<div class='overlay'>관광지 상세보기</div>");
                        out.println("</div>");
                        out.println("<div class='label'>" + to.getTitle() + "</div>");
                        out.println("</div>");

                    }

                %>

            </div>

            <button class="recommend-arrow right">&gt;</button>
        </div>

        <div class="recommend-dots">
            <!-- JS로 dot 생성 -->
        </div>

    </div>

    <!-- 🔹 주변 숙소 -->
    <div class="related-section">
        <h3 class="section-title">주변 숙소</h3>

        <div class="accom-static-wrapper">
            <button class="accom-arrow left">&lt;</button>

            <div class="accom-cards-container">

                <%
                    for (NearByItemDTO to : nearbyAccom) {
                        String url = "/view?page=" + pageNo + "&contentId=" + to.getContentid();
                        String imageUrl = to.getFirstimage();
                        if (imageUrl == null || imageUrl.trim().isEmpty()) {
                            imageUrl = "/image/sample.png";
                        }

                        out.println("<div class='card accom-card' onclick=\"location.href='" + url + "'\">");
                        out.println("<div class='card-image' style=\"background-image: url('" + imageUrl + "');\">");
                        out.println("<div class='overlay'>숙소 상세보기</div>");
                        out.println("</div>");
                        out.println("<div class='label'>" + to.getTitle() + "</div>");
                        out.println("</div>");
                    }

                %>

            </div>

            <button class="accom-arrow right">&gt;</button>
        </div>

        <div class="accom-dots"></div>
    </div>

    <!-- 🔹 주변 음식점 -->
    <div class="related-section">
        <h3 class="section-title">주변 음식점</h3>

        <div class="food-static-wrapper">
            <button class="food-arrow left">&lt;</button>

            <div class="food-cards-container">

                <%
                    for (NearByItemDTO to : nearbyFood) {
                        String url = "/view?page=" + pageNo + "&contentId=" + to.getContentid();
                        String imageUrl = to.getFirstimage();
                        if (imageUrl == null || imageUrl.trim().isEmpty()) {
                            imageUrl = "/image/sample.png";
                        }

                        out.println("<div class='card food-card' onclick=\"location.href='" + url + "'\">");
                        out.println("<div class='card-image' style=\"background-image: url('" + imageUrl + "');\">");
                        out.println("<div class='overlay'>음식점 상세보기</div>");
                        out.println("</div>");
                        out.println("<div class='label'>" + to.getTitle() + "</div>");
                        out.println("</div>");
                    }

                %>

            </div>

            <button class="food-arrow right">&gt;</button>
        </div>

        <div class="food-dots"></div>
    </div>
</div>

<!-- ✅ 푸터 -->
<footer>
    © 2025 여행 플랫폼 프로젝트 팀
</footer>

</body>
</html>