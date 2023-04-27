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
					<form id="no_insert" action="<c:url value='/notice/update'></c:url>" method="post" enctype="multipart/form-data">
						<input type="hidden" name="no_num" value="${no.no_num}">
						<h3>게시판</h3>
						<select id="choose_type" name="no_nt_num">
							<c:forEach items="${ntList}" var="nt">
								<option value="${nt.nt_num}" <c:if test="${no.no_nt_num == nt.nt_num}">selected</c:if>>${nt.nt_name}</option>
							</c:forEach>
						</select>
						<h3>제목</h3>
						<div class="title_box">
							<input type="text" class="title" value="${no.no_title}" placeholder="20자 이내로 제목을 작성해보세요" name="no_title" maxlength="20">
						</div>
						<h3 class="content">내용</h3>
						<textarea id="summernote" name="no_content">${no.no_content}</textarea>
						<button type="submit" class="btn_insert">수정하기</button>
					</form>
				</div>
				</section>
			</div>
		</main>
	</div>
<script>
$('form').submit(function(){
	let title = $('[name=no_title]').val();
	let content = $('[name=no_content]').val();
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