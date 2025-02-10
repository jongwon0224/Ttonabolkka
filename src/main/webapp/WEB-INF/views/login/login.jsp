<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<link href="/css/login.css" rel="stylesheet">
<body>
	<div class=mainBox>
		<div class="logo">로고</div>
		<span class="loginT loginTback">로그인/회원가입</span>
		<button class="kakaobtn btn">
			<div class="kakaoT">
				<i class="fa-solid fa-comment"></i> 카카오로 시작하기
			</div>
		</button>
		<button class="naverbtn btn">
			<div class="naverT">
				<i class="fa-solid fa-n"></i> 네이버로 시작하기
			</div>
		</button>
		<button class="applebtn btn">
			<div class="appleT">
				<i class="fa-brands fa-apple"></i> Apple로 시작하기
			</div>
		</button>
		<button class="facebookbtn btn">
			<div class="facebookT">
				<i class="fa-brands fa-facebook"></i> 페이스북으로 시작하기
			</div>
		</button>
		<button class="googlebtn btn">
			<div class="googleT">
				<i class="fa-brands fa-google" style="color: #e60000;"></i> 구글로 시작하기
			</div>
		</button>
		<button class="emailbtn btn">
			<div class="emailT" onClick="location.href='/login/email'">
				<i class="fa-solid fa-envelope"></i> 이메일로 시작하기
			</div>
		</button>
	</div>

</body>
</html>