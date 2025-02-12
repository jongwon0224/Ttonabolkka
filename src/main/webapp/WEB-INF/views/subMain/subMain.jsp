<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>떠나볼까 여행페이지</title>
<!-- Bootstrap 5 CSS -->
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=480ae76903e53687e5cad91c46fb2808"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<link href="/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link href="/css/subMain.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

</head>

<body>

	<!-- nav -->
	<div class="nav">
			<h1 class="logo">떠나볼까</h1>
			<div class="nav-r">
				<span class="login_menus"> 로그인 / 회원가입 </span> <span class="category"><i
					class="fa-solid fa-bars"></i></span>
			</div>
			
			<!-- 카테고리 메뉴 -->
			<div class="category-menu">
				<div class="menu-list">
					<ul>
						<li><a href="">국내여행</a></li>
						<li><a href="">해외여행</a></li>
						<li><a href="">이벤트</a></li>
						<li><a href="">고객센터</a></li>
					</ul>
				</div>
			</div>
		</div>

	
	<div class="main_container">
<!-- 			<div class="left_aside_map" id="map"></div> -->
		<!-- 좌측 필터구간 -->
		<div class="left_aside">
			<div id="map" class="left_aside_map"></div>
			
			<input class="reset-btn" type="button" onclick="resetBtnAction()" value="필터 초기화">

			<div class="left_aside_filter">
				<form action="/subMain" method="GET">
					
					<div class="filter-container">
						<div class="filterCon-title">지역</div>
						<c:forEach var="areas" items="${areasList}">
						<div class="filter-item">
							<div class="filterBtn-container">
								<button class="filterBtn ${areas.id == param.areasId ? 'selected' : ''}"
								type="button" onclick="filterAction(this, ${areas.id}, 'areas')"></button>							
							</div>
							<div>${areas.name}</div>
						</div>
						</c:forEach>	
					</div>		
						
						
					<div class="filterCon-title">카테고리</div>
					<c:forEach var="categories" items="${categoriesList}">
					<div class="filter-item">
						<div class="filterBtn-container">
							<button class="filterBtn ${categories.id == param.categoriesId ? 'selected' : ''}"
							type="button" onclick="filterAction(this, ${categories.id}, 'categories')"></button>							
						</div>
						<div>${categories.name}</div>
					</div>
					</c:forEach>						

					<input type="hidden" id="currentPage" name="page" value="${currentPage}">
					<input type="hidden" id="pageSize" name="pageSize" value="5">
				</form>								
			</div>
		</div>
		
		
		<!-- 메인 places items -->
		<div class="places_container">
		
			<c:forEach var="places" items="${placesList}">
				<div class="places_box">
					<div class="places_img">
						<img src="${places.imageUrl}" alt="${places.name}이미지">
					</div>
                    <div class="places_txt">
                        <div>${places.name}</div><br>
                        <div>${places.description}</div>
                    </div>
                    <div>
                        <i class="fa-solid fa-heart heart-icon" id="${places.name}"
						onclick="toggleHeart(this)"></i>
                    </div>
				</div>
			</c:forEach>

			<!-- 하단 페이지네이션 구간 -->
			<div class="container mt-5">
			
			<c:set var="startPage" value="${currentPage-2 < 1 ? 1 : currentPage-2}"/>
			<c:set var="endPage" value="${startPage+2 > totalPages ? totalPages : startPage+2}"/>
						
				<nav>
					<ul class="pagination pagination-sm justify-content-center rounded-pill">
						<!-- 이전 페이지 -->
						<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
							<a class="page-link rounded-pill" href="?page=${currentPage - 1}&pageSize=5
							<c:if test='${not empty categories}'>
								&categoriesId=${categories}
							</c:if>">이전</a>					 	
						</li>
						<!-- 페이지 번호 -->						
						<c:forEach var="item" begin="${startPage}" end="${endPage}">
							<li class="page-item ${item == currentPage ? 'active' : ''}">
								<a class="page-link rounded-pill" href="?page=${item}&pageSize=5
								<c:if test='${not empty categories}'>
									&categoriesId=${categories}
								</c:if>">${item}</a>
							</li>
						</c:forEach>			
						<!-- 다음 페이지 -->
						<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
							<a class="page-link rounded-pill" href="?page=${currentPage + 1}&pageSize=5
							<c:if test='${not empty categories}'>
									&categoriesId=${categories}
							</c:if>">다음</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
		
		<!-- footer -->
		<div class="footer">
			<div class="footer-t"></div>
			<div class="footer-b">
				<div>
					<p>ⓒ 2025 떠나볼까 | 여행을 떠나고 싶은 모든 순간</p>
					<p>주소 : 충남 천안시 동남구 대흥로 215 7층 3교육실 | 대표이사 : 황종원 | 사업자등록번호 :
						123-45-67890</p>
					<p>전자우편주소 : help@ttonabolkka.com | 통신판매번호 : 2025-충남천안-01234 |
						관광사업자 등록번호 : 제0000-00호 | 전화번호 : 1234-5678 | 호스팅서비스제공자의 상호 표시 :
						(주)떠나볼까</p>
					<p>(주)떠나볼까는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한
						의무와 책임은 각 판매자에게 있습니다.</p>
				</div>
				<br /> <br />
				<div>
					<span> 이용약관 </span> <span> 개인정보 처리방침 </span> <span> 소비자 분챙해결
						기준 </span> <span> 콘텐츠산업진흥법에 의한 표시 </span>
				</div>
			</div>
		</div>

		<script>
var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
    SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
    markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
    overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
    overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
    spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

var positions = [  // 마커의 위치
        new kakao.maps.LatLng(33.44975, 126.56967),
        new kakao.maps.LatLng(33.450579, 126.56956),
        new kakao.maps.LatLng(33.4506468, 126.5707)
    ],
    selectedMarker = null; // 클릭한 마커를 담을 변수

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도 위에 마커를 표시합니다
for (var i = 0, len = positions.length; i < len; i++) {
    var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
        originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
        overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
        normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
        clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
        overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
        
    // 마커를 생성하고 지도위에 표시합니다
    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
}

// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
        overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
        clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
    
    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: position,
        image: normalImage
    });

    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
    marker.normalImage = normalImage;

    // 마커에 mouseover 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {

        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 오버 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(overImage);
        }
    });

    // 마커에 mouseout 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {

        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 기본 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(normalImage);
        }
    });

    // 마커에 click 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {

        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {

            // 클릭된 마커 객체가 null이 아니면
            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            marker.setImage(clickImage);
        }

        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker;
    });
}

// MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new kakao.maps.MarkerImage(
        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
        markerSize, // 마커의 크기
        {
            offset: offset, // 마커 이미지에서의 기준 좌표
            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
        }
    );
    
    return markerImage;
}
</script>
	
    <script src="/js/subMain.js"></script>
    <script src="/js/main.js"></script>
    
</body>
</html>