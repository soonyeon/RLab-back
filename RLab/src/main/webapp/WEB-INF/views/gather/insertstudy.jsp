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
		<form id="rc_new_box">
			<div class="top_box">
				<div class="ns_region_box">
					<h3>지역</h3>
					<select id="choose_region">
						<option value="1">서울 특별시</option>
						<option value="2">부산 광역시</option>
						<option value="3">경기도</option>
						<option value="4">인천 광역시</option>
						<option value="5">대구 광역시</option>
						<option value="6">경상북도</option>
						<option value="7">경상남도</option>
						<option value="8">대전 광역시</option>
						<option value="9">전라북도</option>
						<option value="10">전라남도</option>
						<option value="11">충청북도</option>
						<option value="12">충청남도</option>
						<option value="13">광주 광역시</option>
						<option value="14">강원도</option>
						<option value="15">울산 광역시</option>
						<option value="16">제주 특별 자치도</option>
						<option value="17">세종 특별 자치도</option>
					</select>
				</div>
				<div class="ns_people_box">
					<h3>인원</h3>
					<input type="number" class="ns_people" placeholder="최대50명">
				</div>
				<div class="ns_finish_date_box">
					<h3>완료날짜</h3>
					<li class="yes_finish">적용</li>
					<li class="no_finish">미적용</li> <input type="date"
						class="datepicker">
				</div>
			</div>
			<h3>스터디명</h3>
			<div class="ns_title_box">
				<input type="text" class="ns_title" placeholder="10자 이내로 제목을 작성해보세요">
			</div>
			<h3>배너이미지</h3>
			<div class="ns_banner_box">
				<input type="file" class="ns_banner">
			</div>
			<h3>태그</h3>
			<div class="ns_tag_box">
				<input type="text" class="ns_tag"
					placeholder="예시. #정처기, #모각코, #프로젝트 (태그명 최대 10자까지)">
			</div>
			<h3>소개글</h3>
			<div class="ns_introduce_box">
				<input type="text" class="ns_introduce"
					placeholder="100자 이내로 스터디를 소개해보세요">
			</div>
		</form>
		<div class="btn_box">
			<button class="ts_study_btn">임시저장</button>
			<button class="make_study_btn">스터디 생성</button>
		</div>
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