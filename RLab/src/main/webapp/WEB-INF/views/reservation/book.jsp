<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/book.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<main>
	<div class="procedure_container">
		<h1 class="procedure_title">바로예약</h1>
	</div>
	<div class="container">
		<!-- 버튼 섹션 -->
		<section>
			<div class="button_container">
				<ul class="list_button clearfix">
					<li class="item_button">
						<a href="<c:url value='/reservation/spot/1'></c:url>" class="link_button btn_seat add_shadow">
							<div class="icon_box">
								<span class="button_text">좌석</span>
								<i class="icon_seat"></i>
							</div>
						</a>
					</li>
					<li class="item_button">
						<a href="<c:url value='/reservation/spot/2'></c:url>" class="link_button btn_cabinet add_shadow">
							<div class="icon_box">
								<span class="button_text">사물함</span>
								<i class="icon_cabinet"></i>
							</div>
						</a>
					</li>
					<li class="item_button">
						<a href="<c:url value='/reservation/spot/3'></c:url>" class="link_button btn_room add_shadow ">
							<div class="icon_box">
								<span class="button_text">프로젝트룸</span>
								<i class="icon_room"></i>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</section>
	</div>
</main>