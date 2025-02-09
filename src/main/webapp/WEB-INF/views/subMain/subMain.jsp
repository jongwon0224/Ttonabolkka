<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>

<link href="/css/subMain.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">



<body>

	<div class="nav_bar">네브 바</div>

	<div class="main_container">

		<div class="left_aside">
			<div class="left_aside_map">지도</div>

			<div class="left_aside_filter">
				<h3>지역</h3>
				<br>
				<div>
					<form>
						<div class="left_aside_chkBox">
							<label><input type="checkbox" id="gyeongju"
								name="gyeongju"> 경주</label> <label><input
								type="checkbox" id="busan" name="busan"> 부산</label> <label><input
								type="checkbox" id="daegu" name="daegu"> 대구</label>
						</div>
						<div class="left_aside_chkBox">
							<label><input type="checkbox" id="seoul" name="seoul">
								서울</label> <label><input type="checkbox" id="incheon"
								name="incheon"> 인천</label> <label><input type="checkbox"
								id="suwon" name="suwon"> 수원</label>
						</div>
						<div class="left_aside_chkBox">
							<label><input type="checkbox" id="cheonan" name="cheonan">
								천안</label> <label><input type="checkbox" id="asan" name="asan">
								아산</label> <label><input type="checkbox" id="daecheon"
								name="daecheon"> 대천</label>
						</div>
						<button class="left_aside_btn">검색</button>
					</form>
				</div>
			</div>

			<div class="left_aside_filter">
				<h3>카테고리</h3>
				<br>
				<div>
					<form action="/subMain" method="post" >
						<div class="left_aside_chkBox">
							<c:forEach var="categories" items="${categoriesList}">
								<label>
									<input type="checkbox" name="categoriesId" value="${categories.id}">
									${categories.name}
								</label>
							</c:forEach>
						</div>                
						<button class="left_aside_btn" type="submit">검색</button>
					</form>
				</div>
			</div>
			

			<div class="left_aside_filter">
				<h3>평점</h3>
				<br>
				<div>
					<form>
						<div class="left_aside_chkBox">
							<label><input type="checkbox" id="rating_high"
								name="rating_high"> 평점 높은 순</label> <label><input
								type="checkbox" id="rating_low" name="rating_low"> 평점 낮은
								순</label>
						</div>
						<button class="left_aside_btn">검색</button>
					</form>
				</div>
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
			
				<nav>
					<ul class="pagination pagination-sm justify-content-center rounded-pill">
						<!-- 이전 페이지 -->
						<li class="page-item ${currentPage == 1 ? "disabled" : ""}">
							<a class="page-link rounded-pill" href="?page=${currentPage - 1}">이전</a>
						</li>
			
						<!-- 페이지 번호 -->
						<c:forEach var="item" begin="1" end="${totalPages}">
							<li class="page-item ${item == currentPage ? 'active' : ''}">
								<a class="page-link rounded-pill" href="?page=${item}">${item}</a>
							</li>
						</c:forEach>
			
						<!-- 다음 페이지 -->
						<li class="page-item ${currentPage == totalPages ? "disabled" : ""}">
							<a class="page-link rounded-pill" href="?page=${currentPage + 1}">다음</a>
						</li>
					</ul>
				</nav>
			</div>
	
		</div>

        
            
        
	</div>

	<!-- Bootstrap 5 JavaScript (Popper 포함) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


    <script>
        function toggleHeart(icon) {
            console.log('클릭완료 '+ icon.id);
            icon.classList.toggle("active");
        }
        
    </script>    
</body>
</html>