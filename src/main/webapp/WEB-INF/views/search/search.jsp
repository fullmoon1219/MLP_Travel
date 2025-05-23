<%@ page import="org.example.travel.dto.search.SearchItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.travel.dto.district.DistrictItemDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 검색 결과</title>
    <link rel="stylesheet" href="/css/style_search.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

<!-- ✅ HEADER -->
<header>
    <div class="logo">🚗 여행가자</div>
    <nav class="nav-menu">
        <button>전체</button>
        <button>지역</button>
        <button>미정</button>
    </nav>
</header>

<!-- ✅ 검색 영역 -->
<div class="search-combined">
    <form action="./search" method="get">
        <div class="search-wrapper">
            <label for="keyword">검색어:</label>
            <input type="text" id="keyword" name="keyword" placeholder="찾고 싶은 여행지를 검색하세요.">
            <button type="submit"><i class="fa fa-search"></i></button>
        </div>
    </form>
</div>
<%
    @SuppressWarnings("unchecked")
    List<SearchItemDTO> lists = (List<SearchItemDTO>) request.getAttribute("searchLists");

    String keyword = (String) request.getAttribute("keyword");
    String totalCount = (String) request.getAttribute("totalCount");
%>
<!-- ✅ 검색 결과 -->
<section class="result-area">
    <div class="result-header">
        <h2>'<%= keyword %>' 검색결과</h2>
        <span class="result-count">총 <%=totalCount%>건</span>
    </div>
    <hr class="result-divider">

    <div class="result-grid">

        <%
            for (SearchItemDTO item : lists) {
        %>
        <div class="result-item">
            <div class="result-card">
                <img src="<%= item.getFirstimage() %>" />
                <div class="card-overlay">상세 정보 보기</div>
            </div>
            <div class="card-title"><%= item.getTitle() %></div>
        </div>

        <%
            }
        %>
    </div>

    <div class="pagination">
        <span>&lt;</span>
        <span class="current">1</span>
        <span>2</span>
        <span>&gt;</span>
    </div>
</section>

<!-- ✅ 추천 관광지 -->
<section class="recommend-area">
    <h2>추천 관광지</h2>
    <div class="recommend-grid">

        <%
            @SuppressWarnings("unchecked")
            List<DistrictItemDTO> random = (List<DistrictItemDTO>) request.getAttribute("randomLists");

            for(DistrictItemDTO item : random) {

        %>
        <div class="recommend-item">
            <div class="recommend-card">
                <img src="<%=item.getFirstimage()%>">
                <div class="overlay">상세 정보 보기</div>
            </div>
            <div class="card-title"><%=item.getTitle()%></div>
        </div>

        <%
            }
        %>
    </div>
</section>

<!-- ✅ FOOTER -->
<footer>
    © 2025 여행 플랫폼 프로젝트 팀
</footer>

</body>