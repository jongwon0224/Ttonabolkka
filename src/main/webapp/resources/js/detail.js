//우측 상단 category << 정민님 작업 카테고리 

	const menuButton = document.querySelector(".category");
	const categoryMenu = document.querySelector(".category-menu");
	
	// 메뉴 열기/닫기
	menuButton.addEventListener("click", function (event) {
	    event.stopPropagation(); // 이벤트 버블링 방지 (메뉴 클릭 시 창이 바로 닫히는 문제 해결)
	    
	    if (categoryMenu.style.display === "none" || categoryMenu.style.display === "") {
	        categoryMenu.style.display = "flex"; // 보이게 설정
	    } else {
	        categoryMenu.style.display = "none"; // 숨김 처리
	    }
	});
	
	// 메뉴 바깥을 클릭하면 닫기
	window.addEventListener("click", function (event) {
	    if (!categoryMenu.contains(event.target) && !menuButton.contains(event.target)) {
	        categoryMenu.style.display = "none"; // 메뉴 닫기
	    }
	});


		//Detail js 시작 의선
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
    "/image/bulguksaSub1.jpg",
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


						//중앙 사진 더보기 버튼 js 
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
