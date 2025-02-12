<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=480ae76903e53687e5cad91c46fb2808"></script>
</head>
<body>
	
	<div id="map" style="width:500px; height:400px;"></div>
	<div>ddd</div>
	<script type="text/javascript">
    window.onload = function() {
        kakao.maps.load(function() {
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };
            var map = new kakao.maps.Map(container, options);
            console.log('Map loaded successfully');  // 로그 확인용
        });
    };
</script>

</body>
</html>