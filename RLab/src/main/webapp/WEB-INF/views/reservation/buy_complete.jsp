<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/ticket_buy_complete.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<main>
	<div class="container">
		<!-- 주문과정/절차 -->
		<div class="procedure_container clearfix">
			<h1 class="procedure_title">이용권 구매</h1>
			<ul class="detail_procedure">
				<li class="item_procedure">
					<div class="numbering">01</div>
					<span class="item_text">이용권 선택</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure">
					<div class="numbering">02</div>
					<span class="item_text">결제하기</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure selected">
					<div class="numbering">03</div>
					<span class="item_text">결제완료</span>
				</li>
			</ul>		
		</div>


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
							<td>230160</td>
						</tr>
						<tr>
							<th>구매자</th>
							<td>김돌탕</td>
						</tr>
						<tr>
							<th>구매 일자</th>
							<td>2023-03-23</td>
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
							<td>시간 패키지(30시간)</td>
						</tr>
					</table>
				</div>
				<div class="return_box">
					<a href="./reservation.html"><button class="btn_r btn_return">돌아가기</button></a>
					<a href="./book.html"><button class="btn_r btn_book">예약하기</button></a>
				</div>
			</div>
		</div>
	</div>
</main>