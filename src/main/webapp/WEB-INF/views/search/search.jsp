<%@ page import="org.example.travel.dto.search.SearchItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.travel.dto.district.DistrictItemDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/util/header.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 검색 결과</title>
    <link rel="stylesheet" href="/css/style_search.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
<div class="header-spacer"></div>
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

    int totalCount = (Integer) request.getAttribute("totalCount");
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
            if (lists == null || lists.isEmpty()) {
        %>
        <div class="no-result">
            검색 결과가 없습니다.
        </div>
        <%
        } else {
            for (SearchItemDTO item : lists) {
        %>
        <div class="result-item">
            <div class="result-card">
                <%
                    String image = item.getFirstimage();
                    if (image == null || image.isBlank()) {
                        image = request.getContextPath() + "/images/no_image.jpg";
                    }
                %>
                <img src="<%= image %>" alt="이미지"/>
                <div class="card-overlay">상세 정보 보기</div>
            </div>
            <div class="card-title"><%= item.getTitle() %></div>
        </div>
        <%
                }
            }
        %>

    </div>


    <div class="paginate_regular">
        <%
            int totalPage = (Integer) request.getAttribute("totalPage");
            int currentPage = (Integer) request.getAttribute("page");

            int startPage = Math.max(1, currentPage - 2);
            int endPage = Math.min(totalPage, currentPage + 2);

            int blockSize = 5;

            if (currentPage > 1) {
                out.println("<span><a href='./search?page=1&keyword=" + keyword + "'>&lt;&lt;</a></span>");

                int prev = Math.max(1, currentPage - blockSize);
                out.println("<span><a href='./search?page=" + prev + "&keyword=" + keyword + "'>&lt;</a></span>");
            } else {
                out.println("<span><a href='#'>&lt;&lt;</a></span>");
                out.println("<span><a href='#'>&lt;</a></span>");
            }

            for (int i = startPage; i <= endPage; i++) {
                if (i == currentPage) {
                    out.println("<span><strong>" + i + "</strong></span>");
                } else {
                    out.println("<span><a href='./search?page=" + i + "&keyword=" + keyword +  "'>" + i + "</a></span>");
                }
            }

            if (currentPage < totalPage) {
                int next = Math.min(totalPage, currentPage + blockSize);
                out.println("<span><a href='./search?page=" + next + "&keyword=" + keyword +  "'>&gt;</a></span>");

                out.println("<span><a href='./search?page=" + totalPage + "&keyword=" + keyword +  "'>&gt;&gt;</a></span>");
            } else {
                out.println("<span><a href='#'>&gt;</a></span>");
                out.println("<span><a href='#'>&gt;&gt;</a></span>");
            }
        %>
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