
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <title>요양원 상세정보</title>
</head>
<body>

    <p>${scc_info.SCCNAME}( ${scc_info.SCCGRADE} )</p><button><a href="${scc_info.DETAILINFO}" target="_blank">상세정보</a></button>

    <p>${scc_info.SCCADDRESS}</p>

    <p>${scc_info.SCCPHONE}</p>

    <table border="1">
        <tr>
            <th align="center" width="50">정원</th>
            <th align="center" width="50">현원</th>
            <th align="center" width="50">잔여</th>
            <th align="center" width="50">대기</th>
        </tr>
        <tr>
            <td align="center">${scc_info.TOTALNUM}</td>
            <td align="center">${scc_info.STATENUM}</td>
            <td align="center">${scc_info.REMAINEDNUM}</td>
            <td align="center">${scc_info.WAITINGNUM}</td>
        </tr>
    </table>
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b95f1234d6172ccdaf39ef8aadd00e66&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('${scc_info.SCCADDRESS}', function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            /*
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
            });
            infowindow.open(map, marker);

             */

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>


</body>
</html>