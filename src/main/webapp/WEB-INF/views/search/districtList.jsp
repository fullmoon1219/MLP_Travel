<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="org.example.travel.dto.PageListDTO" %>
<%@ page import="org.example.travel.vo.TravelVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../util/header.jsp"%>

<%
    PageListDTO listTO = (PageListDTO) request.getAttribute( "listto" );

    int cpage = listTO.getCpage();
    int totalRecord = listTO.getTotalRecord();
    int totalPage = listTO.getTotalPage();

    int pagePerBlock = listTO.getPagePerBlock();
    int startBlock = listTO.getStartBlock();
    int endBlock = listTO.getEndBlock();

    ArrayList<TravelVO> lists = listTO.getTravelLists();

    StringBuilder sbHtml = new StringBuilder();
    sbHtml.append("<div class='card-container'>");
    for (TravelVO to : lists) {
        int no = to.getNo();
        String title = to.getTitle();

        sbHtml.append("<div class='card'>");
        sbHtml.append("<a href='./view.do?cpage=" + cpage + "&no=" + no + "'>");
        sbHtml.append("<img src='/images/17468cfd-15d6-4c16-8186-55d7508c48a3.jpg' alt='이미지' />");
        sbHtml.append("<div class='card-title'>" + title + "</div>");
        sbHtml.append("</a>");
        sbHtml.append("</div>");
    }
    sbHtml.append("</div>");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>여행가자 - 지역별 목록보기</title>

    <style>

        /* 페이징 디자인 */
        .paginate_regular div {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        /*타이틀 <h1> 지역별 목록보기 디자인*/
        .title h1 {

        }

        /*타이틀 전체박스 디자인*/
        .title {
            position: sticky;
            top: 100px; /* 화면 최상단에 고정 */
            z-index: 10;
            width: 100%;
            height: 220px;
            background-color: skyblue;
            padding-top: 40px;
            text-align: center;
            margin-bottom: 40px; /* 위쪽 margin은 제거 (sticky에 영향 줌) */
            font-size: 30px;
            color: #333;
        }

        .card-container {
            padding: 200px 90px 90px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            padding: 160px 90px 90px;
            z-index: 300;
        }

        .card {
            border: none;
            padding: 30px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
            background-color: white;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 170px;
            object-fit: cover;
            border-radius: 3px;
        }

        .card-title {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-top: 10px;
        }

        .ui-button {
            margin-top: 10px;
        }

        .ui-button button {
            margin: 5px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 25px;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 127, 255, 0.3);
            transition: all 0.3s ease;
        }

        .ui-button button:hover {
            background: linear-gradient(135deg, #00f2fe 0%, #4facfe 100%);
            box-shadow: 0 6px 12px rgba(0, 127, 255, 0.5);
            transform: translateY(-3px);
        }

        .ui-button button:active {
            transform: translateY(0);
            box-shadow: 0 3px 6px rgba(0, 127, 255, 0.2);
        }




    </style>
</head>

<body>

<div class="title">

    지역별 목록보기

    <div class="ui-button">
        <button onclick="location.href='./DistrictList?cpage=1&district=서울'">#서울</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=인천'">#인천</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=대전'">#대전</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=대구'">#대구</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=경주'">#경주</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=부산'">#부산</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=울산'">#울산</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=세종'">#세종</button>
        <br />
        <button onclick="location.href='./DistrictList?cpage=1&district=경기'">#경기</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=강원'">#강원</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=충북'">#충북</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=충남'">#충남</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=전북'">#전북</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=전남'">#전남</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=경북'">#경북</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=경남'">#경남</button>
        <button onclick="location.href='./DistrictList?cpage=1&district=제주'">#제주</button>
    </div>

</div>

<%= sbHtml.toString() %>


<div class="paginate_regular">
    <div align="absmiddle">

        <%
            String district = request.getParameter("district");
            if ( startBlock == 1 ) {
                out.println( "<span><a>&lt;&lt;</a></span>" );
            } else {
                out.println( "<span><a href='DistrictList?cpage=" + (startBlock - pagePerBlock) + "'>&lt;&lt;</a></span>" );
            }

            out.println( "&nbsp;" );

            if( cpage == 1 ) {
                out.println( "<span><a>&lt;</a></span>" );
            } else {
                out.println( "<span><a href='DistrictList?cpage=" + ( cpage - 1 )+ "'>&lt;</a></span>" );
            }

            out.println( "&nbsp;&nbsp;" );

            for ( int i=startBlock ; i<=endBlock ; i++ ) {
                if ( i == cpage ) {
                    out.println( "<span><a>[ " + i + " ]</a></span>" );
                } else {
                    out.println( "<span><a href='DistrictList?cpage=" + i + "&district=" + district + "'>" + i + "</a></span>" );
                }
            }

            out.println( "&nbsp;&nbsp;" );

            if( cpage == totalPage ) {
                out.println( "<span><a>&gt;</a></span>" );
            } else {
                out.println( "<span><a href='DistrictList?cpage=" + ( cpage + 1 )+ "'>&gt;</a></span>" );
            }

            out.println( "&nbsp;" );

            if( endBlock == totalPage ) {
                out.println( "<span><a>&gt;&gt;</a></span>" );
            } else {
                out.println( "<span><a href='DistrictList?cpage=" + ( startBlock + pagePerBlock ) + "'>&gt;&gt;</a></span>" );
            }
        %>
    </div>
</div>
</body>
</html>