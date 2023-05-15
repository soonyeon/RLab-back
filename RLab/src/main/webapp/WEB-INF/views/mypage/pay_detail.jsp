<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/ticket_buy_complete.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<main>
	<div class="container">


		<div class="main_container">
			<!-- 좌석 선택 박스 -->
			<div class="main_content">
				<!-- 타이틀 영역-->
				<div class="title_area big_title">
					<h2>구매 상세내역</h2>
				</div>

				<!-- 예약정보 -->
				<div class="table_container">
					<div class="title_area">
						<h3>구매 정보</h3>
					</div>
					<table border="1">
						<tr>
							<th>구매번호</th>
							<td>${pay.pa_order_id}</td>
						</tr>
						<tr>
							<th>구매자 아이디</th>
							<td>${pay.pa_me_id}</td>
						</tr>
						<tr>
							<th>구매 일자</th>
							<td>${pay.pa_date_str}</td>
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
							<th>구매한 이용권</th>
							<td class="itemList">${itemList}</td>
						</tr>
					</table>
				</div>

					<!-- 결제 정보 -->
				<div class="table_container">
					<div class="title_area">
						<h3>결제 정보</h3>
					</div>
					<table border="1">
						<tr>
							<th>상품 금액</th>
							<td><span class="total_price">${pay.pa_amount+pay.pa_used_point}</span>원</td>
						</tr>
						<tr>
							<th>상품 할인금액</th>
							<td><span class="used_point">${pay.pa_used_point}</span>원</td>
						</tr>
						<tr>
							<th>결제 금액</th>
							<td><span class="final_price">${pay.pa_amount}</span>원</td>
						</tr>
						<tr>
							<th>적립금액</th>
							<td><span class="point">${pay.pa_point}</span>원</td>
						</tr>
					</table>
				</div>
					</table>
					<div class="return_box">
						<a href="<c:url value='/mypage/myres_pay'></c:url>"><button class="btn_r btn_return">돌아가기</button></a>
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