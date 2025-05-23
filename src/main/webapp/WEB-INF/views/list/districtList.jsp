<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="org.example.travel.vo.TravelVO" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_districtList.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">

</head>

<body>
<%
    @SuppressWarnings("unchecked")
    List<DistrictItemDTO> lists = (List<DistrictItemDTO>) request.getAttribute("districts");
    int currentPage = Integer.parseInt((String) request.getAttribute("page"));

    @SuppressWarnings("unchecked")
    Map<String, String> areaCode = (Map<String, String>) request.getAttribute("region");
%>

<div class="title">
    지역별 목록보기
    <div class="ui-button">
        <%
            int i = 0;

            for (Map.Entry<String, String> entry : areaCode.entrySet()) {
                if (i == 8) {
                    out.println("<br>");
                }
                out.println("<a href='./district?page=" + currentPage + "&areaCode=" + entry.getKey() + "'>#" + entry.getValue() + "</a>");
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
            <a href="./view?page=<%=currentPage%>&no=<%=contentId%>">
                <img src='<%=item.getFirstimage()%>' alt='이미지'/>
                <div class='card-title'><%=item.getTitle()%>
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
        int totalPage = 50;
        int startPage = Math.max(1, currentPage - 2);
        int endPage = Math.min(totalPage, currentPage + 2);

        int blockSize = 5;

        if (currentPage > 1) {
            out.println("<span><a href='./district?page=1'>&lt;&lt;</a></span>");

            int prev = Math.max(1, currentPage - blockSize);
            out.println("<span><a href='./district?page=" + prev + "'>&lt;</a></span>");
        } else {
            out.println("<span><a href='#'>&lt;&lt;</a></span>");
            out.println("<span><a href='#'>&lt;</a></span>");
        }

        for (int j = startPage; j <= endPage; j++) {
            if (j == currentPage) {
                out.println("<span><strong>" + j + "</strong></span>");
            } else {
                out.println("<span><a href='./district?page=" + j + "'>" + j + "</a></span>");
            }
        }

        if (currentPage < totalPage) {
            int next = Math.min(totalPage, currentPage + blockSize);
            out.println("<span><a href='./district?page=" + next + "'>&gt;</a></span>");

            out.println("<span><a href='./district?page=" + totalPage + "'>&gt;&gt;</a></span>");
        } else {
            out.println("<span><a href='#'>&gt;</a></span>");
            out.println("<span><a href='#'>&gt;&gt;</a></span>");
        }
    %>

</div>


</body>

</html>