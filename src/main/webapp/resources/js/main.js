//우측 상단 category

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

	
//메인 슬라이드
	const nextButtons = document.querySelectorAll(".fa-greater-than"); // 모든 `>` 버튼
	const prevButtons = document.querySelectorAll(".fa-less-than"); // 모든 `<` 버튼
	const slides = document.querySelectorAll(".slide"); // 모든 슬라이드 컨테이너
	
	const cardWidth = 110; // 카드 너비 + margin-right
	const visibleCards = 5; // 한 번에 보이는 카드 개수
	
	slides.forEach((slide, index) => {
	    const cards = slide.querySelectorAll(".card");
	    let currentIndex = 0;
	
	    function updateSlide() {
	        slide.style.transform = `translateX(-${currentIndex * cardWidth}px)`;
	
	        // 버튼 숨김 처리
	        prevButtons[index].style.visibility = currentIndex === 0 ? "hidden" : "visible";
	        nextButtons[index].style.visibility = currentIndex >= cards.length - visibleCards ? "hidden" : "visible";
	    }
	
	    // 초기 버튼 상태 설정
	    updateSlide();
	
	    nextButtons[index].addEventListener("click", () => {
	        if (currentIndex < cards.length - visibleCards) {
	            currentIndex++;
	        }
	        updateSlide();
	    });
	
	    prevButtons[index].addEventListener("click", () => {
	        if (currentIndex > 0) {
	            currentIndex--;
	        }
	        updateSlide();
	    });
	});



	
	
	