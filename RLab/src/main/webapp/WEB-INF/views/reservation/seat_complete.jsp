<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/book_seat_complete.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<main>
	<div class="container">
		<!-- 주문과정/절차 -->
		<div class="procedure_container clearfix">
			<h1 class="procedure_title">바로예약 [좌석]</h1>
			<ul class="detail_procedure">
				<li class="item_procedure">
					<div class="numbering">01</div>
					<span class="item_text">지점 선택</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure">
					<div class="numbering">02</div>
					<span class="item_text">좌석,이용권 선택</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure  selected">
					<div class="numbering">03</div>
					<span class="item_text">예약완료</span>
				</li>
			</ul>					
		</div>


		<div class="main_container">
			<!-- 좌석 선택 박스 -->
			<div class="main_content">
				<!-- 타이틀 영역-->
				<div class="title_area big_title">
					<h2>예약 상세내역</h2>
				</div>

				<!-- 예약정보 -->
				<div class="table_container">
					<div class="title_area">
						<h3>예약 정보</h3>
					</div>
					<table border="1">
						<tr>
							<th>예약번호</th>
							<td>${rsv.re_num}</td>
						</tr>
						<tr>
							<th>예약자 아이디</th>
							<td>${user.me_id}</td>
						</tr>
						<tr>
							<th>예약등록 일자</th>
							<td>${rsv.re_register_date_str}</td>
						</tr>
					</table>
				</div>

				<!-- 좌석정보 -->
				<div class="table_container">
					<div class="title_area">
						<h3>좌석 정보</h3>
					</div>
					<table border="1">
						<tr>
							<th>카페 지점</th>
							<td>[${br.br_re_name}] ${br.br_name}</td>
						</tr>
						<tr>
							<th>좌석번호</th>
							<td>${rsv.se_name}번</td>
						</tr>
					</table>
				</div>

				<!-- 이용권 정보 -->
				<div class="table_container">
					<div class="title_area">
						<h3>이용권 정보</h3>
					</div>
					<table border="1">
						<tr>
							<th>사용한 이용권</th>
							<td>${ticketName}</td>
						</tr>
						<tr>
							<th>사용한 시간</th>
							<td>${rsv.re_hours}시간</td>
						</tr>
						<tr>
							<th>남은 시간</th>
							<td>${restTime}시간</td>
						</tr>
					</table>
				</div>

				<!-- 예약 시간 -->
				<div class="table_container">
					<div class="title_area">
						<h3>예약 시간</h3>
						<i class="icon_info info_seat"></i>
					</div>
					<table border="1">
						<tr>
							<th>시작시간</th>
							<td>${rsv.re_start_time_str}</td>
						</tr>
						<tr>
							<th>만료시간</th>
							<td>${rsv.re_valid_time_str}</td>
						</tr>
					</table>
				</div>
				<div class="return_box">
					<a href="<c:url value='/reservation'></c:url>"><button class="btn_return">돌아가기</button></a>
				</div>
		</div>
	</div>


</main>