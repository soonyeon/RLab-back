<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/ticket_buy.css'></c:url>" rel="stylesheet">
<!-- jQuery -->
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<!-- PortOne.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
			<form action="#" method="post">
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
							<div id="my_point"><span name="pa_point">${point}</span>pt</div>
							<input type="number" name="pa_used_point" class="use_point">
						</div>
						<div class="total_container">
							<p>최종 결제 금액</p> <div class="total_price" id="final_price"><span name="final_price">0</span>원</div>
						</div>
					</div>
					<!-- 결제하기 -->
					<div class="pay_area area">
						<input type="button" value="결제하기" id="pay_btn" onclick="requestPay()">
					</div>
				</div>
			</form>
		</div>
	</div>
</main>
<script><!-- 결제 -->
var IMP = window.IMP; // 생략 가능
IMP.init("imp07478433"); // "가맹점 식별코드" 예: imp00000000a

var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;

function requestPay() {
    IMP.request_pay({
      pg: "kcp.A52CY", //"kcp.{상점ID}"
      pay_method: "card",
      merchant_uid: "${user.me_id}"+makeMerchantUid,   // 주문번호
      name: "알랩 결제 테스트용",
      amount: 100,                         // 숫자 타입
      buyer_email: "kimsyty@naver.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
    }, function (rsp) { // callback
      if (rsp.success) {
        // 결제 성공 시 로직
        console.log(rsp);
      } else {
        // 결제 실패 시 로직
    	console.log(rsp);
      }
    });
  }

</script>
<script> <!-- 화면 구성 -->
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
			"num" : num,
			"count" : 1
	}
	console.log(ticketArr);
	addTicket(ticket);
	calcTotalPrice();
});

$(document).on('click','.btn-close', function(){
	let ticketNum = $(this).parent().parent().data('num');
	for(index in ticketArr){
		if(ticketArr[index].num == ticketNum){
			ticketArr.splice(index,1);
			ticketStrArr.splice(index,1);
			showTicketList();
			calcTotalPrice();
		}
	}
});

$(document).on('change','[name=ticket_count]',function(){
	let ticketNum = $(this).parent().parent().data('num');
	let count = $(this).val();
	for(index in ticketArr){
		if(ticketArr[index].num == ticketNum)
			ticketArr[index].count = count;
	}
	calcTotalPrice();
});

$('[name=pa_used_point]').change(function(){
	if($('[name=total_price]').text()=='0' && $('[name=pa_used_point]').val()>0){
		alert('결제 금액이 0원입니다.');
		return;
	}
	if($('[name=pa_used_point]').val() > ${point}){
		alert('사용가능한 포인트를 넘었습니다.');
		$('[name=pa_used_point]').val(${point});	
	}
	calcTotalPrice();
})


//최종 결제금액 구하기
function calcFinalPrice(totalPrice){
	let finalPrice = totalPrice - $('[name=pa_used_point]').val();
	$('[name=final_price]').text(finalPrice.toLocaleString());
}
//총 결제금액 구하기
function calcTotalPrice(){
	let total = 0;
	for(i=0;i<ticketArr.length;i++){
		let count = ticketArr[i].count;
		let perPrice = ticketArr[i].price.replace(/,/g, "");
		total +=  perPrice * (+count);
	}
	$('[name=total_price]').text(total.toLocaleString());
	calcFinalPrice(total);
	
	return;
}
//선택된 이용권 리스트 보여줌
function showTicketList(){
	let tmpStr = '';
	for(i=0;i<ticketStrArr.length;i++)
		tmpStr += ticketStrArr[i];
	$('.selected_tickets').html(tmpStr);
}
//이용권 선택 시 이용권 정보 및 쿼리 추가
function addTicket(ticket){
	for(index in ticketArr){
		if(ticketArr[index].num == ticket.num){
			alert('이미 선택한 이용권입니다.');
			return;
		}
	}
	let tmpStr = '';
	tmpStr +=
		'<div class="selected_ticket" data-num="'+ticket.num+'">'+
			'<div class="selected_title"><div class="dot"></div>'+ticket.type+' - '+ticket.title+
				'<button class="btn-close">x</button>'+
			'</div>'+
			'<div class="selected_content">'+
				'<div class="ticket_price">'+ticket.price+'원</div>'+
				'<input type="number" min="0" name="ticket_count" class="ticket_count" value='+ticket.count+'>'+
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