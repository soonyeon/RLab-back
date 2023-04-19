<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/basic.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<main>
	<div class="container">
		<!-- 이용권/예약 선택 박스 -->
		<div class="inner_container">
			<div class="info_box">모든 이용권은 이용권 구매 후 이용가능합니다.</div>
			<div class="button_container">
				<a href="<c:url value='/reservation/buy'></c:url>" class="ticket_box">
					<div class="around_text">이용권 구매</div>
					<div class="info_area">당일이용권(2/3/6시간)<br>기간이용권(2주/4주)<br>시간패키지(30/50/100시간)</div>							
				</a>
				<a href="<c:url value='/reservation/book'></c:url>" class="reservation_box">
					<div class="around_text">바로 예약</div>
					<div class="info_area">구매한 이용권을 이용하여<br>바로 예약을 진행할 수 있습니다.</div>
				</a>
			</div>
		</div>
	</div>
</main>