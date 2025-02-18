<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="/css/myPage.css" rel="stylesheet">

</head>

<body>
	<div class="container">
		<div class="title">${loginUserId.id}님환영합니다.</div>
		<form action="/login/mypage" method="post">
			<div class="input-group">
				<input type="hidden" name="id" value="${loginUserId.id}"> <label
					for="password">비밀번호</label> <input type="password" name="password"
					id="password" class="input-style" placeholder="새로운 비밀번호 입력">
				<spring:hasBindErrors name="user">
					<c:if test="${errors.hasFieldErrors('password')}">
						<p class="error-msg1">비밀번호는 8자리~12자리로 입력해주세요.</p>
						<p class="error-msg1">${errors.getFieldError('password').defaultMessage}</p>
					</c:if>
				</spring:hasBindErrors>
				<button class="btn btn-save">정보 수정</button>
		</form>
	</div>
	<form action="/login/mypage1" method="post">
		<input type="hidden" name="id" value="${loginUserId.id}"> <label
			for="password">비밀번호</label> <input type="password" name="password"
			id="password" class="input-style" placeholder="기존 비밀번호 입력">
		<p id="errorMessage" class="error-msg">
			${loginError}
			<!-- Spring Model에서 전달된 오류 메시지 출력 -->
		</p>
		<button class="btn btn-delete">회원 탈퇴</button>
	</form>
	<a href="/main">메인화면으로</a>
	</div>

	<script>
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
	</script>
</body>
</html>