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
        
        // function handleCategoriesBtn() {
		// 	const selectedCate = [];
		// 	const checkboxes = document.querySelectorAll('.category-chkbox:checked');

		// 	console.log('선택된체크박스:'  + checkboxes.length);

		// 	checkboxes.forEach(items => {
		// 		selectedCate.push(items.value);
		// 	});

			// console.log(selectedCate); //디버깅
			// document.getElementById("categoryForm").submit();
			
			// location.href = "/subMain?categoriesId=" + selectedCate.join(","); 
        // }
    </script>    
</body>
</html>