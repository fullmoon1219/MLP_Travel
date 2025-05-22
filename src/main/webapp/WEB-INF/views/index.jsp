<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>여행GO</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_main.css">
</head>
<body>

<header class="navigation-bar">
    <h1>여행 가자</h1>
    <nav class="nav-menu">
        <a href="#">전체</a>
        <a href="#">지역별</a>
        <a href="#">오픈 API</a>
    </nav>
</header>

<div class="background-slider section" id="slider">
    <button class="slider-arrow left" id="prev">&#10094;</button>
    <button class="slider-arrow right" id="next">&#10095;</button>

    <section class="search-intro">
        <h2>
            <img src="${pageContext.request.contextPath}/images/background/free-icon-car-7524132.png" alt="여행 아이콘" style="width: 110px; vertical-align: middle; margin-right: 10px;">
            여행 가자!
        </h2>
        <p>원하는 여행지를 검색해주세요</p>
    </section>

    <form class="search-form">
        <div class="region-select-container">
            <select name="region">
                <option value="">지역 선택</option>
                <option>서울</option>
                <option>충청도</option>
                <option>전라도</option>
                <option>강원도</option>
                <option>제주도</option>
            </select>
        </div>
        <input type="text" name="keyword" placeholder="여행지 이름 또는 키워드 검색">
        <button type="submit">GO!</button>
    </form>

    <div class="scroll-hint" onclick="scrollToRecommend()">
        <span>↓</span>
        <p>추천 관광지 보기</p>
    </div>
</div>

<section class="recommend-section section">
    <h3>추천 관광지</h3>
    <div class="spots-container">
        <div class="spot">
            <a href="detail1.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend1.jpg" alt="하나개해수욕장">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>인천 하나개해수욕장</p>
        </div>
        <div class="spot">
            <a href="detail2.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend2.jpg" alt="통일공원">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>강릉 통일공원</p>
        </div>
        <div class="spot">
            <a href="detail3.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend3.jpg" alt="순천만국가공원">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>순천 순천만 국가공원</p>
        </div>
        <div class="spot">
            <a href="detail4.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend4.jpg" alt="민속촌">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>용인 한국 민속촌</p>
        </div>
        <div class="spot">
            <a href="detail5.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend5.jpg" alt="해수욕장관광지">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>속초 해수욕장관광지</p>
        </div>
        <div class="spot">
            <a href="detail6.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend6.jpg" alt="행주산성">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>고양 행주산성</p>
        </div>
        <div class="spot">
            <a href="detail7.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend7.jpg" alt="중앙탑사적공원">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>충주 중앙탑사적공원</p>
        </div>
        <div class="spot">
            <a href="detail8.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend8.jpg" alt="수협효시공원">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>거제 수협효시공원</p>
        </div>
        <div class="spot">
            <a href="detail9.html" class="spot-link">
                <img src="${pageContext.request.contextPath}/images/background/recommend9.jpg" alt="치유의숲">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p>제주 서귀포 치유의숲</p>
        </div>
    </div>
</section>

<script>
    const contextPath = '${pageContext.request.contextPath}';

    const images = [
        contextPath + '/images/background/sea3.jpg',
        contextPath + '/images/background/mountain.jpg',
        contextPath + '/images/background/flowers.jpg'
    ];

    let currentIndex = 0;
    const slider = document.getElementById('slider');

    function updateBackground() {
        slider.style.backgroundImage = `url('${images[currentIndex]}')`;
    }

    document.getElementById('prev').addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + images.length) % images.length;
        updateBackground();
    });

    document.getElementById('next').addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % images.length;
        updateBackground();
    });

    function scrollToRecommend() {
        document.querySelector('.recommend-section').scrollIntoView({ behavior: 'smooth' });
    }

    updateBackground();
</script>

</body>
</html>
