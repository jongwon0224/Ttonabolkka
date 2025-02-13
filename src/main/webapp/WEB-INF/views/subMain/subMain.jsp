<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>떠나볼까 여행페이지</title>
<!-- Bootstrap 5 CSS -->
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=480ae76903e53687e5cad91c46fb2808&libraries=services"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<link href="/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link href="/css/subMain.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
 <link rel="stylesheet" href="https://fonts.nununu.co.kr/gmarket-sans.css" />
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


	<div id="mapModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h4>지도</h4>
			<br>
			<div id="modalMap" class="map_wrap"></div>
		</div>
	</div>

		<!-- 좌측 필터구간 -->
		<div class="left_aside">
			<div id="map" class="left_aside_map">
				<button class="btn btn-primary" onclick="openModal()">지도 보기</button>
			</div>
			
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
                        <div style="font-size: 18px; font-weight: bold;">${places.name}</div><br>
                        <div style="font-size: 15px">${places.description}</div>
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

	<script src="/js/subMainMap.js"></script>
    <script src="/js/subMain.js"></script>
    <script src="/js/main.js"></script>
    
</body>
</html>