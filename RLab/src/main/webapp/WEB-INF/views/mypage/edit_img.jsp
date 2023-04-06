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
<link rel="stylesheet" href="<c:url value ='/resources/css/edit_user.css'></c:url>">
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
					<form action="<c:url value ='/mypage/edit_img'></c:url>" method="post" id="edit_info" enctype="multipart/form-data">
						<h1>프로필 사진 수정</h1>
						<div class="input_container">
							<label for="nick_name">프로필 사진 수정</label>
							<div class="item_container">
								<div class="input_box">				
									<input type="file" class="input_window" id="profile_img" name="file" value="${user.me_profile}">
								</div>
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
	$('#edit_info').submit(function(){
		event.preventDefault(); // submit 이벤트 막기
		
		if($("#profile_img").val() != ''){	
			
			var allowedExtensions = ["jpg", "jpeg", "png", "gif"];
			var fileName = $("#profile_img").val();
			var fileExtension = "";
			
			// 파일 이름에서 확장자 추출
	        var i = fileName.lastIndexOf('.');
	        if (i > 0) {
	            fileExtension = fileName.substring(i+1);
	            
		    	// 이미지 파일이 아닌 경우
		        if ($.inArray(fileExtension.toLowerCase(), allowedExtensions) == -1) {
		            alert("이미지 파일 형식이 아닙니다.");
		            return false;
		        }else{	    	 
					alert('이미지가 변경되었습니다.');
					$(this).unbind('submit').submit(); // submit 이벤트 다시 실행	        	
		        }
	        }
		}else{
			alert('파일을 선택해주세요.');
			return false;			
		}
	});


</script>

</body>
</html>