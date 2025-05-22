<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.travel.dto.district.DistrictItemDTO" %>

<html>
<head>
    <title>지역 관광지 리스트</title>
</head>
<body>
<h2>지역별 관광지 리스트</h2>

<%
    List<DistrictItemDTO> districtList = (List<DistrictItemDTO>) request.getAttribute("districts");
    if (districtList != null && !districtList.isEmpty()) {
        for (DistrictItemDTO item : districtList) {
%>
<div style="margin-bottom: 20px; border-bottom: 1px solid #ccc; padding-bottom: 10px;">
    <strong>관광지명: <%= item.getTitle() %></strong><br/>
    주소: <%= item.getAddr1() %> <%= item.getAddr2() != null ? item.getAddr2() : "" %><br/>
    지역코드: <%= item.getAreacode() %> / 시군구코드: <%= item.getSigungucode() %><br/>
    분류: <%= item.getCat1() %> > <%= item.getCat2() %> > <%= item.getCat3() %><br/>
    콘텐츠ID: <%= item.getContentid() %> / 타입ID: <%= item.getContenttypeid() %><br/>
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
