<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin-top:10%;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link href="/css/login.css" rel="stylesheet">

</head>

<body>

	<form action="/login/mypage" method="post" class="mainBox">
		<i class="fa-solid fa-user fa-xl"></i> <br>
		<h2 class=h2T>환영합니다!</h2>
		<h2 class=h2T>${loginUserId.id}님의 MyPage입니다.</h2>
		<input type="hidden" name="id" value="${loginUserId.id}"><br>
		<label for="password" class="labelT">새로운 비밀번호</label> <input type="password"
			name="password" id="password" class="input-group"
			placeholder="새로운 비밀번호 입력">
		<spring:hasBindErrors name="user">
			<c:if test="${errors.hasFieldErrors('password')}">
				<p class="error-msg1">비밀번호는 8자리~12자리로 입력해주세요.</p>
				<p class="error-msg1">${errors.getFieldError('password').defaultMessage}</p>
			</c:if>
		</spring:hasBindErrors>
		<button type="submit" class="applebtn btn appleT">정보 수정</button><br>
	</form>
	<form action="/login/mypage/remove" method="post" class="mainBox">
		<input type="hidden" name="id" value="${loginUserId.id}"> <label
			for="password" class="labelT">패스워드 확인</label> <input type="password"
			name="password" id="password" class="input-group"
			placeholder="기존 비밀번호 입력">
		<p id="errorMessage" class="error-msg">
			${loginError}
			<!-- Spring Model에서 전달된 오류 메시지 출력 -->
		</p>
		<button type="submit" class="facebookbtn btn facebookT">회원 탈퇴</button>
	</form>
	<div style="display: flex; justify-content: center;">
		<button class="mainBox applebtn btn">
			<div class="appleT" onClick="location.href='/main'">
				<i class="fa-solid fa-house"></i> HOME
			</div>
		</button>
	</div>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var passwordInput = document.getElementsByName("password")[0];

			// "비밀번호는 8자리~12자리로 입력해주세요!" 라는 에러 메시지 요소 찾기
			var passwordErrorMsg = document.querySelector(".error-msg1");

			// **초기 상태에서 에러 메시지를 숨김**
			if (passwordErrorMsg) {
				passwordErrorMsg.style.display = "none";
			}

			// 입력값이 변경될 때마다 실행되는 이벤트 리스너
			passwordInput.addEventListener("input", function() {
				var passwordLength = passwordInput.value.length;

				if (passwordLength >= 8 && passwordLength <= 12) {
					passwordErrorMsg.style.display = "none"; // 조건 충족 시 숨김
				} else {
					passwordErrorMsg.style.display = "block"; // 조건 미충족 시 표시
				}
			});
		});
	</script>
</body>
</html>