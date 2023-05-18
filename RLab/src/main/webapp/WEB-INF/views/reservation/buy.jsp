<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/ticket_buy.css'></c:url>" rel="stylesheet">
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
									(<span class="price">50</span>원)
								</div>
								<div class="ticket_time" data-num="2">
									<span class="title">3시간</span>
									(<span class="price">70</span>원)
								</div>
								<div class="ticket_time" data-num="3">
									<span class="title">6시간</span>
									(<span class="price">100</span>원)
								</div>
							</div>
						</div>
						<div class="ticket">
							<div class="ticket_title">기간 이용권</div>
							<div class="times">
								<div class="ticket_time" data-num="4">
									<span class="title">2주</span>
									(<span class="price">80</span>원)
								</div>
								<div class="ticket_time" data-num="5">
									<span class="title">4주</span>
									(<span class="price">90</span>원)
								</div>
							</div>
						</div>
						<div class="ticket">
							<div class="ticket_title">시간 패키지</div>
							<div class="times">
								<div class="ticket_time" data-num="6">
									<span class="title">30시간</span>
									(<span class="price">110</span>원)
								</div>
								<div class="ticket_time" data-num="7">
									<span class="title">50시간</span>
									(<span class="price">120</span>원)
								</div>
								<div class="ticket_time" data-num="8">
									<span class="title">100시간</span>
									(<span class="price">130</span>원)
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
							(<span class="price">140</span>원)
						</div>
						<div class="ticket_time" data-num="10">
							<span class="title">4주</span>
							(<span class="price">150</span>원)
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
			<!-- </form> -->
		</div>
	</div>
</main>

<script> <!-- 화면 구성 -->
let ticketStrArr = []; //화면 출력용 html코드 배열
let ticketArr = []; //결제용 PayDetailVO 배열
let totalPrice = 0;

showTicketList();

//선택한 티켓정보를 티켓 배열에 추가
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
// x누르면 티켓 삭제
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
//티켓 장수 바꾸면 반영
$(document).on('change','[name=ticket_count]',function(){
	let ticketNum = $(this).parent().parent().data('num');
	let count = +$(this).val();
	for(index in ticketArr){
		if(ticketArr[index].num == ticketNum)
			ticketArr[index].count = count;
	}
	calcTotalPrice();
});
//사용할 포인트 입력 이벤트
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

/****************************************************/
//최종 결제금액 구하는 함수
function calcFinalPrice(totalPrice){
	finalPrice = totalPrice - $('[name=pa_used_point]').val();
	$('[name=final_price]').text(finalPrice.toLocaleString());
}
//총 결제금액 구하는 함수
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
//선택된 이용권 리스트를 html에 반영하는 함수
function showTicketList(){
	let tmpStr = '';
	for(i=0;i<ticketStrArr.length;i++)
		tmpStr += ticketStrArr[i];
	$('.selected_tickets').html(tmpStr);
}
//선택된 이용권 정보를 코드와 결제 정보에 추가하는 함수
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
	// 첫 등록때는 정렬할 필요 없이 등록
	if(ticketArr.length==0){ 
		ticketArr.push(ticket);
		ticketStrArr.push(tmpStr);
		showTicketList();
		return;		
	}
	// 티켓 번호 순으로 정렬되도록 알맞은 자리에 등록
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
var makeMerchantUid = '${user.me_id}' + hours +  minutes + seconds + milliseconds; // 주문번호 생성

var items = [];
let finalName = '';
var finalPrice = 0;

let itemsForDb = [];
let usedPoint = +$('[name=pa_used_point]').val();

// 선택된 이용권 배열을 이용해 결제api 양식에 맞춰 items배열 생성하는 함수
function makeItemList(){
	items = [];
	for(i=0; i<ticketArr.length; i++){
		let item = {
			 "id": ticketArr[i].num,
		     "name": ticketArr[i].type +' - ' + ticketArr[i].title,
		     "qty": ticketArr[i].count,
		     "price": ticketArr[i].price.replace(/,/g, "")
		}
		items.push(item);
	}
	// 이용권이 2개 이상일 경우 결재내용을 '~외 n건'으로 설정
	if(items.length==1)
		finalName = items[0].name;
	else if(items.length > 1)
		finalName = items[0].name +' 외 '+ (items.length-1) +'건';
}
// db에 저장하기 위해 items배열의 값들을 VO필드명에 맞춰서 배열 생성
function makeItemVoList(){
	itemsForDb = [];
	for(i in items){
		let a = {
			"pd_ti_num": items[i].id,
			"pd_amount": items[i].qty,
			"pd_price": items[i].price
		}
		itemsForDb.push(a);
	}
}

let response ;
/* 결제 진행 */
$('#pay_btn').click(function(){
	makeItemList();//주문용 리스트 생성
	makeItemVoList();//DB전달용 VO리스트 생성
	console.log(itemsForDb);
	let payDto = {
			pa_order_id: makeMerchantUid,
			pa_me_id: "${user.me_id}",
			pa_amount: finalPrice,
			pa_order_name: finalName,
			pa_point: parseInt(finalPrice*0.01),
			pa_used_point: +$('[name=pa_used_point]').val(),
			itemList: itemsForDb			
	}
	console.log(payDto);
	//ajax로 어씽크false로 해서 DB에 등록하기
	$.ajax({
        async:false,
        type: 'POST',
        data: JSON.stringify(payDto),
        url: '<c:url value="/reservation/buy"></c:url>',
        dataType:"json", //success에 있는 data타입(주는거)
        contentType:"application/json; charset=UTF-8", //위에있는 data타입(받는거)
        success : function(data){
        	console.log('사전데이터 DB저장완료')
        }
	});
	try {
		response = Bootpay.requestPayment({ //아래 정보를 가지고 결제를 진행함
	   		"application_id": "642d26f2755e27001dad6270",
	   		"price": finalPrice,
	   		"order_name": finalName,
	   		"order_id": makeMerchantUid,
	   		"pg": "이니시스",
	   		"method": "카드",
	   		"tax_free": 0,
	   		"user": {
	   		  "id": '${user.me_id}',
	   		  "email": '${user.me_email}'
	   		},
	   		"extra": {
	   		  "open_type": "iframe",
	   		  "card_quota": "0,2,3",
	   		  "escrow": false
	   		}
	    }).then((response)=>{ //결제를 진행한 이후 return값(성공/에러/취소 등)에 따른 처리
	    	console.log(response);
			switch (response.event) {
		        case 'issued':// 가상계좌 입금 완료 처리
		            break
		        case 'done':// 결제 완료 처리
		            //(비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하길 추천함!)
		            console.log('결제완료');
		        	//결제과정은 DB와 별도로 진행되기때문에 진행된 결제의 고유 영수증번호(receipt_id)를 통해 해당 데이터를 가져와야함->그걸 링크로 보냄
					location.replace('<c:url value="/receipt/'+response.data.receipt_id+'"></c:url>');
		            break;
		        case 'confirm': //payload.extra.separately_confirmed = true; 일 경우 승인 전 해당 이벤트가 호출됨
		            console.log(response.receipt_id)
		        	console.log(response);
		            //1. 클라이언트 승인을 하고자 할때
		            // validationQuantityFromServer(); //예시) 재고확인과 같은 내부 로직을 처리하기 한다.
		            const confirmedData = Bootpay.confirm() //결제를 승인한다
		            if(confirmedData.event === 'done') {
		                //결제 성공
		            }
		            /* 2. 서버 승인을 하고자 할때
		             * // requestServerConfirm(); //예시) 서버 승인을 할 수 있도록  API를 호출한다. 서버에서는 재고확인과 로직 검증 후 서버승인을 요청한다.
		             * Bootpay.destroy(); //결제창을 닫는다.*/
		            break;
		    }
	    }).catch(function(e){
	    	console.log(e.message);
	    	switch (e.event) {
	        case 'cancel':// 사용자가 결제창을 닫을때 호출
	            console.log(e.message);
				console.log('취소');
	        	let canceledData = {
	        			pa_order_id : makeMerchantUid
	        	};
	        	//결제 취소할 경우 앞에서 DB에 등록했던거 다시 삭제
	        	$.ajax({
	                async:false,
	                type: 'POST',
	                data: JSON.stringify(canceledData),
	                url: '<c:url value="/cancel"></c:url>',
	                dataType:"json", 
	                contentType:"application/json; charset=UTF-8", 
	                success : function(data){
	                	console.log('사전데이터 DB삭제완료');
	                }
	        	});
	            break
	        case 'error':// 결제 승인 중 오류 발생시 호출
	            console.log(e.error_code);
				console.log('에러');
	        	$.ajax({
	                async:false,
	                type: 'POST',
	                data: JSON.stringify(canceledData),
	                url: '<c:url value="/cancel"></c:url>',
	                dataType:"json",
	                contentType:"application/json; charset=UTF-8",
	                success : function(data){
	                	console.log('사전데이터 DB삭제완료');
	                }
	        	});
	            break
	    	}
	    })
	} catch(e) {// 결제 진행중 오류 발생
	    // e.error_code - 부트페이 오류 코드
	    // e.pg_error_code - PG 오류 코드
	    // e.message - 오류 내용
	    console.log(e.message);
      	console.log(1);
	    switch (e.event) {
	        case 'cancel':// 사용자가 결제창을 닫을때 호출
	            console.log(e.message);
	            break
	        case 'error':// 결제 승인 중 오류 발생시 호출
	            console.log(e.error_code);
	            break
	    }
	}
});
</script>