<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${place.placeName} 상세정보</title>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e36935031673a834fba88fed46cd2d"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                var lat = ${place.lat};
                var lng = ${place.lng};

                var $mapContainer = $('#map');

                var map = new kakao.maps.Map($mapContainer[0], {
                    center: new kakao.maps.LatLng(lat, lng),
                    level: 3
                });

                var marker = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(lat, lng)
                });
            });
        });

    </script>

    <title>${place.placeName} 상세정보</title>

</head>
<body>
<h2>${place.placeName}</h2>
<p>주소: ${place.addressName}</p>
<p>위도: ${place.lat}</p>
<p>경도: ${place.lng}</p>
<p><a href="/places/json?placeName=${place.placeName}">json</a></p>

<div id="map" style="width:500px;height:400px;"></div>

</body>
</html>
