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
<link rel="stylesheet" href="<c:url value ='/resources/css/notice/insert.css'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/mypage/mypage_common.css'></c:url>" />
<!-- summernote -->
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<title>RLab</title>

</head>
<body>
	<div id="total_container">
		<!-- main -->
		<main>
			<div id="main_container">
				<!-- aside(left_menu) -->
				<aside class="left_menu_container">
					<nav class="left_menu">
						<a href="<c:url value='/notice/list'></c:url>" class="list_item">공지사항</a>
						<a href="<c:url value='/inquiry/list'></c:url>" class="list_item">QnA</a>
					</nav>
				</aside>

				<section>
					<div class="notice_container" >
					<form id="in_insert" action="<c:url value='/inquiry/insert'></c:url>" method="post" enctype="multipart/form-data">
						<h3>게시판</h3>
						<select id="choose_type" name="in_it_num">
							<c:forEach items="${itList}" var="it" begin="1">
								<option value="${it.it_num}">${it.it_name}</option>
							</c:forEach>
						</select>
						<h3>제목</h3>
						<div class="title_box">
							<input type="text" class="title" placeholder="20자 이내로 제목을 작성해보세요" name="in_title" maxlength="20">
						</div>
						<!-- 
						<h3>배너이미지</h3>
						<div class="ns_banner_box">
							<input type="file" class="ns_banner" name="files" >
							<input name ="fi_table" type="hidden" value="study">
						</div> -->
						<h3>내용</h3>
						<textarea id="summernote" name="in_content" ></textarea>
						<button type="submit" class="btn_insert">작성하기</button>
					</form>
					</div>
				</section>
		</div>
		</main>
	</div>
<script>
$('form').submit(function(){
	let title = $('[name=in_title]').val();
	let content = $('[name=in_content]').val();
	if(title.trim().length == 0){
		alert('제목을 입력하세요.');
		return false;
	}
	if(content.trim().length == 0){
		alert('내용을 입력하세요.');
		return false;
	}

})
$('#summernote').summernote(
	{
		tabsize : 2,
		height : 500,
		toolbar : [ [ 'style', [ 'style' ] ],
				[ 'font', [ 'bold', 'underline', 'clear' ] ],
				[ 'color', [ 'color' ] ],
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				[ 'table', [ 'table' ] ],
				[ 'insert', [ 'link', 'picture', 'video' ] ],
				[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
	});
</script>
</body>
</html>