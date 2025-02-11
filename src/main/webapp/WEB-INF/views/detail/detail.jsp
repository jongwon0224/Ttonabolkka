<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>떠나볼까 - <c:out value="${detail.name}" /></title>
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
                    <img src="<c:url value='/resources/image/${detail.category}/${detail.mainImage}' />"
                         alt="<c:out value='${detail.name}' /> 대표사진" class="main-photo"
                         style="width: 100%; height: 97%; border-radius: 15px; object-fit: cover;">
                </div>

                <div class="small-photos">
                    <c:forEach items="${detail.imageUrls}" var="imageUrl" varStatus="status">
                        <img src="<c:url value='/resources/image/${detail.category}/${imageUrl}' />"
                             alt="<c:out value='${detail.name}' /> 서브사진 <c:out value='${status.count}' />"
                             style="width: 100%; height: ${status.count <= 2 ? '98%' : '88%'}; object-fit: cover; border-radius: 15px;">
                    </c:forEach>
                </div>
            </div>
        </article>

        <section id="photoModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <div class="modal-gallery">
                    <button class="prev" onclick="changePhoto(-1)">&#10094;</button>
                    <div class="slider">
                        <img id="modalImage" src="" alt="<c:out value='${detail.name}' />">
                    </div>
                    <button class="next" onclick="changePhoto(1)">&#10095;</button>
                </div>
            </div>
        </section>

        <div class="more-photos">
            <a href="javascript:void(0);" onclick="openModal()">더보기</a>
        </div>

        <h2><c:out value="${detail.name}" /></h2>
        <div class="description">
            <c:out value="${detail.description}" />
        </div>

        <section class="image-list">
            <div class="photo-list">
                <c:forEach items="${detail.imageUrls}" var="imageUrl">
                    <img src="<c:url value='/resources/image/${detail.category}/${imageUrl}' />" alt="<c:out value='${detail.name}' />">
                </c:forEach>
            </div>
            <button id="showMoreBtn">사진 더 보기🔽</button>
        </section>

        <section class="community">
            <h3><c:out value="${detail.name}" />에 대한 평가</h3>
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

    <script src="<c:url value='/resources/js/detail.js' />"></script>

</body>
</html>
