<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="org.example.travel.dto.district.DistrictItemDTO" %>
<%@ page import="java.util.List" %>
<%@ include file="../util/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_allList.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

    <title>여행가자 - 전체 목록보기</title>
</head>

<body>
<div class="title">

    <h1> 전체 목록보기 </h1><br/>

    <div class='card-container'>

        <%
            @SuppressWarnings("unchecked")
            List<DistrictItemDTO> lists = (List<DistrictItemDTO>) request.getAttribute("allLists");
            int currentPage = Integer.parseInt((String) request.getAttribute("page"));

            for (DistrictItemDTO item : lists) {
                String contentId = item.getContentid();

        %>
        <div class='card'>
            <a href='./view?page=<%= currentPage %>&contentId=<%= contentId %>'>
                <img src='<%= item.getFirstimage() %>' alt='이미지'/>
                <div class='card-title'><%= item.getTitle() %>
                </div>
            </a>
        </div>
        <%
            }
        %>
    </div>
    <div class="paginate_regular">
        <%
            int totalPage = 400;
            int startPage = Math.max(1, currentPage - 2);
            int endPage = Math.min(totalPage, currentPage + 2);

            int blockSize = 5;

            if (currentPage > 1) {
                out.println("<span><a href='./list?page=1'>&lt;&lt;</a></span>");

                int prev = Math.max(1, currentPage - blockSize);
                out.println("<span><a href='./list?page=" + prev + "'>&lt;</a></span>");
            } else {
                out.println("<span><a href='#'>&lt;&lt;</a></span>");
                out.println("<span><a href='#'>&lt;</a></span>");
            }

            for (int i = startPage; i <= endPage; i++) {
                if (i == currentPage) {
                    out.println("<span><strong>" + i + "</strong></span>");
                } else {
                    out.println("<span><a href='./list?page=" + i + "'>" + i + "</a></span>");
                }
            }

            if (currentPage < totalPage) {
                int next = Math.min(totalPage, currentPage + blockSize);
                out.println("<span><a href='./list?page=" + next + "'>&gt;</a></span>");

                out.println("<span><a href='./list?page=" + totalPage + "'>&gt;&gt;</a></span>");
            } else {
                out.println("<span><a href='#'>&gt;</a></span>");
                out.println("<span><a href='#'>&gt;&gt;</a></span>");
            }
        %>

    </div>
</div>
</body>
</html>