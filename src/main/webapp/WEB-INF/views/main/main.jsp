<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>떠나볼까</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Arial', sans-serif;
    }

    /* 상단 네비게이션 바 */
    .nav {
        background: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 40px;
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    .logo {
        font-size: 24px;
        font-weight: bold;
        color: #0078ff;
        cursor: pointer;
    }

    .menus {
        list-style: none;
        display: flex;
    }

    .menu {
        margin-left: 20px;
        font-size: 18px;
        cursor: pointer;
        padding: 10px;
        transition: color 0.3s ease;
    }

    .menu:hover {
        font-weight: bold;
        color: #0056b3;
    }

    .login_menus {
        font-size: 16px;
        cursor: pointer;
        color: #0078ff;
    }
    
    .category {
        font-size: 16px;
        cursor: pointer;
        color: #0078ff;
    }

    /* 본문 스타일 */
    .body_img {
    	width: 100%;
    	height: 300px;
    	border: 1px solid black;
    }
    
    .container {
        width: 80%;
        margin: 30px auto;
        text-align: center;
    }

    

    /* 푸터 스타일 */
    .footer {
        background: #333;
        color: white;
        text-align: center;
        padding: 15px 0;
        margin-top: 50px;
    }
</style>
</head>
<body>

    <!-- nav -->
    <div class="nav">
        <h1 class="logo">떠나볼까</h1>
        <div class="nav-r">
        	<span class="login_menus"> 로그인 / 회원가입 </span>
        	<span class="category">카테고리</span>
        </div>
    </div>

    <!-- body -->
    <div class="body_img">
 		   사진
    </div>
    
    <div class="container">
    	<div >
    	</div>
        
    </div>

    

    <!-- footer -->
    <div class="footer">
        ⓒ 2024 떠나볼까 | 여행을 떠나고 싶은 모든 순간
    </div>

</body>
</html>
