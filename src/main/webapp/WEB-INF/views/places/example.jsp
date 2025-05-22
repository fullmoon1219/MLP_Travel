<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.travel.dto.tourist.TouristItemDTO" %>

<html>
<head>
    <title>주변 관광지 리스트</title>
</head>
<body>
<h2>주변 관광지 리스트</h2>

<%
    List<TouristItemDTO> touristList = (List<TouristItemDTO>) request.getAttribute("tourists");
    if (touristList != null && !touristList.isEmpty()) {
        for (TouristItemDTO item : touristList) {
%>
<div style="margin-bottom: 20px; border-bottom: 1px solid #ccc; padding-bottom: 10px;">
    <strong>관광지명: <%= item.getRlteTatsNm() %></strong><br/>
    주소: <%= item.getRlteBsicAdres() %><br/>
    분류: <%= item.getRlteCtgryLclsNm() %> > <%= item.getRlteCtgryMclsNm() %> > <%= item.getRlteCtgrySclsNm() %><br/>
    지역: <%= item.getAreaNm() %> <%= item.getSignguNm() %><br/>
    기준연월: <%= item.getBaseYm() %><br/>
    순위: <%= item.getRlteRank() %>
</div>
<%
    }
} else {
%>
<p>조회된 관광지 정보가 없습니다.</p>
<%
    }
%>

</body>
</html>
