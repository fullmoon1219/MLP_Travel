<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${place.placeName} 상세정보</title>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e36935031673a834fba88fed46cd2d"></script>

    <script>
        $(document).ready(function () {
            $(function () {
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

                // 슬라이더
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
        });
    </script>

    <style>
        body { font-family: sans-serif; margin: 0; padding: 0; background: #fff; }
        header, footer {
            background: #f8f8f8;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header a {
            margin-left: 20px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        .container {
            max-width: 1000px;
            margin: auto;
            padding: 20px;
        }
        .main-content {
            display: flex;
            gap: 30px;
            align-items: stretch;
            margin-bottom: 40px;
            justify-content: center;
        }

        .page-header {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 40px;
        }

        .page-title {
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .page-header::after {
            content: "";
            display: block;
            width: 40px;
            height: 2px;
            background-color: #eee;  /* 얇은 구분선 */
            margin: 10px auto 0;
        }

        .slider-wrapper {
            position: relative;
            width: 500px;
            height: 350px;
            overflow: hidden;
            border: 1px solid #ccc;
        }
        .slider-image {
            display: none;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .slider-image.active {
            display: block;
        }
        .slider-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 30px;
            font-weight: bold;
            background: rgba(255,255,255,0.6);
            border: none;
            cursor: pointer;
        }
        .slider-arrow.left { left: 10px; }
        .slider-arrow.right { right: 10px; }

        .slider-dots {
            position: absolute;
            bottom: 10px;
            width: 100%;
            text-align: center;
        }
        .slider-dot {
            display: inline-block;
            width: 12px;
            height: 12px;
            margin: 0 4px;
            background: #ccc;
            border-radius: 50%;
            cursor: pointer;
        }
        .slider-dot.active {
            background: #333;
        }

        .info-box {
            border: 1px solid #ccc;
            padding: 30px 20px;
            background: #fafafa;
            border-radius: 6px;
            width: 280px;
            font-size: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            flex-direction: column;
            margin-left: 10px;
            line-height: 1.75;
        }
        .info-box p {
            margin: 10px 0;
            font-size: 15px;
        }
        .info-box h3 {
            margin-top: 0;
            margin-bottom: 15px;
            font-size: 18px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
        }
        .info-box .tag {
            background-color: #eee;
            color: #333;
            padding: 2px 8px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
        }

        .description {
            margin-top: 30px;
            font-size: 15px;
            line-height: 1.7;
        }
        .description h3 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            padding-bottom: 5px;
            border-bottom: 2px solid #333; /* ✅ 구분선 역할 */
        }

        #map {
            width: 90%;
            height: 400px;
            margin: 30px auto;
            border: 1px solid #ddd;
        }

        .related-section {
            margin-top: 50px;
            text-align: center;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 50px;
            margin-bottom: 15px;
            padding-bottom: 6px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .related-cards {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 20px;
        }

        .card {
            position: relative;
            width: 220px;
            height: 150px;
            border-radius: 12px;
            overflow: hidden;
            background-size: cover;
            background-position: center;
            cursor: pointer;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.03);
        }

        .card .overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.4);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            opacity: 0;
            transition: opacity 0.3s;
            font-size: 16px;
        }

        .card:hover .overlay {
            opacity: 1;
        }

        .card .label {
            position: absolute;
            bottom: 10px;
            left: 0;
            width: 100%;
            text-align: center;
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
            pointer-events: none;
        }

        footer {
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .logo {
            font-size: 26px;
        }
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
        <h1 class="page-title">${place.placeName}</h1>
    </div>

    <!-- 🔹 이미지 + 정보 -->
    <div class="main-content">
        <div>
            <div class="slider-wrapper">
                <img class="slider-image active" src="/img/sample1.jpg" alt="이미지1">
                <img class="slider-image" src="/img/sample2.jpg" alt="이미지2">
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
        <h3 class="section-title">📍 주변 관광지</h3>
        <div class="related-cards">
            <div class="card" style="background-image: url('/img/place1.jpg');">
                <div class="overlay">관광지 상세보기</div>
                <div class="label">덕수궁</div>
            </div>
            <div class="card" style="background-image: url('/img/place2.jpg');">
                <div class="overlay">관광지 상세보기</div>
                <div class="label">광화문</div>
            </div>
            <div class="card" style="background-image: url('/img/place3.jpg');">
                <div class="overlay">관광지 상세보기</div>
                <div class="label">청계천</div>
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