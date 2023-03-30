<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/book_seat_spot.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<main>
	<div class="container">
		<!-- 주문과정/절차 -->
		<div class="procedure_container clearfix">
			<h1 class="procedure_title">바로예약 [좌석]</h1>
			<ul class="detail_procedure">
				<li class="item_procedure  selected">
					<div class="numbering">01</div>
					<span class="item_text">지점 선택</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure">
					<div class="numbering">02</div>
					<span class="item_text">좌석,이용권 선택</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure">
					<div class="numbering">03</div>
					<span class="item_text">예약완료</span>
				</li>
			</ul>					
		</div>
		<div class="seat_container">
			<!-- 필터 섹션 -->
			<section>
				<div class="search_container">
					<div class="filter_area">
						<select class="choose_region">
							<option value="select_region" selected>지역 선택</option>
							<option value="seoul">서울특별시</option>
							<option value="incheon">인천광역시</option>
							<option value="daegu">대구광역시</option>
							<option value="daejeon">대전광역시</option>
							<option value="busan">부산광역시</option>
							<option value="gwangju">광주광역시</option>
							<option value="ulsan">울산광역시</option>
							<option value="gyeonggi">경기도</option>
							<option value="gangwon">강원도</option>
							<option value="gyeongbuk">경상북도</option>
							<option value="gyeongnam">경상남도</option>
							<option value="jeonbuk">전라북도</option>
							<option value="jeonnam">전라남도</option>
							<option value="chungbuk">충청북도</option>
							<option value="chungnam">충청남도</option>
							<option value="jeju">제주특별자치도</option>
							<option value="sejong">세종특별자치시</option>
						</select>
						<div class="search_box">
							<input type="search" class="search" placeholder="지역, 지점명으로 검색">
							<button class="btn_search"><i class="icon_search"></i></button>
						</div>
					</div>
					
			</section>
			<!-- 지점 카드 -->
			<section>
				<div class="spot_card_container">
					<ul class="list_card">
						<div class="row_card clearfix">
							<c:forEach items="${brList}" var="br">
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
							</c:forEach>
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
						</div>
						<div class="row_card clearfix">
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
						</div>
						<div class="row_card clearfix">
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
							<li class="item_card add_shadow">
								<a href="./book_seat_select.html">
									<div class="img-box"></div>
									<div class="info_area">
										<h2>[서울] 강남역점</h2>
										<span class="spot_address">서울특별시 강남구 테헤란로 10길 9,5층</span>
										<div class="info_running_time">
											<span>운영시간</span>
											<span class="hour">24시간</span>
											<span class="holiday">연중무휴</span>
										</div>
									</div>
								</a>
							</li>
						</div>
					</ul>
					<div class="page_box clearfix">
						<i class="btn_prev"></i>
						<span class="page_num selected_num">1</span>
						<span class="page_num">2</span>
						<span class="page_num">3</span>
						<span class="page_num">4</span>
						<span class="page_num">5</span>
						<i class="btn_next"></i>
					</div>
				</div>
			</section>
		</div>
		<div class="cabinet_container display_none">사물함 예약</div>
		<div class="room_container display_none">프로젝트룸 예약</div>
	</div>
</main>