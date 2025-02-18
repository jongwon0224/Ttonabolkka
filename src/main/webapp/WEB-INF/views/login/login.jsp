<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="margin-top:5%;">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link href="/css/login.css" rel="stylesheet">

</head>

<body>
	<form action="" method="post" class=mainBox>
		<h2 class=h2T>로그인</h2>
		<div class=labelT>아이디</div>
		<input type="text" name="id" id="nickname" class=input-group>
		<div class=labelT>비밀번호</div>
		<input type="password" name="password" id="password" class=input-group>
		<p id="errorMessage" class="error-msg">
			${loginError}
			<!-- Spring Model에서 전달된 오류 메시지 출력 -->
		</p>
		<br>
		<div class=subBox>
			<div>
				<input type="checkbox" checked>로그인 유지
			</div>
		</div>
		<br>
		<button type="submit" class="input-login">로그인</button>
	</form>
	<div class=mainBox>
		<br>
		<div class="registerT1">계정이 없으신가요?</div>
		<button class="emailbtn btn">
			<div class="emailT" onClick="location.href='/login/register'">
				<i class="fa-solid fa-right-to-bracket"></i> ID / PW 로 가입하기
			</div>
		</button>
		<button class="kakaobtn btn">
			<div class="kakaoT">
				<i class="fa-solid fa-comment"></i> 카카오로 가입하기
			</div>
		</button>
		<button class="naverbtn btn">
			<div class="naverT">
				<i class="fa-solid fa-n"></i> 네이버로 가입하기
			</div>
		</button>
		<button class="applebtn btn">
			<div class="appleT">
				<i class="fa-brands fa-apple"></i> Apple로 가입하기
			</div>
		</button>
		<button class="facebookbtn btn">
			<div class="facebookT">
				<i class="fa-brands fa-facebook"></i> 페이스북으로 가입하기
			</div>
		</button>
		<button class="googlebtn btn">
			<div class="googleT">
				<i class="fa-brands fa-google" style="color: #e60000;"></i> 구글로 가입하기
			</div>
		</button>
	</div>
</body>
</html>