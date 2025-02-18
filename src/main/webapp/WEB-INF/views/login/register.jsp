<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin-top:5%;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link href="/css/register.css" rel="stylesheet">
<link href="/css/login.css" rel="stylesheet">
</head>


<body>
	<!-- nav -->
	<div class="nav">
		<h1 class="logo" onclick="location.href='/main'">떠나볼까</h1>
		<div class="nav-r">
			<span class="category"><i class="fa-solid fa-bars"></i></span>
		</div>
		
		<!-- 카테고리 메뉴 -->
		<div class="category-menu">
			<div class="menu-list">
				<ul>
					<li><a href="/main/subMain">국내여행</a></li>
					<li><a href="" onclick="alert('구현중입니다')">해외여행</a></li>
					<li><a href="" onclick="alert('구현중입니다')">이벤트</a></li>
					<li><a href="" onclick="alert('구현중입니다')">고객센터</a></li>
				</ul>
			</div>
		</div>
	</div>
	<form action="" method="post" onsubmit="return validateForm()">
		<div class="mainBox">
			<h2 class="h2T">회원가입</h2>
			<div class="labelT">아이디</div>
			<input type="text" name="id" class="input-group" required>
			<spring:hasBindErrors name="user">
				<c:if test="${errors.hasFieldErrors('id')}">
					<p id="idError" class="error-msg">아이디 필수로 입력하세요.</p>
					<p class="error-msg">${errors.getFieldError('id').defaultMessage}</p>
				</c:if>
			</spring:hasBindErrors>

			<div class="labelT">비밀번호</div>
			<input type="password" name="password" class="input-group" required
				oninput="checkPasswordMatch()">
			<spring:hasBindErrors name="user">
				<c:if test="${errors.hasFieldErrors('password')}">
					<p class="error-msg1">비밀번호는 8자리~12자리로 입력해주세요.</p>
					<p class="error-msg1">${errors.getFieldError('password').defaultMessage}</p>
				</c:if>
			</spring:hasBindErrors>

			<div class="labelT">비밀번호 확인</div>
			<input type="password" name="passwordConfirm" class="input-group"
				required oninput="checkPasswordMatch()">
			<div id="passwordError" class="error-message"></div>

			<div class="labelT">이름</div>
			<input type="text" name="username" class="input-group" required>

			<div class="labelT">핸드폰 번호</div>
			<input type="tel" name="tel" class="input-group" required>

			<!-- ✅ 전체 동의 체크박스 -->
			<div class="registerAgreeBox">
				<div class="registerAgreeT">
					<input type="checkbox" id="agreeAll"> <strong>약관
						전체동의</strong> <span class="registerAgreeTT">(선택항목 포함)</span>
				</div>
			</div>

			<!-- 개별 동의 체크박스 -->
			<div class="registerAgreeBox">
				<input type="checkbox" class="agreeCheck">
				<div class="registerAgreeT1">
					(필수) <a href="#" id="openModal">이용약관</a>
				</div>
			</div>

			<div class="registerAgreeBox">
				<input type="checkbox" class="agreeCheck">
				<div class="registerAgreeT1">(필수)만 14세 이상 확인</div>
			</div>

			<div class="registerAgreeBox">
				<input type="checkbox" class="agreeCheck">
				<div class="registerAgreeT1">(필수)개인정보 수집 및 이용 동의</div>
			</div>

			<button type="submit" class="input-login" id="submitBtn" disabled>
			<i class="fa-solid fa-right-to-bracket"></i> 회원가입 완료</button>
		</div>
	</form>
	
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
				<p>(주)떠나볼까는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한
					의무와 책임은 각 판매자에게 있습니다.</p>
			</div>
			<br /> <br />
			<div>
				<span> 이용약관 </span> <span> 개인정보 처리방침 </span> <span> 소비자 분챙해결
					기준 </span> <span> 콘텐츠산업진흥법에 의한 표시 </span>
			</div>
		</div>
	</div>

	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>이용약관</h2>
			<p>여기에 이용약관 내용을 입력하세요. 이 내용은 사용자가 반드시 확인해야 합니다.</p>
		</div>
	</div>

	<script>
	
	//발리드 메세지 숨기는 기능
			document.addEventListener("DOMContentLoaded", function() {
		    var nicknameInput = document.getElementsByName("id")[0];
		    var errorMsg = document.getElementById("idError"); // 아이디 필수 입력 메시지 선택
	
		    nicknameInput.addEventListener("input", function() {
		        if (nicknameInput.value.trim() !== "") {
		            errorMsg.style.display = "none"; // 값이 입력되면 숨김
		        } else {
		            errorMsg.style.display = "block"; // 값이 없으면 다시 표시
		        }
		    });
		});
	
		document.addEventListener("DOMContentLoaded", function() {
		    var passwordInput = document.getElementsByName("password")[0];
		    
		    // "비밀번호는 8자리~12자리로 입력해주세요!" 라는 에러 메시지 자동 검색
		    var passwordErrorMsg = document.querySelector(".error-msg1");
		    
		    passwordInput.addEventListener("input", function() {
		        var passwordLength = passwordInput.value.length;

		        if (passwordLength >= 8 && passwordLength <= 12) {
		            passwordErrorMsg.style.display = "none"; // 조건 충족 시 숨김
		        } else {
		            passwordErrorMsg.style.display = "block"; // 조건 미충족 시 표시
		        }
		    });
		});
	
		function checkPasswordMatch() {
		    var password = document.getElementsByName("password")[0].value;
		    var passwordConfirm = document.getElementsByName("passwordConfirm")[0].value;
		    var passwordError = document.getElementById("passwordError");
	
		    if (passwordConfirm.length > 0) { // 비밀번호 확인란이 입력될 때만 체크
		        if (password !== passwordConfirm) {
		            passwordError.textContent = "비밀번호가 일치하지 않습니다.";
		            passwordError.style.display = "block";
		        } else {
		            passwordError.style.display = "none";
		        }
		    } else {
		        passwordError.style.display = "none";
		    }
		}
	
		function validateForm() {
		    var password = document.getElementsByName("password")[0].value;
		    var passwordConfirm = document.getElementsByName("passwordConfirm")[0].value;
		    var passwordError = document.getElementById("passwordError");
	
		    if (password !== passwordConfirm) {
		        passwordError.textContent = "비밀번호가 일치하지 않습니다.";
		        passwordError.style.display = "block"; // 오류 메시지 표시
		        return false; // 폼 제출 방지
		    } else {
		        passwordError.style.display = "none"; // 오류 메시지 숨김
		    }
		    return true;
		}
		
	    // 🟢 모달 기능
	    var modal = document.getElementById("modal");
	    var openModalBtn = document.getElementById("openModal");
	    var closeModalBtn = document.getElementsByClassName("close")[0];
	
	    openModalBtn.onclick = function() {
	        modal.style.display = "block";
	    }
	    closeModalBtn.onclick = function() {
	        modal.style.display = "none";
	    }
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	
	 // 🟢 버튼 활성화/비활성화 함수
	    function toggleSubmitButton() {
	        var checkboxes = document.querySelectorAll(".agreeCheck");
	        var allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
	        document.getElementById("submitBtn").disabled = !allChecked; // 모든 체크박스가 체크되었을 때만 버튼 활성화
	    }
	
	    // 🟢 전체 동의 체크 기능
	    document.getElementById("agreeAll").addEventListener("change", function() {
	        var checkboxes = document.querySelectorAll(".agreeCheck");
	        checkboxes.forEach(checkbox => {
	            checkbox.checked = this.checked;
	        });
	
	        toggleSubmitButton(); // 체크박스 변경 시 버튼 상태 갱신
	    });
	
	    // 🟢 개별 체크박스 변경 시 전체 동의 체크 여부 확인 & 버튼 상태 갱신
	    document.querySelectorAll(".agreeCheck").forEach(checkbox => {
	        checkbox.addEventListener("change", function() {
	            var allChecked = document.querySelectorAll(".agreeCheck").length === document.querySelectorAll(".agreeCheck:checked").length;
	            document.getElementById("agreeAll").checked = allChecked;
	            
	            toggleSubmitButton(); // 체크박스 변경 시 버튼 상태 갱신
	        });
	    });
	
	    // 초기 실행 시 버튼 상태 확인
	    toggleSubmitButton();
	    
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


	</script>

</body>
</html>