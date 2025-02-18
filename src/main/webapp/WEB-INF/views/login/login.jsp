<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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
			<span class="resetT">비밀번호 재설정</span>
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
	
</body>
</html>