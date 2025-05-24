<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.example.travel.dto.district.DistrictItemDTO" %>
<%@ include file="../util/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title> 여행가자 - 전체 목록보기 </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_district.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>

<body>
<%
    int totalCount = (Integer) request.getAttribute("totalCount");
%>
<div class="container">
    <div class="title">
        <div class="district-header">
            <h2>전체 목록</h2>
            <span class="district-count">총 <%= totalCount %>건</span>
        </div>
        <hr class="district-divider">

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
                    <%
                        String image = item.getFirstimage();
                        if (image == null || image.isBlank()) {
                            image = request.getContextPath() + "/images/no_image.jpg";
                        }
                    %>
                    <img src='<%= image %>' alt='이미지'/>
                    <div class='card-title'><%= item.getTitle() %>
                    </div>
                </a>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <div class="paginate_regular">
        <%
            int totalPage = (Integer) request.getAttribute("totalPage");
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

            for (int j = startPage; j <= endPage; j++) {
                if (j == currentPage) {
                    out.println("<span><strong>" + j + "</strong></span>");
                } else {
                    out.println("<span><a href='./list?page=" + j + "'>" + j + "</a></span>");
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
