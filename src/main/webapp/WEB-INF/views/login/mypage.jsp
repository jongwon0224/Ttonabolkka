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
		<div class="title">${loginUserId.id}님 환영합니다.
		</div>
		<div class="input-group">
			<label for="password">비밀번호</label>
			<input type="password" id="password" class="input-style" placeholder="새로운 비밀번호 입력">
		</div>

		<button class="btn btn-save">정보 수정</button>
		<button class="btn btn-delete">회원 탈퇴</button>

		<a href="/main">메인화면으로</a>
	</div>
</body>
</html>