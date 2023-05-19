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
						<option value="울산광역시" <c:if test='${study.st_re_name == "울산광역시"}'>selected</c:if>>울산광역시</option>
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
				<img class="preview" height="200" width="200" src="<c:url value="/download/${file.fi_name}"></c:url>">
				<span class="btn-times" data-num="${file.fi_num}">X</span>
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
		$('.btn-times').click();
		
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
		
		$('.ns_banner_box').append('<span class="btn-times2" >X</span>')
		$('.btn-times2').click(function(){
			$(this).siblings('.preview').attr('src', plus_img);
			$(this).remove();
		})
		
	}
	
	//첨부파일 삭제
	$('.btn-times').click(function(){
		$(this).siblings('.preview').attr('src', plus_img);
		$(this).siblings('.file_box').show();
		
		//input태그로 삭제할 첨부파일 번호를 전송하기 위한 준비 작업
		$(this).after('<input type="hidden" name="fileNums" value="'+$(this).data('num')+'">');
		$(this).remove();
	})

	//사진 삭제후 비어있는 이미지 전역변수
	var plus_img = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMIAAAEDCAMAAABQ/CumAAAAflBMVEX///+4uLi7u7v7+/vAwMD09PTFxcXp6enc3Nz4+PjIyMi6uro8PDw/Pz/w8PCzs7PPz8/l5eXV1dU4ODinp6dTU1NFRUVZWVlOTk7T09OIiIiXl5eurq50dHRKSkpmZmaUlJR4eHienp6Li4t+fn4sLCxoaGgWFhYmJiYyMjIE2RVEAAAE80lEQVR4nO3b6XqqOhQGYAiBhCHMBEQZHOo53v8NniTYVt2t7dkDyn6+90eLKO1aMWsBbbQsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIBFclj26BB+iZOlYUgfHcXP87MgSWie2vGjI/k5LvdI4nHXcknIHx3MT4g5DSlV8StpSJY2k5w4pzZJc5KbhzEhZFEzyWG5F5I0860V8fXjWJdzsJgUVPshNEyZjt21VQGwFZ3yWQYVv52Q3CNTwClV7TSxV8x5cFzfZdoP5bEVJ6YC/IxS1U4XM3981X7Iuf0EocnHJt70eCFim3pkav0sXKl8wmBR8WuUEqqnvBMHlJAgW1r8Sk5JptrpSmWynPZzjYVBtiLqdMaWGb9G1el4Oe3nQ1zNH99373l0iF/h5EL40ab97FOME+8LC0iBhvYdhC4hBS9mn7MXkUJw7/nlp+AghTkghWeAFJ4BUngGSOEZ/P0pLOQaybtzocrCRaRA7twuhMu4X/jC86eQ3Ltn05JnT8FyvvToCAEAAACe3YadN1jTWuzuS5+Sw8uiPW8fxLgrHpBD9gu/Mw72tRT9OQXe1ywtyO8J63/wh/r2ypmVP9wN8ORmRxpbvoo/ksN+J9fTvo3YW/vi7l33HxHX1e2/Z73TFLDDN/vtymweXq6XRZanMTwW8lhy1wqi3bRzLbtWDH864B+xprr9D+xGjPpb2gnRy87saqKrF7G+KkW1mxZqeNFm2ruSUtQPKAVW6RTSNraCTTBNqVKU6usoRL05TpMkjuTVQaNYB+J1kaEXvc6yfEfmvJ1zd9Pbn0mdwrrY1EUhajPWpY5pjGRi2WIqlFzUVwdLqer2ddIH0XrGuN+5gxhMdFzoFHbC3pRpI1K9y6Sw7phqMf001KnYXh6cRZ1lv6XATxcpsDwcu6qbI4VW1v3uIoVI98JGmqI1KVgqwYM8F6otDpcH86hVz6XnR347lbwV52VX90KIppwhg0zWvOt16WWN7kgmhVwO7xNJSeXAWlOeyVTgr+LouOunRhabI1yVL29rVc5yOJTzrEDZiZ21Fnr0WNVk5xTWOlCfvaWwFTR7MQOaRNfjehBCmtc4Rz3DskFNpUL09SHhsy2g2Yogqxv96+LhLYVK5FZad68pZM3gx8VhSmFzdbhfjip9XSednob7Qj3tlatZ18cc5LaPQhPNUa50jInqLNv8EKmNchrzoFCVUDcfpWDwf1Q1tGoAsr4+j3024yImXhXHcznudV2mRWl1TaNOTYEO2LSYbBvrAdazLfwohaSg6u2TuXoLz9PMHSpVUclmnr9Wvv9JsTypSLgs86iXzU7PheA0vr0uLfQ2//f2GsnSZ45cVYEIrErytVmJHg9VqWt67vMEG/Sc3pb+dptM88AdvfenTcOy6AcD26oUtpUMmOjiwXQ3VVdCqsY0R0+9YqL7dKlaePI+eaaNeFaXEUnVZR6JRv1Djs2a86Z5tk/KfNrl1UTiRxKVRNfEVl8yOZ06m7ey/eSA55NEYXbcRDR50YvqG30VtZe5K1VrtvzVo6P7Fla0bl2LwDXXUbGu4fIUeKoyvLZ4eXBw3zSe1ClEXn6wh4/+2Fcyio5L+bhPZjmlfbMvLeSwzh8Szm/DF7xMGgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACM/wDCj0dZezasYAAAAABJRU5ErkJggg=='

	

	
</script>