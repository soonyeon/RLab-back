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
<link rel="stylesheet" href="<c:url value ='/resources/css/edit_info_next.css'></c:url>">
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
					<form action="<c:url value ='/mypage/edit_user'></c:url>" method="post" id="edit_info">
						<h1>개인정보 수정</h1>
						<div class="input_container">
							<label for="nick_name">닉네임 수정</label>
							<div class="input_box">
								<input type="text" id="nick_name" name="me_name" placeholder="새 닉네임 입력">
								 <span id="nick_name_error" class="error_msg"></span>
								<input type="button" class="check_btn check_name" value="중복확인">
							</div>
						</div>

						<div class="input_container">
							<label for="pw_new">비밀번호 수정</label>
							<div class="input_box">
								<input type="password" id="pw_new" name="me_pw" placeholder="새 비밀번호 입력">
								 <span id="me_pw_error" class="error_msg"></span>
								<input type="button" class="check_btn check_pw" value="확인">
							</div>
						</div>

						<div class="input_container">
							<label for="pw_new_check">새 비밀번호 확인</label>
							<div class="input_box">
								<input type="password" id="pw_new_check" name="me_pw2" placeholder="새 비밀번호 입력">
								<span id="me_pw2_error" class="error_msg"></span>
								<input type="button" class="check_btn check_pw2" value="확인">
							</div>
						</div>

						<div class="input_container">
							<label for="email">이메일</label>
							<div class="input_box">
								<input type="email" id="email" name="me_email" placeholder="000000@naver.com">
								 <span id="me_email_error" class="error_msg"></span>
								<input type="button" class="check_btn check_mail" value="인증하기">
							</div>
						</div>
						<div class="submit_container">
							<input type="submit" value="수정하기" id="submit_btn" class="submit_btn">
						</div>
					</form>

				</div>
			</div>


		</main>

	</div>
<script>
	$(document).ready(function(){
		// 유효성 검사 규칙
		var rules = {
			me_name : {
				required : true,
				regex : /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,9}$/
			},
			me_pw : {
				required : true,
				regex : /^[a-zA-Z0-9!@#]{8,19}$/
			},
			me_pw2 : {
				equalTo : #pw_new
			},
			me_email : {
				required : true,
				email : true
			}
		};
		
		// 유효성 검사 메세지
		var messages = {
			me_name : {
				required : '필수항목 입니다',
				regex : '닉네임은 한글,영어,숫자를 이용하여 2-10자 까지 가능합니다'
			},
			me_pw : {
				required : '필수항목 입니다',
				regex : '비밀번호는 영문, 숫자, !@#를 이용하여 8-20자 까지 가능합니다'
			},
			me_pw2 : {
				equalTo : '비밀번호가 일치하지 않습니다'
			},
			me_email : {
				required : '필수항목 입니다',
				email : '이메일 형식이 아닙니다'
			}	
		};
		
		// 유효성 검사 욥션
		 var options = {
		    errorClass: 'error',
		    errorElement: 'span',
		    errorPlacement: function(error, element) {
		      error.insertAfter(element);
		    }
		};
		
		// 유효성 검사 적용
		 $('#edit_info').validate({
		    rules: rules,
		    messages: messages,
		    errorPlacement: options.errorPlacement,
		    errorClass: options.errorClass,
		    highlight: function(element, errorClass) {
		      $(element).addClass(errorClass);
		    },
		    unhighlight: function(element, errorClass) {
		      $(element).removeClass(errorClass);
		    }
		  });
	})


</script>
</body>
</html>