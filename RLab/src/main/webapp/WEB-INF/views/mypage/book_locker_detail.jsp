<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/book_seat_complete.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<main>
	<div class="container">
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
						<h3>예약 정보</h3>
					</div>
					<table border="1">
						<tr>
							<th>카페 지점</th>
							<td>[${br.br_re_name}] ${br.br_name}</td>
						</tr>
						<tr>
							<th>사물함 번호</th>
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
						<a href="<c:url value='/mypage/myres_book'></c:url>"><button class="btn_r btn_return">돌아가기</button></a>
					</div>
				</div>
		</div>
	</div>
</main>
<script>
putNumberComma();

//숫자를 천단위로 ,(콤마) 찍어주는 함수
function putNumberComma(){
	let total_price = ${pay.pa_amount+pay.pa_used_point};
	$('.total_price').text(total_price.toLocaleString());
	let used_point = ${pay.pa_used_point};
	$('.used_point').text(used_point.toLocaleString());
	let final_price = ${pay.pa_amount};
	$('.final_price').text(final_price.toLocaleString());
	let point = ${pay.pa_point};
	$('.point').text(point.toLocaleString());
}
</script>