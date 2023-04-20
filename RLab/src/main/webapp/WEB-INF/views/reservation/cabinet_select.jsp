<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/book_cabinet_select.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<main>
	<div class="container">
		<!-- 주문과정/절차 -->
		<div class="procedure_container clearfix">
			<h1 class="procedure_title">바로예약 [사물함]</h1>
			<ul class="detail_procedure">
				<li class="item_procedure">
					<div class="numbering">01</div>
					<span class="item_text">지점 선택</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure selected">
					<div class="numbering">02</div>
					<span class="item_text">사물함,이용권 선택</span>
				</li>
				<i class="icon_next"></i>
				<li class="item_procedure">
					<div class="numbering">03</div>
					<span class="item_text">예약완료</span>
				</li>
			</ul>					
		</div>


		<div class="main_container">
		<form action="<c:url value='/reservation/2/book'></c:url>" method="post">
			<!-- 사물함 선택 박스 -->
			<div class="seat_container main_content">
				<!-- 타이틀 영역-->
				<div class="title_area">
					<i class="icon_locker"></i>
					<h2>사물함 선택</h2>
					<i class="icon_info info_seat"></i>
				</div>
				<!-- 사물함 선택 영역 -->
				<div class="seat_area">
					<div class="seat_table">
						<table>
							<tr class="row_1">
								<td class="seat_unavailable">1</td>
								<td class="seat_unavailable">2</td>
								<td class="seat_unavailable">3</td>
								<td class="seat_unavailable">4</td>
								<td class="seat">5</td>
								<td class="seat">6</td>
								<td class="seat">7</td>
								<td class="seat">8</td>
							</tr>
							<tr>
								<td class="seat">9</td>
								<td class="seat">10</td>
								<td class="seat">11</td>
								<td class="seat">12</td>
								<td class="seat">13</td>
								<td class="seat">14</td>
								<td class="seat">15</td>
								<td class="seat">16</td>

							</tr>
							<tr>
								<td class="seat">17</td>
								<td class="seat">18</td>
								<td class="seat_unavailable">19</td>
								<td class="seat_selected">20</td>
								<td class="seat">21</td>
								<td class="seat">22</td>
								<td class="seat">23</td>
								<td class="seat">24</td>
							</tr>
							<tr>
								<td class="seat">25</td>
								<td class="seat_unavailable">26</td>
								<td class="seat_unavailable">27</td>
								<td class="seat">28</td>
								<td class="seat">29</td>
								<td class="seat_unavailable">30</td>
								<td class="seat">31</td>
								<td class="seat">32</td>
							</tr>
							<tr>
								<td class="seat">33</td>
								<td class="seat">34</td>
								<td class="seat">35</td>
								<td class="seat">36</td>
								<td class="seat">37</td>
								<td class="seat">38</td>
								<td class="seat_unavailable">39</td>
								<td class="seat">40</td>
							</tr>
							<tr>
								<td class="seat">41</td>
								<td class="seat">42</td>
								<td class="seat">43</td>
								<td class="seat">44</td>
								<td class="seat">45</td>
								<td class="seat">46</td>
								<td class="seat">47</td>
								<td class="seat">48</td>
							</tr>
							<tr>
								<td class="seat">49</td>
								<td class="seat">50</td>
								<td class="seat">51</td>
								<td class="seat">52</td>
								<td class="seat">53</td>
								<td class="seat">54</td>
								<td class="seat">55</td>
								<td class="seat">56</td>
							</tr>
						</table>
					</div>
					<div class="seat_info">
						<div class="seat_info_box">
							<div class="info_unavailable info"></div><p>예약불가</p>
						</div>
						<div class="seat_info_box">
							<div class="info_available info"></div><p>예약가능</p>
						</div>
						<div class="seat_info_box">
							<div class="info_selected info"></div><p>선택한 사물함</p>
						</div>
					</div>
				</div>
				
				<!-- 선택한 사물함 번호 영역 -->
				<div class="seat_num_area">
					<h3>[${br.br_re_name}] ${br.br_name}<input type="hidden" name="br_num" value="${br_num}"></h3>
					<div class="seat_num_box">
						<div class="seat_num_title">선택한 사물함 번호 :</div> <div id="seat_num"><input type="hidden" name="se_name" value="">17</div><div class="seat_num_title">번</div>
					</div>
				</div>
			</div>
			<!-- 이용권 선택 박스 -->
			<div class="ticket_container main_content">
				
					<!-- 타이틀 영역 -->
					<div class="title_area">
						<h2>이용권 선택</h2>
						<i class="icon_info info_ticket"></i>
					</div>
					<!-- 이용권 고르기 영역 -->
					<div class="ticket_area">
						<c:if test="${toList == null}">
							<div class="no_ticket">이용권이 없습니다.<br>이용권 구매 후 이용해주세요.</div>
						</c:if>
						<c:if test="${toList != null}">
							<select id="ticket_select" name="re_to_num">
								<c:forEach items="${toList}" var="to">
									<option value="${to.to_num}">${to.tt_name}(${to.ti_name}) ~${to.to_valid_date_str}</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
					
					<!-- 선택한 이용권, 시간 영역 -->
					<div class="title_area">
						<h2>선택한 이용권</h2>
						<i class="icon_info info_ticket"></i>
					</div>
					<div class="selected_area">
						<div class="selected_ticket display_none">
							<div class="selected_title">1회 이용권 (2시간)</div>
						</div>
					</div>
					<!-- 이용권 구매, 예약하기 버튼 영역 -->
					<div class="btn_area area">
						<a href="<c:url value='/reservation/buy'></c:url>" class="b_btn"  id="buy_btn"><input type="button" value="이용권 구매"></a>
						<button class="b_btn" id="book_btn"><input type="submit" value="예약하기" ></button>
					</div>
			</div>
		</div>
	</div>
	</form>
</main>
<script>
/* 좌석 선택 관련 이벤트 */
let seatNum = '';
seatInit();
$('.seat').click(function(){
	seatNum = $(this).text();
	$('.seat_table .seat_selected').removeClass('seat_selected').addClass('seat');
	$(this).removeClass('seat').addClass('seat_selected');
	$('.seat_num_box').html('<div class="seat_num_title">선택한 사물함 번호 :</div> <div id="seat_num"><input type="hidden" name="se_name" value="">'+seatNum+'</div><div class="seat_num_title">번</div>');
	$('input[name=se_name]').attr('value',seatNum);
})

$('.seat_selected').click(function(){
	seatInit();
})


/* 이용권 선택 관련 이벤트 */
let ticket = '';
let selectedStr = '';


showSelectedTicket();


$('#ticket_select').change(function(){
	let re_to_num = $(this).val();
	showSelectedTicket(re_to_num);
});


//좌석을 선택하지 않았을 때 폼 제출 방지
$(document).ready(function() {
    $('form').submit(function(event) {
        if ( seatNum == '') {
            event.preventDefault(); // 폼 제출 방지
            alert('사물함을 선택하세요.');
        }
    	if( ${toList.size() == 0}){
    		event.preventDefault();
    		alert('등록된 이용권이 없을 경우, 이용권 구매를 먼저 진행하세요.');
    	}
    });
});


//선택된 이용권을 보여주는 함수
function showSelectedTicket(){
	if(${toList.size() == 0}){ //가진 이용권이 없을 때
		$('.ticket_area').html('<div class="no_ticket">사용가능한 이용권이 없습니다. 이용권을 새로 구매해보세요.</div>');
		$('.selected_area').html(selectedStr);
		return;		
	}else{
		ticket = $('#ticket_select option:checked').text().split(' 사용권)')[0]+')';
		
		selectedStr = 
		'<div class="selected_ticket">'
		+'<div class="selected_title">'+ticket+'</div>'
		+'</div>';
		
		$('.selected_area').html(selectedStr);
	}
	
}

//사물함 상태를 초기화하는 함수
function seatInit(){
	$('.seat_table .seat_selected').removeClass('seat_selected').addClass('seat');
	$('.seat_num_box').html('<div class="seat_num_title">사물함을 선택하세요.</div>');
}
</script>