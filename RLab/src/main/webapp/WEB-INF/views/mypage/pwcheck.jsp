<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value ='/resources/css/edit_info.css'></c:url>">
<title>개인정보 수정</title>
</head>
<body>
	<div id="total_container">
		<!-- main -->
		<main>
			<div id="main_container">
				<!-- aside(left_menu) -->
				<aside class="left_menu_container">
					<nav class="left_menu">
						<a href="./mypage.html" class="list_item">마이페이지 홈</a>
						<a href="./edit_info.html" class="list_item">개인정보 수정</a>
						<a href="#" class="list_item">예약 관리</a>
						<a href="./mystudy.html" class="list_item">스터디 관리</a>
						<a href="./mypost.html" class="list_item">작성글 관리</a>
					</nav>
				</aside>

				<div class="form_container">
					<form action="<c:url value ='/mypage/pwcheck'></c:url>" method="post">
						<h1>개인정보 수정</h1>
						<div class="input_container">
							<label for="pw">비밀번호 입력</label>
							<div class="input_box">
								<input type="password" id="pw" name="me_pw" placeholder="비밀번호 입력">
								<input type="submit" class="check_btn" value="확인">
							</div>
						</div>
					</form>

				</div>
			</div>


		</main>

	</div>
</body>
</html>