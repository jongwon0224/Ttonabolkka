<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>떠나볼까 여행페이지</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">



<link href="/css/subMain.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=480ae76903e53687e5cad91c46fb2808"></script>
</head>

<body>

	<div class="nav_bar">네브 바</div>

<div id="map" style="width:500px;height:400px;"></div>
	<div class="main_container">
<!-- 			<div class="left_aside_map" id="map"></div> -->
		<div class="left_aside">

			
			<input class="reset-btn" type="button" onclick="resetBtnAction()" value="처음으로">

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

	<!-- Bootstrap 5 JavaScript (Popper 포함) -->
	

	<script>
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
	console.log('맵성공');
    
	</script>

    <script src="/js/subMain.js"></script>
    
</body>
</html>