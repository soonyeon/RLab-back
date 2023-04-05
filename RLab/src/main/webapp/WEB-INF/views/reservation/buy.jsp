<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/ticket_buy.css'></c:url>" rel="stylesheet">
<!-- jQuery -->
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<!-- bootpay.js -->
<script src="https://js.bootpay.co.kr/bootpay-4.2.9.min.js" type="application/javascript"></script>
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
						<input type="button" value="결제하기" id="pay_btn">
					</div>
				</div>
			</form>
		</div>
	</div>
</main>

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
	finalPrice = totalPrice - $('[name=pa_used_point]').val();
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
<script><!-- 결제 -->
var today = new Date();   
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours +  minutes + seconds + milliseconds;

var items = [];
let finalName = '';
let finalPrice = 0;
function makeItemList(){
	for(i=0; i<ticketArr.length-1; i++){
		let id='';
		if(ticketArr[i].type==1)
			id = '1회 예약권';
		else if(ticketArr[i].type==2)
			id = '기간 이용권';
		else if(ticketArr[i].type==3)
			id = '시간 패키지';
		else
			id = '사물함 이용권';
		let item = {
			 "id": id,
		     "name": ticketArr[i].title,
		     "qty": ticketArr[i].count,
		     "price": ticketArr[i].price.replace(/,/g, "")
		}
		items.push(item);
	}
	if(ticketArr.length==1)
		finalName = ticketArr[0].title;
	else if(ticketArr.length > 1)
		finalName = ticketArr[0].title +'외 '+ticketArr.length-1+'건';
}

/* 결제 진행 */
$('#pay_btn').click(function(){
	makeItemList();
	console.log(finalPrice);
	console.log(items);
	try {
		const response = Bootpay.requestPayment({
	   		"application_id": "642d26f2755e27001dad6270",
	   		"price": finalPrice,
	   		"order_name": finalName,
	   		"order_id": "TEST_ORDER_ID",
	   		"pg": "이니시스",
	   		"method": "카드",
	   		"tax_free": 0,
	   		"user": {
	   		  "id": '${user.me_id}',
	   		  "email": '${user.me_email}'
	   		},
	   		"items": items,
	   		"extra": {
	   		  "open_type": "iframe",
	   		  "card_quota": "0,2,3",
	   		  "escrow": false
	   		}
	    })
	    switch (response.event) {
	        case 'issued':// 가상계좌 입금 완료 처리
	            break
	        case 'done':// 결제 완료 처리
	            //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하길 추천함!
				//location.replace("pay/confirm?receipt_id="+data.receipt_id);
	            console.log(response);
	            break
	        case 'confirm': //payload.extra.separately_confirmed = true; 일 경우 승인 전 해당 이벤트가 호출됨
	            console.log(response.receipt_id)
	            
	            /* 1. 클라이언트 승인을 하고자 할때
	             * // validationQuantityFromServer(); //예시) 재고확인과 같은 내부 로직을 처리하기 한다.
	             */
	            const confirmedData = Bootpay.confirm() //결제를 승인한다
	            if(confirmedData.event === 'done') {
	                //결제 성공
	            }
	            /* 2. 서버 승인을 하고자 할때
	             * // requestServerConfirm(); //예시) 서버 승인을 할 수 있도록  API를 호출한다. 서버에서는 재고확인과 로직 검증 후 서버승인을 요청한다.
	             * Bootpay.destroy(); //결제창을 닫는다.*/
	            break
	    }
	} catch (e) {// 결제 진행중 오류 발생
	    // e.error_code - 부트페이 오류 코드
	    // e.pg_error_code - PG 오류 코드
	    // e.message - 오류 내용
	    console.log(e.message)
	    switch (e.event) {
	        case 'cancel':// 사용자가 결제창을 닫을때 호출
	            console.log(e.message);
	    		//location.replace("pay/delete?id="+order.id); //DB값 삭제
	            break
	        case 'error':// 결제 승인 중 오류 발생시 호출
	            console.log(e.error_code);
	    		//location.replace("pay/delete?id="+order.id); //DB값 삭제
	            break
	    }
	}
	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	const response = BootPay.request({
		price: totalPrice,//실제 결제되는 가격
		application_id: "642d26f2755e27001dad6270",
		name : finalName, //결제창에서 보여질 이름
		pg: "이니시스",
		method: "card", //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작
		show_agree_window: 0, //부트페이 정보동의창 보이기 여부
		item: [
			{
				item_name: item.name, //상품명 ****
				qty: 1, //수량
				unique: item.id.toString(), //해당상품을 구분짓는 primary key
				price: item.price, //상품단가
			}
		],
		order_id: order.id, //고유 주문번호로, 생성한 값을 넣을 것
	}).error(function(data){
		//결제 진행 시 에러가 발생하면 수행
		console.log(data);
		location.replace("pay/delete?id="+order.id);//DB값 삭제
	}).ready(function(data){
		//가상계좌 입금 계좌번호가 발급되면 호출되는 함수
		console.log(data);
	}).confirm(function(data){
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어감
		//주의 - 카드 수기결제일 경우 이부분 실행되지 않음.
		console.log(data);
		var enable = true; //재고 수량 관리 로직 혹은 다른 처리
		if(enable){
			BootPay.transactionConfirm(data);//조건이 맞으면 승인처리함
		}else{
			BootPay.removePaymentWindow(); //조건이 맞지 않으면 결제창을 닫고 승인X
		}
	}).cancle(function(data){
		//결제가 취소되면 수행됨
		console.log(data);
		location.replace("pay/delete?id="+order.id); //DB값 삭제
	}).close(function(data){
		//결제창이 닫힐 때 수행됨(성공,실패,취소에 상관없이 모두 수행됨)
		console.log(data);
	}).done(function(data){
		//결제가 정상적으로 완료되면 수행됨
		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하길 추천함!
		location.replace("pay/confirm?receipt_id="+data.receipt_id);
		console.log(data);
	}); */
});
</script>