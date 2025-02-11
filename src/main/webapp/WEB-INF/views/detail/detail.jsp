<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>떠나볼까 - 불국사</title>
<style>
/* 기본 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

/* 네비게이션 바 */
.nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	background-color: #f8f8f8;
	border-bottom: 1px solid #ddd;
}

.nav h1.logo {
	margin: 0;
	font-size: 24px;
	color: #333;
}

.nav-r {
	display: flex;
	gap: 20px;
}

.nav-r span {
	cursor: pointer;
	font-size: 16px;
	color: #555;
}

.content {
	padding: 20px;
}

/* 🔹더보기 위 전체 사진 감싸는 컨테이너 */

/*첫 번째 큰 사진 */
.main-photo {
	object-fit: cover;
	border-radius: 8px;
	display: block;
}

/* 작은 사진 리스트를 <ul> 형태로 변경 */
.small-photos {
	display: grid;
	grid-template-columns: repeat(2, 1fr); /* 2열로 설정 */
	gap: 10px;
	list-style: none;
	padding: 0;
	margin: 0;
	width: 100%;
}

/* 작은 사진 li */
.small-photo {
	width: 100%;
	height: 200px; /* 메인 사진 height의 반 크기 설정 */
	padding-top: 56.25%; /* 16:9 비율을 유지하도록 설정 */
	border-radius: 8px;
	overflow: hidden;
	position: relative;
	height: 200px;
}

.small-photo img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

/* 작은 사진들에 grid-column 속성 추가 */
.small-photo:nth-child(n+2) {
	grid-column: span 1/span 1; /* 한 칸만 차지하도록 설정 */
}

/* 더보기 버튼을 불국사 작은 사진 4의 오른쪽 하단에 배치 */
.small-photos li:last-child {
	position: relative;
}
/* 모달 스타일 */
.modal {
	display: none; /* 모달은 기본적으로 숨겨놓기 */
	position: fixed;
	z-index: 1; /* 가장 위에 오도록 설정 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fff;
	margin: 5% auto;
	padding: 20px;
	border-radius: 8px;
	max-width: 80%;
	overflow-y: auto;
}

.modal-gallery {
	display: flex;
}

.modal-gallery img {
	width: 70%;
	height: 100%;
	border-radius: 8px;
	object-fit: cover;
	margin-left: 50%
}

/* 닫기 버튼 */
.close {
	color: #aaa;
	font-size: 30px;
	font-weight: bold;
	position: absolute;
	top: 10px;
	right: 20px;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.small-photos li:last-child .more-photos {
	position: absolute;
	bottom: 5px;
	right: 5px;
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 12px;
}

.more-photos {
	position: absolute;
	right: 5px;
	margin-right: 15px;
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 12px;
}

.more-photos a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}

/* 설명 텍스트 */
.description {
	font-size: 17px;
}

/* 🔹 상세 사진 리스트 */
.image-list {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
	margin-top: 30px;
}
/*중앙 사진 css*/
.image-list img {
	width: 80%;
	max-width: 500px;
	height: auto;
	display: block;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.photo-list {
	display: flex;
	flex-direction: column; /* 세로로 배치 */
	gap: 10px; /* 사진 간격 */
	align-items: center; /* 중앙 정렬 */
}

.photo-list img {
	width: 100%; /* 가로 폭 전체 차지 */
	max-width: 500px; /* 최대 크기 */
	height: auto;
	display: block; /* 한 줄에 하나씩 배치 */
}

#showMoreBtn {
	margin-top: 10px;
	padding: 8px 15px;
	cursor: pointer;
	background-color: #007BFF;
	color: white;
	border: none;
	border-radius: 5px;
}

#showMoreBtn:hover {
	background-color: #0056b3;
}

/* 🔹 평가 (댓글) 섹션 */
.community {
	margin-top: 40px;
	padding: 20px;
	background-color: #f8f8f8;
	border-top: 1px solid #ddd;
}

.comment-box {
	display: flex;
	flex-direction: column;
	gap: 10px;
	max-width: 500px;
	margin: 0 auto;
}

.comment-box textarea {
	width: 100%;
	height: 100px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	resize: none;
}

.comment-box button {
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.comment-box button:hover {
	background-color: #0056b3;
}

.comment-list {
	max-width: 500px;
	margin: 20px auto;
}

.comment-list div {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.modal {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: 1000;
}

/* 모달 내용 컨테이너 */
.modal-content {
	position: relative;
	width: 80%;
	height: 80vh;
	background: white;
	margin: 5vh auto;
	padding: 20px;
	border-radius: 8px;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* 갤러리 컨테이너 */
.modal-gallery {
	position: relative;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* 슬라이더 컨테이너 */
.slider {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
}

/* 이미지 스타일 */
.slider img {
	width: 800px; /* 고정 너비 설정 */
	height: 600px; /* 고정 높이 설정 */
	object-fit: cover; /* 이미지 비율 유지하면서 영역 채우기 */
	border-radius: 8px;
	transition: opacity 0.3s ease-in-out;
	display: block;
	margin: 0 auto;
}

/* 이전/다음 버튼 */
.prev, .next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background: rgba(0, 0, 0, 0.5);
	color: white;
	padding: 15px;
	cursor: pointer;
	border: none;
	border-radius: 50%;
	font-size: 24px;
	z-index: 2;
	transition: background-color 0.3s;
}

.prev {
	left: 20px;
}

.next {
	right: 20px;
}

.prev:hover, .next:hover {
	background: rgba(0, 0, 0, 0.8);
}

/* 닫기 버튼 */
.close {
	position: absolute;
	top: 10px;
	right: 20px;
	color: #333;
	font-size: 30px;
	font-weight: bold;
	cursor: pointer;
	z-index: 3;
}

.close:hover {
	color: #000;
}

/* ✨ 마우스오버 효과 추가 */
.main-photo, .small-photos img {
	transition: transform 0.3s ease, opacity 0.3s ease;
}

.main-photo:hover, .small-photos img:hover {
	transform: scale(1.02);
	opacity: 0.8;
	cursor: pointer;
}
</style>
</head>
<body>

	<!-- 네비게이션 바 -->
	<div class="nav">
		<h1 class="logo">떠나볼까</h1>
		<div class="nav-r">
			<span class="login_menus">로그인 / 회원가입</span> <span class="category">카테고리</span>
		</div>
	</div>




	<!-- 대표 사진 및 서브 사진 -->
	<div class="content">
		<article class="gallery-container">
			<div class="css-12lmpk7"
				style="display: flex; gap: 10px; height: 480px;">
				<!-- 메인 사진 -->
				<div class="big-photo" style="width: 930px; height: auto;">
					<img alt="대표사진" sizes="100vw" src="/image/bulguksaMain.jpg"
						class="main-photo"
						style="width: 100%; height: auto; border-radius: 15px">
				</div>

				<!-- 작은 사진들 (오른쪽 배치) -->
				<div class="small-photos"
					style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
					<img src="/image/bulguksaSub1.png" alt="서브사진1"
						style="width: 100%; height: 100%; object-fit: cover; border-radius: 15px">
					<img src="/image/bulguksaSub2.JPG" alt="서브사진2"
						style="width: 100%; height: 100%; object-fit: cover; border-radius: 15px">
					<img src="/image/bulguksaSub3.jpg" alt="서브사진3"
						style="width: 100%; height: 50%; object-fit: cover; border-radius: 15px">
					<img src="/image/bulguksaSub4.jpg" alt="서브사진4"
						style="width: 100%; height: 50%; object-fit: cover; border-radius: 15px">
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
				src="/image/bulguksaSub1.png" alt="불국사 2"> <img
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
	</div>

	<script>
	
	//✨ 메인에 있는 사진 클릭 시 모달 열기
	document.querySelectorAll('.main-photo, .small-photos img').forEach((img, index) => {
	    img.addEventListener('click', () => {
	        currentIndex = index;
	        openModal();
	        document.getElementById("modalImage").src = photos[currentIndex];
	    });
	});
	

		// 모달 열기 함수
function openModal() {
    const modal = document.getElementById("photoModal");
    modal.style.display = "block";
    document.body.style.overflow = "hidden"; // 배경 스크롤 방지
}

		// 모달 닫기 함수
function closeModal() {
    const modal = document.getElementById("photoModal");
    modal.style.display = "none";
    document.body.style.overflow = "auto"; // 배경 스크롤 복원
}
		
		//더보기 버튼 누르면 뜨는 사진 순서 
let currentIndex = 0;
const photos = [
    "/image/bulguksaMain.jpg",
    "/image/bulguksaSub1.png",
    "/image/bulguksaSub2.JPG",
    "/image/bulguksaSub3.jpg",
    "/image/bulguksaSub4.jpg"
];

function changePhoto(direction) {
    const modalImage = document.getElementById("modalImage");
    modalImage.style.opacity = "0"; // 페이드아웃

    setTimeout(() => {
        currentIndex = (currentIndex + direction + photos.length) % photos.length;
        modalImage.src = photos[currentIndex];
        modalImage.style.opacity = "1"; // 페이드인
    }, 300); // 애니메이션 시간 (0.3초)
}
document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
        closeModal();
    }
});


						//중앙 사진 더보기 js 
document.addEventListener("DOMContentLoaded", function () {
    let images = document.querySelectorAll(".photo-list img"); // 사진 리스트
    let showMoreBtn = document.getElementById("showMoreBtn"); // 버튼
    let isExpanded = false; // 상태 확인

    // 사진 3개까지만 표시
    images.forEach((img, index) => {
        if (index >= 3) img.style.display = "none";
    });

    // 버튼 클릭 시 더보기 기능
    showMoreBtn.addEventListener("click", function () {
        if (isExpanded) {
            // 다시 접기
            images.forEach((img, index) => {
                if (index >= 3) img.style.display = "none";
            });
            showMoreBtn.innerText = "사진 더 보기 🔽";
        } else {
            // 모든 사진 보이기
            images.forEach((img) => (img.style.display = "block"));
            showMoreBtn.innerText = "사진 접기 🔼";
        }
        isExpanded = !isExpanded; // 상태 변경
    });
});


// 제일 밑 댓글 추가 함수
function addComment() {
	let commentInput = document.getElementById("commentInput");
	let commentList = document.getElementById("commentList");

	if (commentInput.value.trim() !== "") {
		let newComment = document.createElement("div");
		newComment.textContent = commentInput.value;
		commentList.appendChild(newComment);
		commentInput.value = ""; // 입력 필드 초기화
	}
}
	</script>

</body>
</html>
