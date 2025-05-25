<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="org.example.travel.dto.district.DistrictItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
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
    List<DistrictItemDTO> lists = (List<DistrictItemDTO>) request.getAttribute("districts");

    int currentPage = Integer.parseInt((String) request.getAttribute("page"));
    int totalCount = (Integer) request.getAttribute("totalCount");


    @SuppressWarnings("unchecked")
    Map<String, String> areaCode = (Map<String, String>) request.getAttribute("region");
    String selectedCode = (String) request.getAttribute("areaCode");

    String selectedName = (selectedCode == null || selectedCode.isEmpty())
            ? "전체"
            : areaCode.getOrDefault(selectedCode, "전체");
%>

<div class="container">
    <div class="title">
        <div class="district-header">
            <h2>'<%=selectedName%>'지역별 관광지</h2>
            <span class="district-count">총 <%= totalCount %>건</span>
        </div>
        <hr class="district-divider">

        <div class="ui-button">
            <a href="./district?page=1"
                    <%= (selectedCode == null || selectedCode.isBlank()) ? "class='selected'" : "" %>>
                #전체
            </a>

            <%
                int i = 0;

                for (Map.Entry<String, String> entry : areaCode.entrySet()) {
                    if (i == 8) out.println("<br>");

                    String code = entry.getKey();
                    String name = entry.getValue();
                    String selectedClass = code.equals(selectedCode) ? " class='selected'" : "";

                    out.println("<a href='./district?page=1&areaCode=" + code + "'" + selectedClass + ">#" + name + "</a>");
                    i++;
                }
            %>
        </div>

        <div class='card-container'>
            <%
                for (DistrictItemDTO item : lists) {
                    String contentId = item.getContentid();
            %>

            <div class='card'>
                <a href="./view?page=<%=currentPage%>&contentId=<%=contentId%>">
                    <%
                        String image = item.getFirstimage();
                        if (image == null || image.isBlank()) {
                            image = request.getContextPath() + "/images/no_image.jpg";
                        }
                    %>

                    <img src="<%= image %>" alt="이미지"/>
                    <div class='card-title'><%=item.getTitle()%></div>
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
                int prev = Math.max(1, currentPage - blockSize);

                if (selectedCode == null || selectedCode.isEmpty()) {
                    out.println("<span><a href='./district?page=1'>&lt;&lt;</a></span>");
                    out.println("<span><a href='./district?page=" + prev + "'>&lt;</a></span>");
                } else {
                    out.println("<span><a href='./district?page=1&areaCode=" + selectedCode + "'>&lt;&lt;</a></span>");
                    out.println("<span><a href='./district?page=" + prev + "&areaCode=" + selectedCode + "'>&lt;</a></span>");
                }
            } else {
                out.println("<span><a href='#'>&lt;&lt;</a></span>");
                out.println("<span><a href='#'>&lt;</a></span>");
            }

            for (int j = startPage; j <= endPage; j++) {
                if (j == currentPage) {
                    out.println("<span><strong>" + j + "</strong></span>");
                } else {
                    if (selectedCode == null || selectedCode.isEmpty()) {
                        out.println("<span><a href='./district?page=" + j + "'>" + j + "</a></span>");
                    } else {
                        out.println("<span><a href='./district?page=" + j + "&areaCode=" + selectedCode + "'>" + j + "</a></span>");
                    }
                }
            }

            if (currentPage < totalPage) {
                int next = Math.min(totalPage, currentPage + blockSize);
                if (selectedCode == null || selectedCode.isEmpty()) {
                    out.println("<span><a href='./district?page=" + next + "'>&gt;</a></span>");
                    out.println("<span><a href='./district?page=" + totalPage + "'>&gt;&gt;</a></span>");
                } else {
                    out.println("<span><a href='./district?page=" + next + "&areaCode=" + selectedCode + "'>&gt;</a></span>");
                    out.println("<span><a href='./district?page=" + totalPage + "&areaCode=" + selectedCode + "'>&gt;&gt;</a></span>");
                }
            } else {
                out.println("<span><a href='#'>&gt;</a></span>");
                out.println("<span><a href='#'>&gt;&gt;</a></span>");
            }
        %>

    </div>
</div>


</body>
</html>