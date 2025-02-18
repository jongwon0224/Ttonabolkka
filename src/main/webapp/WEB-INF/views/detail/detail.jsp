<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>떠나볼까 - <c:out value="${places.name}" /></title>
<link rel="stylesheet" href="/css/detail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
/* CSS 스타일링은 detail.css 파일에 작성 */
</style>
</head>
<body>

	<!-- nav -->
	<div class="nav">
		<h1 class="logo" onclick="location.href='/main'">떠나볼까</h1>
		<div class="nav-r">
			<c:if test="${not empty loginUserId.id}">
				<span class="login_info">${loginUserId.id}님 환영합니다. </span>
				<span class="login_menus" onclick="location.href='/login/mypage'"> 마이페이지 </span> 
				<span class="login_menus" onclick="location.href='/logout'"> 로그아웃</span>
				<span class="category"><i class="fa-solid fa-bars"></i></span>
			</c:if>
			<c:if test="${empty loginUserId.id}">
				<span class="login_info"> 비로그인 </span>
				<span class="login_menus" onclick="location.href='/login'"> 로그인 / 회원가입 </span> 
				<span class="category"><i class="fa-solid fa-bars"></i></span>
			</c:if>
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

	<main class="content">
		<article class="gallery-container">
			<div class="css-12lmpk7"
				style="display: flex; gap: 10px; height: 480px;">
				<div class="big-photo">
					<img src="<c:url value='/resources${mainImageUrl}' />"
						alt="<c:out value='${places.name}' /> 대표사진" class="main-photo">
				</div>

				<div class="small-photos">
					<c:forEach items="${subImageUrls}" var="imageUrl"
						varStatus="status">
						<div class="small-photo">
							<img src="<c:url value='/resources/${imageUrl}' />"
								alt="<c:out value='${places.name}' /> 서브사진 <c:out value='${status.count}' />">
						</div>
					</c:forEach>
				</div>
			</div>
		</article>

		<!-- 모달창 -->
		<section id="photoModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeModal()">&times;</span>

				<!-- 슬라이더 영역 -->
				<div class="modal-gallery">
					<button class="prev" onclick="changePhoto(-1)">&#10094;</button>
					<div class="slider">
						<img id="modalImage"
							src="<c:url value='/resources/${mainImageUrl}' />" alt="메인 이미지">
					</div>
					<button class="next" onclick="changePhoto(1)">&#10095;</button>
				</div>

				<!-- 썸네일 갤러리 (중앙 정렬) -->
				<div class="thumbnail-gallery" id="thumbnailGallery">
					<!-- 첫 번째: 메인 이미지 -->
					<img src="<c:url value='/resources/${mainImageUrl}' />"
						alt="<c:out value='${places.name}' /> 대표사진" class="thumbnail"
						onclick="setImage(0)">

					<!-- 두 번째부터: 서브 이미지 -->
					<c:forEach items="${subImageUrls}" var="imageUrl"
						varStatus="status">
						<img src="<c:url value='/resources/${imageUrl}' />"
							alt="<c:out value='${places.name}' /> 서브사진 <c:out value='${status.index}' />"
							class="thumbnail" onclick="setImage(${status.index + 1})">
					</c:forEach>
				</div>
			</div>
		</section>

		<!-- 더보기 버튼 -->
		<div class="more-photos">
			<a href="javascript:void(0);" onclick="openModal()">더보기</a>
		</div>

        
		<h2>
			<c:out value="${places.name}" />
		</h2>
		<div class="description">
			<c:out value="${places.description}" />
		</div>

		<section class="image-list">
			<div class="photo-list">
				<!-- 대표 이미지 추가 -->
				<img src="<c:url value='/resources/${mainImageUrl}' />"
					alt="<c:out value='${places.name}' /> 대표사진" class="photo-item">

				<!-- 서브 이미지 리스트 -->
				<c:forEach items="${subImageUrls}" var="imageUrl" varStatus="status">
					<img src="<c:url value='/resources/${imageUrl}' />"
						alt="<c:out value='${places.name}' />"
						class="photo-item ${status.index >= 1 ? 'hidden' : ''}">
				</c:forEach>
			</div>
			<button id="showMoreBtn">사진 더 보기🔽</button>
		</section>

		<section class="community">
			<h3>
				<c:out value="${places.name}" />에 대한 평가
			</h3>
			<div class="comment-box">
				<form action="/main/subMain/detail/${places.id}" method="post" enctype="multipart/form-data" id="frm_comment">
					<!-- 로그인 기능 구현 이후 value 수정 -->
					<input type="hidden" name="userId" value="${session.loginUser.id}">
					<input type="hidden" name="placeId" value="${places.id}"> 
					<input type="text" id="title" class="ctitle" name="title" required>
					<textarea id="content" class="ccontent" name="content"
						placeholder="악플 금지" required></textarea>
					<input type="file" name="image" class="file">
					<button type="submit">등록</button>
				</form>
			</div>
			<div class="comment-list" id="commentList">
			    <c:forEach var="tl" items="${travelLogs}">
			        <div class="comment">
			        	<div class="comment_header">
				            <div class="user-info">
				            	<img src="/img/profile.jpg" class="profile">
				                <span class="comment-userId">${tl.userId}</span>
				            </div>
				            <div class="cbutton">
				        		<c:if test="${not empty loginUserId.id}">
									<span class="cmodify" onclick="alert('구현중입니다')"> 수정 </span>
									<span class="cremove" onclick="alert('구현중입니다')"> 삭제 </span> 
								</c:if>
				        	</div>
			            </div>
			            <div class="comment-content">
			                <strong class="ctitle">${tl.title}</strong><br/> 
			                <p class="ccontent">${tl.content}</p>
			            </div>
			            <c:if test="${not empty tl.fileName}">
						    <div class="comment-image">
						        <img src="${tl.urlFilePath}${tl.fileName}" alt="여행 기록 이미지" class="cimg">
						    </div>
						</c:if>
			
			            <div class="comment-date">${tl.createdAt}</div>
			        </div>
			    </c:forEach>
			</div>

		</section>
	</main>

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
				<p>(주)떠나볼까는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와
					책임은 각 판매자에게 있습니다.</p>
			</div>
			<br /> <br />
			<div>
				<span> 이용약관 </span> <span> 개인정보 처리방침 </span> <span> 소비자 분챙해결
					기준 </span> <span> 콘텐츠산업진흥법에 의한 표시 </span>
			</div>
		</div>
	</div>

    <!-- JSP에서 전역 변수 설정 -->
    <script type="text/javascript">
        window.contextPath = "${pageContext.request.contextPath}";
        window.mainImageUrl = "<c:url value='/resources${mainImageUrl}' />";
        window.subImageUrls = ${subImageUrlsJson};
        window.photos = [
            window.mainImageUrl, 
            ...window.subImageUrls.map(url => window.contextPath + "/resources/" + url)
        ];
        console.log(window.photos); // 디버깅용
    </script>

    <script src="/js/detail.js"></script>
    <script src="/js/main.js"></script>

</body>
</html>

