<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/gather/updateStudy.css'></c:url>">

<main>
	<div id="rc_new_study_main_container">
		<div class="main_title">
			<h1>스터디 수정</h1>
		</div>
		<form id="rc_new_box" action="<c:url value='/gather/updateStudy/${study.st_num}'></c:url>" method="post" enctype="multipart/form-data">
			<div class="top_box">
				<div class="ns_region_box">
					<h3>지역</h3>
					<select id="choose_region" name="st_re_name">
						<option value="지역미지정" <c:if test='${study.st_re_name == "지역 미지정"}'>selected</c:if>>지역미지정</option>
						<option value="서울특별시" <c:if test='${study.st_re_name == "서울특별시"}'>selected</c:if>>서울특별시</option>
						<option value="부산광역시" <c:if test='${study.st_re_name == "부산광역시"}'>selected</c:if>>부산광역시</option>
						<option value="경기도" <c:if test='${study.st_re_name == "경기도"}'>selected</c:if>>경기도</option>
						<option value="인천광역시" <c:if test='${study.st_re_name == "인천광역시"}'>selected</c:if>>인천광역시</option>
						<option value="대구광역시" <c:if test='${study.st_re_name == "대구광역시"}'>selected</c:if>>대구광역시</option>
						<option value="경상북도" <c:if test='${study.st_re_name == "경상북도"}'>selected</c:if>>경상북도</option>
						<option value="경상남도" <c:if test='${study.st_re_name == "경상남도"}'>selected</c:if>>경상남도</option>
						<option value="대전광역시" <c:if test='${study.st_re_name == "대전광역시"}'>selected</c:if>>대전광역시</option>
						<option value="전라북도" <c:if test='${study.st_re_name == "전라북도"}'>selected</c:if>>전라북도</option>
						<option value="전라남도" <c:if test='${study.st_re_name == "전라남도"}'>selected</c:if>>전라남도</option>
						<option value="충청북도" <c:if test='${study.st_re_name == "충청북도"}'>selected</c:if>>충청북도</option>
						<option value="충청남도" <c:if test='${study.st_re_name == "충청남도"}'>selected</c:if>>충청남도</option>
						<option value="광주광역시" <c:if test='${study.st_re_name == "광주광역시"}'>selected</c:if>>광주광역시</option>
						<option value="강원도" <c:if test='${study.st_re_name == "강원도"}'>selected</c:if>>강원도</option>
						<option value="울산광역시" <c:if test='${study.st_re_name == "울산광역시"}'>selected
						</c:if>>울산광역시</option>
						<option value="제주특별자치도" <c:if test='${study.st_re_name == "제주특별자치도"}'>selected</c:if>>제주특별자치도</option>
						<option value="세종특별자치도" <c:if test='${study.st_re_name == "세종특별자치도"}'>selected</c:if>>세종특별자치도</option>
					</select>
				</div>
				<div class="ns_people_box">
					<h3>인원</h3>
					<input type="number" class="ns_people" placeholder="최대50명" name="st_total_people" oninput="handleOnInput(this, 50)" value="${study.st_total_people }">
				</div>
			</div>
			<h3>스터디명</h3>
			<div class="ns_title_box">
				<input type="text" class="ns_title" placeholder="10자 이내로 제목을 작성해보세요" name="st_name" maxlength="10" value="${study.st_name}">
			</div>
			<h3>배너이미지</h3>
			<div class="ns_banner_box">
				<input name ="fi_table" type="hidden" value="study">
				<input hidden type="file" class="ns_banner" name="files" accept="image/*" onchange="readURL(this);" >
				<c:if test="${file == null }">
					<img class="preview" height="200" width="200" src="<c:url value="/resources/img/no_img.png"></c:url>">
				</c:if>
				<c:if test="${file != null }">
				<img class="preview" height="200" width="200" src="<c:url value="/download/${file.fi_name}"></c:url>">
				<img class="delete_btn" data-num="${file.fi_num}" src="<c:url value="/resources/img/delete.png"></c:url>">
				</c:if>
			</div>	
			<h3>태그</h3>
			<div class="ns_tag_box">
				<input type="text" class="ns_tag" placeholder="예시. 정처기, 모각코, 프로젝트 (태그명 최대 10자까지)" name="ta_name" 
				value="<c:forEach items='${tagList}' var='tag' varStatus='status'>${tag}${not status.last ? ',' : ''}</c:forEach>">
			</div>
			<h3>소개글</h3>
			<div class="ns_introduce_box">
				<input type="text" class="ns_introduce"
					placeholder="100자 이내로 스터디를 소개해보세요" name="st_info" maxlength="100" value="${study.st_info}">
			</div>

			<div class="btn_box">
			<c:if test="${user != null }">
				<button type="submit" class="make_study_btn">스터디 수정</button>
			</c:if>
			</div>
		</form>
		</div>
	
</main>

<script>
	//인원수를 최대 50까지로만 설정
	$(document).ready(function() {
	    $('input.ns_people').on('input', function() {
	        var max = 50;
	        if ($(this).val() > max) {
	            $(this).val(max);
	        }
	    });
	});
	
	
	$('form').submit(function(){
		  let region = $('[name=st_re_name]').val();
		  let member = $('[name=st_total_people]').val();
		  let title = $('[name=st_name]').val();
		  let content = $('[name=st_info]').val();
		  if(member == 0){
			    alert('인원을 입력하세요.');
			    return false;
			  }
		  if(title.trim().length == 0){
		    alert('스터디명을 입력하세요.');
		    return false;
		  }
		  if(content.trim().length == 0){
		    alert('소개글을 입력하세요.');
		    return false;
		  }
		})
	

	$('.file_box,.preview').click(function(){
		$(this).siblings('input').click();
	});
	
	//'readURL'은 input(첨부파일)값이 변경될때 호출
	function readURL(input){
		//미리보기 이미지를 업데이트 하기전 기존 이미지와 관련 데이터를 지우기 위해 실행
		$('.delete_btn').click();
		
		if(!input.files || !input.files[0]){
			input.nextElementSibling.src ='';
			input.previousElementSibling.style.display = 'block';
			return;
		}
		let reader = new FileReader();
		reader.onload = function(e){
			input.previousElementSibling.style.display = 'none';
			input.nextElementSibling.src = e.target.result;
		}
		//파일을 데이터 URL로 읽도록
		reader.readAsDataURL(input.files[0]);
		
		$('.ns_banner_box').append('<span class="delete_btn2"><img src="<c:url value="/resources/img/delete.png"></c:url>"></span>')
		$('.delete_btn2').click(function(){
			$(this).siblings('.preview').attr('src', '<c:url value="/resources/img/no_img.png"></c:url>');
			$(this).remove();
		})
		
	}
	
	//첨부파일 삭제
	$('.delete_btn').click(function(){
		$(this).siblings('.preview').attr('src', '<c:url value="/resources/img/no_img.png"></c:url>');
		$(this).siblings('.file_box').show();
		
		//input태그로 삭제할 첨부파일 번호를 전송하기 위한 준비 작업
		$(this).after('<input type="hidden" name="fileNums" value="'+$(this).data('num')+'">');
		$(this).remove();
	})

	//사진 삭제후 비어있는 이미지 전역변수
	//var plus_img = "/resources/img/no_img.png"


	
</script>