<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${place.placeName} 상세정보</title>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e36935031673a834fba88fed46cd2d"></script>

    <link rel="stylesheet" href="/css/style_view.css">

    <script>
        $(document).ready(function () {
            // 지도
            var lat = ${place.lat};
            var lng = ${place.lng};
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
</head>
<body>

<!-- ✅ 헤더 -->
<header>
    <div class="logo">🚗 여행가자</div>
    <nav class="nav-menu">
        <button>전체</button>
        <button>지역</button>
        <button>미정</button>
    </nav>
</header>

<!-- ✅ 상세보기 전체 -->
<div class="container">
    <div class="page-header">
        <h1 class="page-title">${place.placeName}</h1>
    </div>

    <!-- 🔹 이미지 + 정보 -->
    <div class="main-content">
        <div>
            <div class="slider-wrapper">
                <img class="slider-image active" src="/image/sample.png" alt="이미지1">
                <img class="slider-image" src="/image/sample2.jpg" alt="이미지2">
                <img class="slider-image" src="/image/sample3.jpg" alt="이미지3">

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
            <p><strong>지역:</strong> <span class="tag">#서울</span></p>
            <p><strong>주소:</strong> 서울 종로구 세종로 1-1</p>
            <p><strong>문의 및 안내:</strong> 02-120</p>
        </div>
    </div>

    <!-- 🔹 설명 -->
    <div class="description">
        <h3>상세정보</h3>
        <p>
            서울 시청은 서울특별시의 중심 행정 기관으로, 시민과 소통하는 열린 공간입니다.<br>
            덕수궁, 청계천, 광화문 등 다양한 명소가 밀집해 있어 관광과 문화 체험이 용이합니다.
        </p>
    </div>

    <!-- 🔹 지도 -->
    <div id="map"></div>

    <!-- 🔹 주변 관광지 -->
    <div class="related-section">
        <h3 class="section-title">추천 관광지</h3>

        <div class="recommend-cards-wrapper">

            <div class="card">
                <div class="card-image" style="background-image: url('/image/sample.png');">
                    <div class="overlay">관광지 상세보기</div>
                </div>
                <div class="label">덕수궁1</div>
            </div>

            <div class="card">
                <div class="card-image" style="background-image: url('/image/sample.png');">
                    <div class="overlay">관광지 상세보기</div>
                </div>
                <div class="label">덕수궁2</div>
            </div>

            <div class="card">
                <div class="card-image" style="background-image: url('/image/sample.png');">
                    <div class="overlay">관광지 상세보기</div>
                </div>
                <div class="label">덕수궁3</div>
            </div>

        </div>
    </div>
</div>

<!-- ✅ 푸터 -->
<footer>
    © 2025 여행 플랫폼 프로젝트 팀
</footer>

</body>
</html>