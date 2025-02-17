<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>떠나볼까</title>
<link href="/css/main.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

	<div class="container">
	
		<!-- nav -->
		<div class="nav">
			<h1 class="logo" onclick="location.href='/main'">떠나볼까</h1>
			<div class="nav-r">
				<span class="login_menus" onclick="location.href='/login'"> 로그인 / 회원가입 </span> <span class="category"><i
					class="fa-solid fa-bars"></i></span>
			</div>
			
			<!-- 카테고리 메뉴 -->
			<div class="category-menu">
				<div class="menu-list">
					<ul>
						<li><a href="/main/subMain">국내여행</a></li>
						<li><a href="">해외여행</a></li>
						<li><a href="">이벤트</a></li>
						<li><a href="">고객센터</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- body -->
		<div class="body_img">
			<img alt="임시사진"
				src="https://static.yeogi.com/_next/static/media/05_Kv_PC_Light.a07cefd7.webp">
		</div>


		<div class="body-container">

			<div class="body">
				<div class="section-title">이벤트</div>
				<div class="section-body">
					<div class="grid">
						<div class="card event">
							<img alt="카드사진" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e4224_dnpqqosj_1200x480_20241215225622.png">
						</div>
						<div class="card event">
							<img alt="카드사진" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e4224_dnpqqosj_1200x480_1_20241031135312.png">
						</div>
						<div class="card event">
							<img alt="카드사진" src="https://image.goodchoice.kr/resize_768x308/exhibition/cms/e4511_dnpqqosj_1200x480_2_20250122091226.png">
						</div>
					</div>
				</div>
			</div>


			<div class="body">
				<div class="section-title">국내 인기 여행지</div>
				<div class="section-body slide-body">
					<div>
						<i class="fa-solid fa-less-than"></i>
					</div>
					<div class="slide-container">
						<div class="slide">
							<c:forEach var="card" items="${cardList}">
								<div class="card" data-id="${card.id}">
									<div class="card-img">
										<img alt="카드사진" src="${card.image}">
									</div>
									<div class="card-content">${card.name}</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<i class="fa-solid fa-greater-than"></i>
				</div>
			</div>

			<div class="body">
				<div class="section-title">해외 인기 여행지</div>
				<div class="section-body slide-body">
					<div>
						<i class="fa-solid fa-less-than"></i>
					</div>
					<div class="slide-container">
						<div class="slide">
							<c:forEach var="card" items="${cardList}">
								<div class="card" data-id="${card.id}">
									<div class="card-img">
										<img alt="카드사진" src="${card.image}">
									</div>
									<div class="card-content">${card.name}</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<i class="fa-solid fa-greater-than"></i>
				</div>
			</div>

			<div class="body">
				<div class="section-title">핫플</div>
				<div class="section-body">
					<div class="grid">
					    <div class="card hot" onclick="location.href='/main/subMain/detail/8'">
					        <div class="hot_l">
					        	<p class="hashtags">#경주 핫플레이스 #핑크뮬리</p>
					            <p>첨성대 핑크뮬리</p>
					        </div>
					        <div class="hot_r">
					            <img alt="카드사진" src="/img/pinkflower.jpg">
					        </div>
					    </div>
					    <div class="card hot" onclick="location.href='/main/subMain/detail/7'">
					        <div class="hot_l">
					        	<p class="hashtags">#경주 핫플레이스 #데이트 코스</p>
					            <p>경주 황리단길</p>
					        </div>
					        <div class="hot_r">
					            <img alt="카드사진" src="/img/hwangroad.jpg">
					        </div>
					    </div>
					</div>
				</div>
			</div>

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
	</div>

	<script src="/js/main.js"></script>

</body>
</html>