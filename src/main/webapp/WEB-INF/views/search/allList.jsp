<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="org.example.travel.vo.TravelVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.travel.dto.PageListDTO" %>
<%@ include file="../util/header.jsp"%>
<%
    PageListDTO listTO = (PageListDTO) request.getAttribute( "listDTO" );

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

    <title>여행가자 - 전체 목록보기</title>
    <script type="text/javascript">
        window.onload = function () {
            let cards = document.getElementsByClassName('card');
            for (let i = 0; i < cards.length; i++) {
                cards[i].onclick = function () {
                    alert("aa"+i+1);
                };
            }
        };
    </script>
    <style>

        .title {
            text-align: center;
            padding-top: 120px; /* 네비바 높이 + 여유 공간 */
        }

        .title h1 {
            font-size: 28px;
            color: #333;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            padding: 0 90px 90px;
        }

        .card {
            border: none;
            padding: 10px;
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
    </style>
</head>

<body>


<div class="title">

    <h1> 전체 목록보기 </h1><br/>

        <%= sbHtml.toString() %>
    <div class="paginate_regular">
        <div align="absmiddle">
            <%
                if ( startBlock == 1 ) {
                    out.println( "<span><a>&lt;&lt;</a></span>" );
                } else {
                    out.println( "<span><a href='AllList?cpage=" + (startBlock - pagePerBlock) + "'>&lt;&lt;</a></span>" );
                }

                out.println( "&nbsp;" );

                if( cpage == 1 ) {
                    out.println( "<span><a>&lt;</a></span>" );
                } else {
                    out.println( "<span><a href='AllList?cpage=" + ( cpage - 1 )+ "'>&lt;</a></span>" );
                }

                out.println( "&nbsp;&nbsp;" );

                for ( int i=startBlock ; i<=endBlock ; i++ ) {
                    if ( i == cpage ) {
                        out.println( "<span><a>[ " + i + " ]</a></span>" );
                    } else {
                        out.println( "<span><a href='AllList?cpage=" + i + "'>" + i + "</a></span>" );
                    }
                }

                out.println( "&nbsp;&nbsp;" );

                if( cpage == totalPage ) {
                    out.println( "<span><a>&gt;</a></span>" );
                } else {
                    out.println( "<span><a href='AllList?cpage=" + ( cpage + 1 )+ "'>&gt;</a></span>" );
                }

                out.println( "&nbsp;" );

                if( endBlock == totalPage ) {
                    out.println( "<span><a>&gt;&gt;</a></span>" );
                } else {
                    out.println( "<span><a href='AllList?cpage=" + ( startBlock + pagePerBlock ) + "'>&gt;&gt;</a></span>" );
                }
            %>
        </div>
    </div>
</body>
</html>