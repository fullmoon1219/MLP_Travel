<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.example.travel.dto.food.FoodItemDTO" %>
<%@ include file="../util/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title> 여행가자 - 지역별 목록보기 </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_district.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>

<body>
<%
    @SuppressWarnings("unchecked")
    List<FoodItemDTO> lists = (List<FoodItemDTO>) request.getAttribute("foods");

    int currentPage = Integer.parseInt((String) request.getAttribute("page"));
    int totalCount = (Integer) request.getAttribute("totalCount");

    @SuppressWarnings("unchecked")
    Map<String, String> areaCodeMap = (Map<String, String>) request.getAttribute("region");
    String selectedCode = (String) request.getAttribute("areaCode");

    String selectedName = (selectedCode == null || selectedCode.isEmpty())
            ? "전체"
            : areaCodeMap.getOrDefault(selectedCode, "전체");
%>

<div class="container">
    <div class="title">
        <div class="district-header">
            <h2>'<%= selectedName %>' 검색결과</h2>
            <span class="district-count">총 <%= totalCount %>건</span>
        </div>
        <hr class="district-divider">

        <div class="ui-button">
            <a href="./food?page=1"
                    <%= (selectedCode == null || selectedCode.isBlank()) ? "class='selected'" : "" %>>
                #전체
            </a>

            <%
                int i = 0;
                for (Map.Entry<String, String> entry : areaCodeMap.entrySet()) {
                    if (i == 8) out.println("<br>");

                    String code = entry.getKey();
                    String name = entry.getValue();
                    String selectedClass = code.equals(selectedCode) ? " class='selected'" : "";

                    out.println("<a href='./food?page=1&areaCode=" + code + "'" + selectedClass + ">#" + name + "</a>");
                    i++;
                }
            %>
        </div>


        <div class='card-container'>
            <%
                for (FoodItemDTO item : lists) {
                    String contentId = item.getContentid();
            %>
            <div class='card'>
                <a href="./view?page=<%= currentPage %>&contentId=<%= contentId %>">
                    <%
                        String image = item.getFirstimage();
                        if (image == null || image.isBlank()) {
                            image = request.getContextPath() + "/images/no_image.jpg";
                        }
                    %>
                    <img src="<%= image %>" alt="이미지"/>
                    <div class='card-title'><%= item.getTitle() %></div>
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
                out.println("<span><a href='./food?page=1&areaCode=" + selectedCode + "'>&lt;&lt;</a></span>");
                int prev = Math.max(1, currentPage - blockSize);
                out.println("<span><a href='./food?page=" + prev + "&areaCode=" + selectedCode + "'>&lt;</a></span>");
            } else {
                out.println("<span><a href='#'>&lt;&lt;</a></span>");
                out.println("<span><a href='#'>&lt;</a></span>");
            }

            for (int j = startPage; j <= endPage; j++) {
                if (j == currentPage) {
                    out.println("<span><strong>" + j + "</strong></span>");
                } else {
                    out.println("<span><a href='./food?page=" + j + "&areaCode=" + selectedCode + "'>" + j + "</a></span>");
                }
            }

            if (currentPage < totalPage) {
                int next = Math.min(totalPage, currentPage + blockSize);
                out.println("<span><a href='./food?page=" + next + "&areaCode=" + selectedCode + "'>&gt;</a></span>");
                out.println("<span><a href='./food?page=" + totalPage + "&areaCode=" + selectedCode + "'>&gt;&gt;</a></span>");
            } else {
                out.println("<span><a href='#'>&gt;</a></span>");
                out.println("<span><a href='#'>&gt;&gt;</a></span>");
            }
        %>
    </div>
</div>

</body>
</html>
