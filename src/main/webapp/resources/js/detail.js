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
		
		let currentIndex = 0;  // 현재 이미지 인덱스

		//✨ 메인에 있는 사진 클릭 시 모달 열기
		document.querySelectorAll('.main-photo, .small-photos img').forEach((img, index) => {
		    img.addEventListener('click', () => {
		        currentIndex = index;  // 클릭한 사진의 인덱스를 기록
		        openModal();
		        document.getElementById("modalImage").src = photos[currentIndex];  // 해당 인덱스의 이미지를 모달에 표시
		    });
		});

		// mainImageUrl을 JSP에서 받아서 JavaScript로 전달
		   const mainImageUrl = "<c:url value='/resources${mainImageUrl}' />";
		   
		   // subImageUrls를 JSON 형식으로 전달하여 JavaScript에서 배열로 변환
		   const subImageUrls = JSON.parse('<c:out value="${subImageUrls}" />'); // 서버에서 받은 subImageUrls를 JSON 파싱

		   // photos 배열 생성: 첫 번째 사진은 mainImageUrl, 나머지는 subImageUrls
		   const photos = [mainImageUrl, ...subImageUrls.map(url => "<c:url value='/resources/" + url + "' />")];

		// 모달 열기 함수
		function openModal() {
		    const modal = document.getElementById("photoModal");
		    modal.style.display = "block";
		    document.body.style.overflow = "hidden"; // 배경 스크롤 방지
		    updateModalImage();  // 모달 이미지 업데이트
		}

		// 모달 닫기 함수
		function closeModal() {
		    const modal = document.getElementById("photoModal");
		    modal.style.display = "none";
		    document.body.style.overflow = "auto"; // 배경 스크롤 복원
		}

		// 이미지 업데이트 함수
		function updateModalImage() {
		    const modalImage = document.getElementById("modalImage");
		    modalImage.src = photos[currentIndex]; // 현재 인덱스에 해당하는 이미지로 변경
		}

		// 사진을 넘기는 함수 (좌우 버튼)
		function changePhoto(direction) {
		    currentIndex = (currentIndex + direction + photos.length) % photos.length; // 인덱스를 변경하고 순환하게 처리
		    updateModalImage();  // 이미지 업데이트
		}

		// '더보기' 버튼 클릭 시, 첫 번째 이미지로 모달 열기
		document.querySelectorAll('.main-photo, .small-photos img').forEach((img, index) => {
		    img.addEventListener('click', () => {
		        currentIndex = index;
		        openModal(); // 모달 열기
		    });
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