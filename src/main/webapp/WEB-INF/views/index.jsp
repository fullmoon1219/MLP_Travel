<%@ page import="org.example.travel.dto.district.DistrictItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="util/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>여행GO</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_main.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnSearch').on('click', function () {
                const keyword = $('#keyword').val().trim();

                if(keyword === '') {
                    alert("검색어를 입력하세요.");
                    $('#keyword').focus();
                    return;
                }

                $('#main-search-form').attr('action', '/search').submit();
            });
        });
    </script>
</head>
<body>

<div class="background-slider section" id="slider">

    <section class="search-intro">
        <h2>
            <img src="${pageContext.request.contextPath}/images/background/free-icon-car-7524132.png" alt="여행 아이콘"
                 style="width: 110px; vertical-align: middle; margin-right: 10px;">
            여행 가자!
        </h2>
        <p>원하는 여행지를 검색해주세요</p>
    </section>

    <form class="search-form" method="get" id="main-search-form">
        <div>
            <label for="keyword">검색어:</label>
            <input type="text" id="keyword" name="keyword" placeholder="여행지 이름 또는 키워드 검색"/>
            <button type="button" id="btnSearch">GO!</button>
        </div>
    </form>

    <div class="scroll-hint" onclick="scrollToRecommend()">
        <span>↓</span>
        <p>추천 관광지 보기</p>
    </div>
</div>
<%
    @SuppressWarnings("unchecked")
    List<DistrictItemDTO> lists = (List<DistrictItemDTO>) request.getAttribute("allLists");
%>
<section class="recommend-section section">
    <h3>추천 관광지</h3>
    <div class="spots-container">
        <%
            for (DistrictItemDTO item : lists) {
        %>
        <div class="spot">
            <a href="./view?page=1&contentId=<%= item.getContentid() %>" class="spot-link">
                <img src="<%= item.getFirstimage() %>" alt="<%= item.getTitle() %>">
                <div class="overlay-text">상세 내용 보기</div>
            </a>
            <p><%= item.getTitle() %>
            </p>
        </div>
        <%
            }
        %>
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
        document.querySelector('.recommend-section').scrollIntoView({behavior: 'smooth'});
    }

    updateBackground();
</script>

</body>
</html>
