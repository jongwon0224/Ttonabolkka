<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link href="/css/sighUp.css" rel="stylesheet">
<body>
	<div class=mainBox>
		<h2 class=h2T>이메일로 시작하기</h2>
		<div class=labelT>이메일</div>
		<input type="email" class=input-group>
		<div class=labelT>비밀번호</div>
		<input type="password" class=input-group>
		<div class=subBox>
			<div>
				<input type="checkbox">로그인 유지
			</div>
			<span class="resetT">비밀번호 재설정</span>
		</div>
		<button class="input-login">로그인</button>
		<div class="registerBox">
			<div class="registerT1">계정이 없으신가요?</div>
			<div class="registerT2" onClick="location.href='/register'">이메일로 회원가입</div>
		</div>
	</div>
</body>
</html>