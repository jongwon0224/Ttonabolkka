<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>떠나볼까 - <c:out value="${places.name}" /></title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/detail.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        /* CSS 스타일링은 detail.css 파일에 작성 */
    </style>
</head>
<body>

    <nav class="nav">
        <!-- 네비게이션 바 추가 (필요 시) -->
    </nav>

    <main class="content">
        <article class="gallery-container">
            <div class="css-12lmpk7" style="display: flex; gap: 10px; height: 480px;">
                <div class="big-photo">
                    <img src="<c:url value='/resources${mainImageUrl}' />"
                        alt="<c:out value='${places.name}' /> 대표사진" class="main-photo">
                </div>

                <div class="small-photos">
                    <c:forEach items="${subImageUrls}" var="imageUrl" varStatus="status">
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
        <div class="modal-gallery">
            <button class="prev" onclick="changePhoto(-1)">&#10094;</button>
            <div class="slider">
                <img id="modalImage" src="<c:url value='/resources${mainImageUrl}' />">
            </div>
            <button class="next" onclick="changePhoto(1)">&#10095;</button>
        </div>
        
<!-- 작은 썸네일들 -->
<div class="thumbnail-gallery" id="thumbnailGallery">
    <!-- mainImageUrl을 첫 번째로 추가 -->
    <img src="<c:url value='/resources/${mainImageUrl}' />" 
         alt="<c:out value='${places.name}' /> 대표사진" 
         class="thumbnail" onclick="setImage(0)">
    
    <!-- subImageUrls를 반복문으로 추가 -->
    <c:forEach items="${subImageUrls}" var="imageUrl" varStatus="status">
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
                <c:out value="${places.name}" />
                에 대한 평가
            </h3>
            <div class="comment-box">
                <textarea id="commentInput" placeholder="악플 금지"></textarea>
                <button onclick="addComment()">등록</button>
            </div>
            <div class="comment-list" id="commentList"></div>
        </section>
    </main>

    <footer class="footer">
        <!-- 푸터 내용 (필요 시) -->
    </footer>

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
    <script src="<c:url value='/resources/js/detail.js' />"></script>
</body>
</html>
