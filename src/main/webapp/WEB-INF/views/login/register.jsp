<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.error-msg {
	color: red;
	font-size: 10px;
}

.error-msg1 {
	color: red;
	font-size: 10px;
}
</style>

<link href="/css/register.css" rel="stylesheet">
<link href="/css/login.css" rel="stylesheet">
</head>


<body>
	<form action="" method="post" onsubmit="return validateForm()">
		<div class="mainBox">
			<div class="logo">로고</div>
			<h2 class="h2T">회원가입</h2>

			<div class="labelT">아이디</div>
			<input type="text" name="nickname" class="input-group" required>
			<spring:hasBindErrors name="user">
				<c:if test="${errors.hasFieldErrors('nickname')}">
					<p id="nicknameError" class="error-msg">아이디 필수로 입력하세요.</p>
					<p class="error-msg">${errors.getFieldError('nickname').defaultMessage}</p>
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

			<button type="submit" class="input-login">회원가입 완료</button>
		</div>
	</form>

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
		    var nicknameInput = document.getElementsByName("nickname")[0];
		    var errorMsg = document.getElementById("nicknameError"); // 아이디 필수 입력 메시지 선택
	
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

 // 🟢 전체 동의 체크 기능
    document.getElementById("agreeAll").addEventListener("change", function() {
        var checkboxes = document.querySelectorAll(".agreeCheck"); // 개별 체크박스들
        checkboxes.forEach(checkbox => {
            checkbox.checked = this.checked; // 전체 동의 체크 상태에 맞춰 변경
        });

        toggleSubmitButton(); // 체크박스 변경 시 버튼 상태 갱신
    });

    // 🟢 개별 체크박스 변경 시 전체 동의 체크 여부 확인
    document.querySelectorAll(".agreeCheck").forEach(checkbox => {
        checkbox.addEventListener("change", function() {
            var allChecked = document.querySelectorAll(".agreeCheck").length === document.querySelectorAll(".agreeCheck:checked").length;
            document.getElementById("agreeAll").checked = allChecked; // 모두 체크되었으면 전체동의 체크

            toggleSubmitButton(); // 체크박스 변경 시 버튼 상태 갱신
        });
    });

	</script>

</body>
</html>