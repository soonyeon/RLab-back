<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/gather/insertstudy.css'></c:url>">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<title>스터디 생성</title>
<main>
	<div id="rc_new_study_main_container">
		<div class="main_title">
			<h1>스터디 만들기</h1>
		</div>
		<div class="temporary_storage_box">
			<button class="call_temporary_storage">
				임시저장 불러오기 <span>|</span> <span>1</span>
			</button>
		</div>
		<form id="rc_new_box" action="<c:url value='/gather/insertstudy'></c:url>" method="post">
			<div class="top_box">
				<div class="ns_region_box">
					<h3>지역</h3>
					<select id="choose_region" name="st_re_name">
						<option value="지역미지정">지역미지정</option>
						<option value="서울특별시">서울특별시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="경기도">경기도</option>
						<option value="인천광역시">인천광역시</option>
						<option value="대구광역시">대구광역시</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="대전광역시">대전광역시</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="광주광역시">광주광역시</option>
						<option value="강원도">강원도</option>
						<option value="울산광역시">울산광역시</option>
						<option value="제주특별자치도">제주특별자치도</option>
						<option value="세종특별자치도">세종특별자치도</option>
					</select>
				</div>
				<div class="ns_people_box">
					<h3>인원</h3>
					<input type="number" class="ns_people" placeholder="최대50명" name="st_total_people">
				</div>
			</div>
			<h3>스터디명</h3>
			<div class="ns_title_box">
				<input type="text" class="ns_title" placeholder="10자 이내로 제목을 작성해보세요" name="st_name">
			</div>
			<h3>배너이미지</h3>
			<div class="ns_banner_box">
				<input type="file" class="ns_banner" name="st_image">
			</div>
			<h3>태그</h3>
			<div class="ns_tag_box">
				<input type="text" class="ns_tag"
					placeholder="예시. 정처기, 모각코, 프로젝트 (태그명 최대 10자까지)" name="ta_name">
			</div>
			<h3>소개글</h3>
			<div class="ns_introduce_box">
				<input type="text" class="ns_introduce"
					placeholder="100자 이내로 스터디를 소개해보세요" name="st_info">
			</div>

			<div class="btn_box">
				<a>
					<button type="button" class="ts_study_btn">임시저장</button>
				</a>
				<button type="submit" class="make_study_btn">스터디 생성</button>
			</div>
		</form>
	</div>
</main>

<script>
	$(document).ready(function() {
		$('.yes_finish').click(function() {
			$('.datepicker').show();
			$('.yes_finish').css('background-color', '#66a0e2');
			$('.no_finish').css('background-color', '');
		});

		$('.no_finish').on('click', function() {
			$('.datepicker').hide();
			$('.no_finish').css('background-color', '#66a0e2');
			$('.yes_finish').css('background-color', '');
		});

	});
</script>