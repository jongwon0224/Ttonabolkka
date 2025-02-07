<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>떠나볼까 - 불국사</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/detail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
</style>
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





	<!-- 대표 사진 및 서브 사진 -->
	<div class="content">
		<article class="gallery-container">
			<div class="css-12lmpk7"
				style="display: flex; gap: 10px; height: 480px;">
				<!-- 메인 사진 -->
				<div class="big-photo" style="width: 100%; he">
					<img alt="대표사진" sizes="100vw" src="/image/bulguksaMain.jpg"
						class="main-photo"
						style="width: 100%; height: 97%; border-radius: 15px">
				</div>

				<!-- 작은 사진들 (오른쪽 배치) -->
				<div class="small-photos" style=>
					<img src="/image/bulguksaSub1.jpg" alt="서브사진1"
						style="width: 100%; height: 98%; object-fit: cover; border-radius: 15px">
					<img src="/image/bulguksaSub2.JPG" alt="서브사진2"
						style="width: 100%; height: 98%; object-fit: cover; border-radius: 15px">
					<img src="/image/bulguksaSub3.jpg" alt="서브사진3"
						style="width: 100%; height: 88%; object-fit: cover; border-radius: 15px">
					<img src="/image/bulguksaSub4.jpg" alt="서브사진4"
						style="width: 100%; height: 88%; object-fit: cover; border-radius: 15px">
				</div>
		</article>
	</div>



	<!-- 더보기 버튼 아래에 모달 구조 추가 -->
	<div id="photoModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<div class="modal-gallery">
				<button class="prev" onclick="changePhoto(-1)">&#10094;</button>
				<div class="slider">
					<img id="modalImage" src="/image/bulguksaMain.jpg" alt="불국사">
				</div>
				<button class="next" onclick="changePhoto(1)">&#10095;</button>
			</div>
		</div>
	</div>


	<!-- 더보기 버튼 수정 -->
	<div class="more-photos">
		<a href="javascript:void(0);" onclick="openModal()">더보기</a>
	</div>
	<!-- 불국사 소개 -->
	<h2>경주 불국사</h2>
	<div class="description">
		불국사는 경주에 위치한 유네스코 세계문화유산으로, 신라 시대의 불교 문화를 대표하는 사찰입니다. <br> 다보탑과
		석가탑 등 아름다운 석조 유적이 있으며, 한국의 전통 건축 미학을 느낄 수 있는 곳입니다.
	</div>

	<!-- 🔹 상세 이미지 리스트 -->
	<div class="image-list">
		<div class="photo-list">
			<img src="/image/bulguksaMain.jpg" alt="불국사 1"> <img
				src="/image/bulguksaSub1.jpg" alt="불국사 2"> <img
				src="/image/bulguksaSub2.JPG" alt="불국사 3"> <img
				src="/image/bulguksaSub3.jpg" alt="불국사 4"> <img
				src="/image/bulguksaSub4.jpg" alt="불국사 5">
		</div>
		<button id="showMoreBtn">사진 더 보기🔽</button>
	</div>

	<!-- 🔹 평가 (댓글) 섹션 -->
	<div class="community">
		<h3>불국사에 대한 평가</h3>
		<div class="comment-box">
			<textarea id="commentInput" placeholder="악플 금지"></textarea>
			<button onclick="addComment()">등록</button>
		</div>
		<div class="comment-list" id="commentList"></div>
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
				<p>(주)떠나볼까는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와
					책임은 각 판매자에게 있습니다.</p>
			</div>
			<br /> <br />
			<div>
				<span> 이용약관 </span> <span> 개인정보 처리방침 </span> <span> 소비자 분챙해결
					기준 </span> <span> 콘텐츠산업진흥법에 의한 표시 </span>
			</div>
		</div>
	</div>

	<script src="/js/detail.js"></script>


</body>
</html>
