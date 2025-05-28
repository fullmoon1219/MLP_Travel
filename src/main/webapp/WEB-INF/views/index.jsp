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
                const valid = validateSearch();
                if (valid) {
                    $('#main-search-form').submit();
                }
            });
        });

        function validateSearch() {
            const $keyword = $('#keyword');
            const keyword = $keyword.val().trim();

            if (keyword === '') {
                alert("검색어를 입력하세요.");
                $keyword.focus();
                return false;
            }

            $('#main-search-form').attr('action', '/search');
            return true;
        }

    </script>
</head>
<body>

<div class="background-slider section" id="slider">
    <div class="search-wrapper-center">

        <section class="search-intro">
            <h2>
                <img src="/images/icon_car.png" alt="여행 아이콘"
                     style="width: 110px; vertical-align: middle; margin-right: 10px;">
                여행 가자!
            </h2>
            <p>원하는 여행지를 검색해주세요</p>
        </section>

        <form class="search-form" method="get" id="main-search-form" onsubmit="return validateSearch()">
            <div class="search-form-div">
                <label for="keyword">검색어:</label>
                <input type="text" id="keyword" name="keyword" placeholder="여행지 이름 또는 키워드 검색"/>
                <button type="button" id="btnSearch">GO!</button>
            </div>
        </form>
    </div>

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
                <div class="overlay"></div>
                <div class="overlay-text">관광지 상세 보기</div>
            </a>
            <p><%= item.getTitle() %>
            </p>
        </div>
        <%
            }
        %>
    </div>
    <!-- ✅ 푸터 -->
    <footer>
        © MLP 백엔드 과정 Team. Web IT Ting! (3팀)
    </footer>
</section>

<script>
    function scrollToRecommend() {
        const recommendSection = document.querySelector('.recommend-section');
        if (recommendSection) {
            recommendSection.scrollIntoView({ behavior: 'smooth' });
        }
    }
</script>
</body>
</html>