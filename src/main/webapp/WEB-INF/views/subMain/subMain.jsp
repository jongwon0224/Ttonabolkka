<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link href="/css/subMain.css" rel="stylesheet">


<body>

    <div class="nav_bar">네브 바</div>

    <div class="main_container">
        <div class="category">
            <div>관광지</div>
            <div>테마파크</div>
            <div>핫 플레이스</div>
        </div>
        
        <c:forEach var="places" items="${placesList}">
            <div class="places_box">
                <div class="places_img">
                    <img src="${places.description}" alt="${places.name}이미지">
                </div>
                <div class="places_txt">${places.name}</div>
            </div>
        </c:forEach>
    </div>
        
</body>

<script src="/js/subMain.js" ></script>
</html>