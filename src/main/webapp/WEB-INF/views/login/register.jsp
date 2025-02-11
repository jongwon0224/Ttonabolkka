<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link href="/css/register.css" rel="stylesheet">
<link href="/css/login.css" rel="stylesheet">

<body>
	<form action="" method="post">
	<div class="mainBox">
		<div class="logo">로고</div>
		<h2 class=h2T>회원가입</h2>
		<div class=labelT>아이디</div>
		<input type="text" name="id" class=input-group>
		<div class=labelT>비밀번호</div>
		<input type="password" name="pw" class=input-group>
		<div class=labelT>비밀번호 확인</div>
		<input type="password" name="pw" class=input-group>
		<div class=labelT>이름</div>
		<input type="password" name="name" class=input-group>
		<div class=labelT>핸드폰 번호</div>
		<input type="tel" name="tel" class=input-group>
		<div class="registerAgreeBox">
			<div class="registerAgreeT">
				<input type="checkbox">약관 전체동의 <span class="registerAgreeTT">선택항목
					포함</span>
			</div>
		</div>
		<div class="registerAgreeBox">
			<input type="checkbox">
			<div class="registerAgreeT1">(필수)이용약관</div>
		</div>
		<div class="registerAgreeBox">
			<input type="checkbox">
			<div class="registerAgreeT1">(필수)만 14세 이상 확인</div>
		</div>
		<div class="registerAgreeBox">
			<input type="checkbox">
			<div class="registerAgreeT1">(필수)개인정보 수집 및 이용 동의</div>
		</div>
		<button type="submit" class="input-login">회원가입 완료</button>
	</div>
	</form>
</body>
</html>