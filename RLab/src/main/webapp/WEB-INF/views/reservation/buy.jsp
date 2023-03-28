<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/ticket_buy.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<main>
	<div class="main_container">
		<!-- 주문과정/절차 -->
		<div class="procedure_container clearfix">
			<h1 class="procedure_title">이용권 구매</h1>
			<!-- <ul class="detail_procedure">
				<li class="item_procedure selected">
					<div class="numbering">01</div>
					<span class="item_text">이용권 구</span>
				</li>
				<li class="item_procedure">
					<div class="numbering">01</div>
					<span class="item_text">이용권 구</span>
				</li>
				<li class="item_procedure">
					<div class="numbering">01</div>
					<span class="item_text">이용권 구</span>
				</li>
				<li class="item_procedure">
					<div class="numbering">01</div>
					<span class="item_text">이용권 구</span>
				</li>
			</ul>					 -->
		</div>

		<div class="boxes_container">
			<!-- 이용권 종류 박스 -->
			<div class="ticket_box box">
				<div class="seat_area area">
					<div class="title">
						<i class="icon_seat"></i>
						<h2>좌석 이용권</h2>
						<i class="icon_info"></i>
					</div>
					<div class="tickets">
						<div class="ticket">
							<div class="ticket_title">1회 이용권</div>
							<div class="times">
								<div class="ticket_time" data-num="1">
									<span class="title">2시간</span> 
									(<span class="price">10,000</span>원)
								</div>
								<div class="ticket_time" data-num="2">
									<span class="title">3시간</span>
									(<span class="price">15,000</span>원)
								</div>
								<div class="ticket_time" data-num="3">
									<span class="title">6시간</span>
									(<span class="price">30,000</span>원)
								</div>
							</div>
						</div>
						<div class="ticket">
							<div class="ticket_title">기간 이용권</div>
							<div class="times">
								<div class="ticket_time" data-num="4">
									<span class="title">2주</span>
									(<span class="price">100,000</span>원)
								</div>
								<div class="ticket_time" data-num="5">
									<span class="title">4주</span>
									(<span class="price">200,000</span>원)
								</div>
							</div>
						</div>
						<div class="ticket">
							<div class="ticket_title">시간 패키지</div>
							<div class="times">
								<div class="ticket_time" data-num="6">
									<span class="title">30시간</span>
									(<span class="price">150,000</span>원)
								</div>
								<div class="ticket_time" data-num="7">
									<span class="title">50시간</span>
									(<span class="price">250,000</span>원)
								</div>
								<div class="ticket_time" data-num="8">
									<span class="title">100시간</span>
									(<span class="price">500,000</span>원)
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="locker_area area">
					<div class="title">
						<i class="icon_locker"></i>
						<h2>사물함 이용권</h2>
					</div>
					<div class="times">
						<div class="ticket_time" data-num="9">
							<span class="title">2주</span>
							(<span class="price">100,000</span>원)
						</div>
						<div class="ticket_time" data-num="10">
							<span class="title">4주</span>
							(<span class="price">200,000</span>원)
						</div>
					</div>
				</div>
			</div>
			<!-- 선택한 이용권 박스 -->
			<div class="selected_box box">
				<!-- 선택한 이용권 -->
				<div class="selected_area area">
					<h2>선택한 이용권</h2>
					<div class="selected_tickets">
						<div class="selected_ticket">
							<div class="selected_title"><div class="dot"></div> 당일 이용권 - 2시간</div>
							<div class="selected_content">
								<div class="ticket_price">10,000원</div>
								<input type="number" name="" class="ticket_count">
							</div>
						</div>
					</div>
					<div class="total_container">
						<p>총 결제 금액</p> <div class="total_price"><span name="total_price">0</span>원</div>
					</div>
				</div>
				<!-- 포인트 -->
				<div class="point_area area">
					<div class="title">
						<i class="icon_point"></i>
						<h2>포인트</h2>
						<i class="icon_info"></i>
					</div>					
					<div class="point_container">
						<div class="point_title">보유 포인트</div> 
						<div id="my_point"><span name="my_point">1300<span>pt</div>
						<input type="number" name="" class="use_point">
					</div>
					<div class="total_container">
						<p>최종 결제 금액</p> <div class="total_price" id="final_price">20,000원</div>
					</div>
				</div>
				<!-- 결제하기 -->
				<div class="pay_area area">
					<input type="submit" value="결제하기" id="pay_btn">
				</div>
			</div>

		</div>
	</div>
</main>
<script>
let ticketStrArr = [];
let ticketArr = [];
let totalPrice = 0;

showTicketList();

$('.ticket_time').click(function(){
	let type = $(this).parent().siblings('.ticket_title').text();
	type = type!='' ? type : '사물함 이용권';
	let title = $(this).find('.title').text();
	let price = $(this).find('.price').text();
	let num = $(this).data('num');
	let ticket = {
			"type" : type,
			"title" : title,
			"price" : price,
			"num" : num
	}
	console.log(ticketArr);
	addTicket(ticket);
	$('[name=total_price]').text(calcTotalPrice().toLocaleString());
});
function calcTotalPrice(){
	let total = 0;
	for(i=0;i<ticketArr.length;i++){
		let count = $('.selected_ticket .ticket_count').val();
		let perPrice = ticketArr[i].price.replace(/,/g, "");
		total +=  perPrice * (+count);
	}
	return total;
}
function showTicketList(){
	let tmpStr = '';
	for(i=0;i<ticketStrArr.length;i++)
		tmpStr += ticketStrArr[i];
	$('.selected_tickets').html(tmpStr);
}

function addTicket(ticket){
	for(index in ticketArr){
		if(ticketArr[index].num == ticket.num){
			alert('이미 선택한 이용권입니다.');
			return;
		}
	}
	let tmpStr = '';
	tmpStr +=
		'<div class="selected_ticket">'+
			'<div class="selected_title"><div class="dot"></div> '+ticket.type+' - '+ticket.title+'</div>'+
			'<div class="selected_content">'+
				'<div class="ticket_price">'+ticket.price+'원</div>'+
				'<input type="number" name="" class="ticket_count" value="1">'+
			'</div>'+
		'</div>';
	
	if(ticketArr.length==0){
		ticketArr.push(ticket);
		ticketStrArr.push(tmpStr);
		showTicketList();
		return;		
	}
	for(index in ticketArr){
		if(ticketArr[index].num > ticket.num){
			ticketArr.splice(index, 0, ticket);
			ticketStrArr.splice(index, 0, tmpStr);
			break;
		}
		if(index == ticketArr.length-1){
			ticketArr.push(ticket);
			ticketStrArr.push(tmpStr);
		}
	}
	showTicketList();
	return;
}
</script>