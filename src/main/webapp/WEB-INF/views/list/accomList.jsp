<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../util/header.jsp" %>

<html>
<head>
    <title>숙소 리스트</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_district.css">
    <script src="/js/jquery-3.7.1.js"></script>

    <script>
        $(document).ready(function () {

            // 공통 클릭 이벤트 핸들러 정의
            function loadRegionData(regionName) {
                $('.region-tag').removeClass('selected');
                $('.region-tag').each(function () {
                    if ($(this).text().includes(regionName)) {
                        $(this).addClass('selected');
                    }
                });

                console.log("선택한 지역:", regionName);

                $.ajax({
                    url: '/api/places?region=' + regionName,
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        console.log("받은 데이터:", data);

                        $('#place-count').text('총 ' + data.length + '건');

                        let html = '';
                        data.forEach(function (place) {
                            html += '' +
                                '<div class="card" onclick="location.href=\'/view?contentId=' + place.contentid + '\'">' +
                                '  <div class="card-image" style="background-image: url(\'' + (place.firstimage || '/image/sample4.jpg') + '\')">' +
                                '    <div class="overlay">상세 정보 보기</div>' +
                                '  </div>' +
                                '  <div class="label">' + (place.title || '이름 없음') + '</div>' +
                                '</div>';
                        });

                        $('.accom-grid').html(html);
                    },
                    error: function (err) {
                        alert('숙소 데이터를 불러오는 데 실패했습니다.');
                        console.log("Ajax 에러 발생", err);
                    }
                });
            }

            // 버튼 클릭 시 이벤트 연결
            $('.region-tag').click(function () {
                const selectedRegion = $(this).text().replace('#', '');
                loadRegionData(selectedRegion);
            });

            // 페이지 로딩 시 '서울' 자동 로드
            loadRegionData('서울');
        });
    </script>
</head>

<body>

<!-- 🔹 헤더 -->
<header class="main-header">
    <a href="/" class="logo">🚗 여행가자</a>
    <nav class="nav-menu">
        <a href="#">전체</a>
        <a href="#">지역</a>
        <a href="#">미정</a>
    </nav>
</header>

<!-- 🔹 지역 태그 선택 영역 -->
<div class="region-tag-wrapper">
    <p class="region-title">지역 선택</p>
    <div class="region-tags">
        <button class="region-tag">#서울</button>
        <button class="region-tag">#인천</button>
        <button class="region-tag">#대전</button>
        <button class="region-tag">#대구</button>
        <button class="region-tag">#광주</button>
        <button class="region-tag">#부산</button>
        <button class="region-tag">#울산</button>
        <button class="region-tag">#세종</button>
        <button class="region-tag">#경기</button>
        <button class="region-tag">#강원</button>
        <button class="region-tag">#충북</button>
        <button class="region-tag">#충남</button>
        <button class="region-tag">#전북</button>
        <button class="region-tag">#전남</button>
        <button class="region-tag">#경북</button>
        <button class="region-tag">#경남</button>
        <button class="region-tag">#제주</button>
    </div>
</div>

<!-- 🔹 숙소 리스트 -->
<div class="accom-container">

    <div class="section-wrapper">
        <div class="section-header">
            <h2 class="section-title">숙소 목록</h2>
            <div class="section-count" id="place-count"></div>
        </div>
        <hr class="section-divider">
    </div>

    <div class="accom-grid"></div>

    <!-- 🔹 페이징 -->
    <div class="pagination">
        <a href="#"> &lt; </a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#"> &gt; </a>
    </div>
</div>

<!-- 🔹 푸터 -->
<footer>
    © 2025 여행 플랫폼 프로젝트 팀
</footer>

</body>
</html>