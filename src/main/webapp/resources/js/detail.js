////우측 상단 category << 정민님 작업 카테고리 
//
//const menuButton = document.querySelector(".category");
//const categoryMenu = document.querySelector(".category-menu");
//
//// 메뉴 열기/닫기
//menuButton.addEventListener("click", function(event) {
//	event.stopPropagation(); // 이벤트 버블링 방지 (메뉴 클릭 시 창이 바로 닫히는 문제 해결)
//
//	if (categoryMenu.style.display === "none" || categoryMenu.style.display === "") {
//		categoryMenu.style.display = "flex"; // 보이게 설정
//	} else {
//		categoryMenu.style.display = "none"; // 숨김 처리
//	}
//});
//
//// 메뉴 바깥을 클릭하면 닫기
//window.addEventListener("click", function(event) {
//	if (!categoryMenu.contains(event.target) && !menuButton.contains(event.target)) {
//		categoryMenu.style.display = "none"; // 메뉴 닫기
//	}
//});


//Detail js 시작 의선

// 더보기 모달창 // 

// 현재 이미지 인덱스 변수
let currentIndex = 0;

// 메인 이미지와 서브 이미지 클릭 시 모달 열기 및 해당 이미지 표시
document.querySelectorAll('.main-photo, .small-photos img').forEach((img, index) => {
    img.addEventListener('click', () => {
        currentIndex = index;  // 클릭한 이미지의 인덱스 저장
        openModal(currentIndex);
    });
});

// 모달 열기 함수 (선택적 인자로 인덱스를 받을 수 있음)
function openModal(index) {
    if (typeof index !== "undefined") {
        currentIndex = index;
    } else {
        currentIndex = 0;
    }
    const modal = document.getElementById("photoModal");
    modal.style.display = "block";
    document.body.style.overflow = "hidden"; // 배경 스크롤 방지
    
    // 모달이 처음 열릴 때는 그냥 현재 이미지로 세팅
    const modalImage = document.getElementById("modalImage");
    modalImage.src = photos[currentIndex];
    modalImage.style.transform = "translateX(0)";
    modalImage.style.opacity = "1";
}

// 모달 닫기 함수
function closeModal() {
    const modal = document.getElementById("photoModal");
    modal.style.display = "none";
    document.body.style.overflow = "auto"; // 배경 스크롤 복원
}

// 슬라이드 애니메이션을 적용해 이미지 전환
function slideToPhoto(direction) {
    const slider = document.querySelector('.slider');
    const currentImg = document.getElementById("modalImage");

    // 새 이미지 엘리먼트를 생성하여 슬라이더에 추가
    const newImg = document.createElement('img');
    newImg.src = photos[currentIndex];
    newImg.alt = "슬라이드 이미지";
	
    // 초기 위치: 오른쪽에서 왼쪽으로 슬라이드할 때는 오른쪽에 배치, 반대면 왼쪽에 배치
    newImg.style.transform = direction > 0 ? "translateX(100%)" : "translateX(-100%)";
    newImg.style.opacity = "0";

    
    // 새 이미지 삽입
    slider.appendChild(newImg);
    
    // 강제 리플로우 (transition을 보장)
    newImg.offsetWidth;
    
    // 슬라이드 애니메이션 시작
    newImg.style.transform = "translateX(0)";
    newImg.style.opacity = "1";
    
    // 동시에 기존 이미지는 반대 방향으로 슬라이드하면서 사라지게 함
    currentImg.style.transform = direction > 0 ? "translateX(-100%)" : "translateX(100%)";
    currentImg.style.opacity = "0";
    
    // 애니메이션이 끝난 후 (0.5초 후) 기존 이미지를 제거하고 새 이미지의 id를 "modalImage"로 변경
    setTimeout(() => {
        slider.removeChild(currentImg);
        newImg.id = "modalImage";
    }, 300);
}

// 좌우 버튼을 통한 이미지 변경 함수
function changePhoto(direction) {
    // 업데이트할 인덱스 계산
    currentIndex = (currentIndex + direction + photos.length) % photos.length;
    // 부드러운 슬라이드 애니메이션 실행
    slideToPhoto(direction);
}

// 썸네일 클릭 시 해당 이미지로 슬라이드 전환
function setImage(index) {
    if (index === currentIndex) return; // 이미 선택된 이미지면 아무 작업도 하지 않음
    // 기존 currentIndex와 비교하여 슬라이드 방향 결정
    let direction = (index > currentIndex) ? 1 : -1;
    currentIndex = index;
    slideToPhoto(direction);
}


// 중앙 "사진 더 보기" 버튼 관련 코드
document.addEventListener("DOMContentLoaded", function () {
    let showMoreBtn = document.getElementById("showMoreBtn");
    if (!showMoreBtn) {
        console.error("❌ 'showMoreBtn' 요소를 찾을 수 없음. HTML에 버튼이 있는지 확인!");
        return;
    }
    let images = document.querySelectorAll(".photo-list img");
    let isExpanded = false;
    // 처음엔 2번째 이미지부터 숨김 처리
    images.forEach((img, index) => {
        if (index >= 2) img.style.display = "none";
    });
    showMoreBtn.addEventListener("click", function () {
        if (isExpanded) {
            images.forEach((img, index) => {
                if (index >= 2) img.style.display = "none";
            });
            showMoreBtn.innerText = "사진 더 보기 ";
        } else {
            images.forEach((img, index) => {
                if (index >= 2) img.style.display = "block";
            });
            showMoreBtn.innerText = "사진 접기 ";
        }
        isExpanded = !isExpanded;
    });
});
