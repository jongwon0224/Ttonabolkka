<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<form>
						<div class="left_aside_chkBox">
							<label><input type="checkbox" id="attraction"
								name="attraction"> 관광지</label> <label><input
								type="checkbox" id="themepark" name="themepark"> 테마파크</label> <label><input
								type="checkbox" id="hotplace" name="hotplace"> 핫플레이스</label>
						</div>
						<button class="left_aside_btn">검색</button>
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
						<img src="${places.description}" alt="${places.name}이미지">
					</div>
                    <div class="places_txt">
                        <div>${places.name}</div><br>
                        <div>해당란 설명내용입니다. places.description</div>
                    </div>
                    <div>
                        <i class="fa-solid fa-heart heart-icon" id="${places.name}"
						onclick="toggleHeart(this)"></i>
                    </div>

				</div>
			</c:forEach>

            <div class="move_page">
                <button type="button"><</button>
                <button type="button">1</button>
                <button type="button">2</button>
                <button type="button">3</button>
                <button type="button">4</button>
                <button type="button">5</button>
                <button type="button">></button>
            </div>

		</div>

        
            
        
	</div>

    <script>
        function toggleHeart(icon) {
            console.log('클릭완료 '+ icon.id);
            icon.classList.toggle("active");
        }
    </script>    
</body>
</html>