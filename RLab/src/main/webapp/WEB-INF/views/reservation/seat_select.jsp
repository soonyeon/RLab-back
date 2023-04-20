<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/book_seat_select.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<!-- 유효성 검사 validate -->
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
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
				<li class="item_procedure selected">
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


		<div class="main_container">
		<form action="<c:url value='/reservation/1/complete'></c:url>" method="post">
			<!-- 좌석 선택 박스 -->
			<div class="seat_container main_content">
				<!-- 타이틀 영역-->
				<div class="title_area">
					<i class="icon_seat"></i>
					<h2>좌석 선택</h2>
					<i class="icon_info info_seat"></i>
				</div>
				<!-- 좌석 선택 영역 -->
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
								<td class="seat">9</td>
								<td class="seat_unavailable">10</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="seat_selected">17</td>
								<td></td>
								<td class="seat_unavailable">23</td>
								<td class="seat">29</td>
								<td></td>
								<td></td>
								<td class="seat">35</td>
								<td class="seat">41</td>
								<td></td>
								<td class="seat_unavailable">49</td>
							</tr>
							<tr>
								<td class="seat">16</td>
								<td></td>
								<td class="seat_unavailable">22</td>
								<td class="seat_unavailable">28</td>
								<td></td>
								<td></td>
								<td class="seat_unavailable">34</td>
								<td class="seat">40</td>
								<td></td>
								<td class="seat">48</td>
							</tr>
							<tr>
								<td class="seat">15</td>
								<td></td>
								<td class="seat">21</td>
								<td class="seat">27</td>
								<td></td>
								<td></td>
								<td class="seat">33</td>
								<td class="seat_unavailable">39</td>
								<td></td>
								<td class="seat">47</td>
							</tr>
							<tr>
								<td class="seat">14</td>
								<td></td>
								<td class="seat">20</td>
								<td class="seat">26</td>
								<td></td>
								<td></td>
								<td class="seat">32</td>
								<td class="seat">38</td>
								<td></td>
								<td class="seat">46</td>
							</tr>
							<tr>
								<td class="seat">13</td>
								<td></td>
								<td class="seat">19</td>
								<td class="seat">25</td>
								<td></td>
								<td></td>
								<td class="seat">31</td>
								<td class="seat">37</td>
								<td></td>
								<td class="seat">45</td>
							</tr>
							<tr>
								<td class="seat">12</td>
								<td></td>
								<td class="seat">18</td>
								<td class="seat">24</td>
								<td></td>
								<td></td>
								<td class="seat">30</td>
								<td class="seat">36</td>
								<td></td>
								<td class="seat">44</td>
							</tr>
							<tr>
								<td class="seat">11</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td class="seat">43</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td class="seat">50</td>
								<td class="seat">51</td>
								<td class="seat">52</td>
								<td class="seat">53</td>
								<td class="seat">54</td>
								<td class="seat">55</td>
								<td></td>
								<td class="seat">42</td>
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
							<div class="info_selected info"></div><p>선택한 좌석</p>
						</div>
					</div>
				</div>
				<!-- 선택한 좌석번호 영역 -->
				<div class="seat_num_area">
					<h3>${br.br_name}<input type="hidden" name="br_num" value="${br_num}"></h3>
					<div class="seat_num_box">
						<div class="seat_num_title">선택한 좌석번호 :</div> <div id="seat_num"><input type="hidden" name="se_name" value="">17</div><div class="seat_num_title">번</div>
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
						<select id="ticket_select" name="re_to_num">
							<c:forEach items="${toList}" var="to">
								<option value="${to.to_num}" data-rest="${to.to_rest_time}">${to.tt_name}(${to.ti_name}) ~${to.to_valid_date_str}</option>
							</c:forEach>
						</select>
						<select class="time_select display_none" name="re_hours">
						
						</select>
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
						<div class="selected_ticket">
							<div class="selected_title">시간 패키지 (30시간)</div>
							<div class="selected_time">100시간 (남은 이용권 시간 : 29시간)</div>
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
	$('.seat_num_box').html('<div class="seat_num_title">선택한 좌석번호 :</div> <div id="seat_num"><input type="hidden" name="se_name" value="">'+seatNum+'</div><div class="seat_num_title">번</div>');
	$('input[name=se_name]').attr('value',seatNum);
})

$('.seat_selected').click(function(){
	seatInit();
})


/* 이용권 선택 관련 이벤트 */
let ticket = '';
let useTime;
let restTime;
let selectedStr = '';

showSelectedTicket('${toList.get(0).to_num}');

$('#ticket_select').change(function(){
	let re_to_num = $(this).val();
	showSelectedTicket(re_to_num);
});



$(function(){
	$('.time_select').change(function(){
		useTime = $(this).val();
		if(useTime>restTime){
			alert('사용가능한 이용권 잔여시간보다 더 많은 시간을 선택하였습니다.');
			$(this).val(1).prop("selected",true);
			useTime = 1;
		}
		selectedStr = 
			'<div class="selected_ticket">'
			+'<div class="selected_title">'+ticket+'</div>'
			+'<div class="selected_time">'+useTime+'시간 (남은 이용권 시간 : '+(restTime-useTime)+'시간)</div>'
			+'</div>';
		$('.selected_area').html(selectedStr);
	})
});

//좌석을 선택하지 않았을 때 폼 제출 방지
$(document).ready(function() {
    $('form').submit(function(event) {
        if ( seatNum == '') {
            event.preventDefault(); // 폼 제출 방지
            alert('좌석을 선택하세요.');
        }
    });
});
/*//예약하기
$('#book_btn').click(function(){
	let book = {
			're_me_id' : '${user.me_id}',
			're_to_num' : $('#ticket_select').val(),
			'br_num' : ${br_num},
			'se_name' : seatNum+'',
			're_hours' : useTime
	}
	//예약
	$.ajax({
		async:false,
		type: 'POST',
		data: JSON.stringify(book),
		url: '<c:url value="/reservation/1/${br_num}"></c:url>',
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
		}
	});
	//예약완료 페이지로 넘어가기
	$.ajax({
		async:false,
		type: 'POST',
		data: JSON.stringify(book),
		url: '<c:url value="/reservation/1/complete"></c:url>',
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
		}
	});
});*/


//선택된 이용권을 보여주는 함수
function showSelectedTicket(to_num){
	//가진 이용권이 없을 때 : toList==null 처리
	if(${toList==null})
		$('.ticket_area').html('<span>사용가능한 이용권이 없습니다. 이용권을 새로 구매해보세요.</span>');
	ticket = $('#ticket_select option:checked').text().split(' 이용권)')[0]+')';
	restTime = +$('#ticket_select option:checked').data('rest');
	
	let ticketName = $('#ticket_select option:checked').text().substr(0,6);
	if(ticketName=='시간 패키지'){
		//시간패키지인 경우 시간고르기
		$('.time_select').removeClass('display_none');
		$.ajax({
	        url: '<c:url value="/reservation/1/${br_num}"></c:url>',
	        type: 'POST',
	        data: JSON.stringify({
	            'to_num': to_num
	        }),
	        contentType: 'application/json',
	        dataType: 'json',
	        success: function(data) {
	        	let str ='';
	        	for(i=1; i<data+1; i++)
	        		str += '<option value="'+i+'">'+i+'시간</option>';
        		$('.time_select').html(str);
	        }
	    });
		//이용권 선택창 재구성
		selectedStr = 
		'<div class="selected_ticket">'
		+'<div class="selected_title">'+ticket+'</div>'
		+'<div class="selected_time">1시간 (남은 이용권 시간 : '+(restTime-1)+'시간)</div>'
		+'</div>';
	}else{
		$('.time_select').addClass('display_none');
		selectedStr = 
		'<div class="selected_ticket">'
		+'<div class="selected_title">'+ticket+'</div>'
		+'</div>';
	}
	$('.selected_area').html(selectedStr);
}

//좌석 상태를 초기화하는 함수
function seatInit(){
	$('.seat_table .seat_selected').removeClass('seat_selected').addClass('seat');
	$('.seat_num_box').html('<div class="seat_num_title">좌석을 선택하세요.</div>');
}
</script>