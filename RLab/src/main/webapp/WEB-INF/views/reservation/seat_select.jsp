<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/reservation/book_seat_select.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
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
					<h3>${br.br_name}</h3>
					<div class="seat_num_box">
						<div class="seat_num_title">선택한 좌석번호 :</div> <div id="seat_num">17</div><div class="seat_num_title">번</div>
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
						<select id="ticket_select">
							<c:forEach items="${toList}" var="to">
								<option value="${to.to_num}">${to.tt_name}(${to.ti_name}) ~${to.to_valid_date_str}</option>
							</c:forEach>
						</select>
						<select class="time_select time_30 display_none">
							<option value="hour_1">1시간</option>
							<option value="hour_2">2시간</option>
							<option value="hour_3">3시간</option>
							<option value="hour_4">4시간</option>
							<option value="hour_5">5시간</option>
							<option value="hour_6">6시간</option>
							<option value="hour_7">7시간</option>
							<option value="hour_8">8시간</option>
							<option value="hour_9">9시간</option>
							<option value="hour_10">10시간</option>
							<option value="hour_11">11시간</option>
							<option value="hour_12">12시간</option>
							<option value="hour_13">13시간</option>
							<option value="hour_14">14시간</option>
							<option value="hour_15">15시간</option>
							<option value="hour_16">16시간</option>
							<option value="hour_17">17시간</option>
							<option value="hour_18">18시간</option>
							<option value="hour_19">19시간</option>
							<option value="hour_20">20시간</option>
							<option value="hour_21">21시간</option>
							<option value="hour_22">22시간</option>
							<option value="hour_23">23시간</option>
							<option value="hour_24">24시간</option>
							<option value="hour_25">25시간</option>
							<option value="hour_26">26시간</option>
							<option value="hour_27">27시간</option>
							<option value="hour_28">28시간</option>
							<option value="hour_29">29시간</option>
							<option value="hour_30">30시간</option>
						</select>
						<select class="time_select time_50 display_none">
							<option value="hour_1">1시간</option>
							<option value="hour_2">2시간</option>
							<option value="hour_3">3시간</option>
							<option value="hour_4">4시간</option>
							<option value="hour_5">5시간</option>
							<option value="hour_6">6시간</option>
							<option value="hour_7">7시간</option>
							<option value="hour_8">8시간</option>
							<option value="hour_9">9시간</option>
							<option value="hour_10">10시간</option>
							<option value="hour_11">11시간</option>
							<option value="hour_12">12시간</option>
							<option value="hour_13">13시간</option>
							<option value="hour_14">14시간</option>
							<option value="hour_15">15시간</option>
							<option value="hour_16">16시간</option>
							<option value="hour_17">17시간</option>
							<option value="hour_18">18시간</option>
							<option value="hour_19">19시간</option>
							<option value="hour_20">20시간</option>
							<option value="hour_21">21시간</option>
							<option value="hour_22">22시간</option>
							<option value="hour_23">23시간</option>
							<option value="hour_24">24시간</option>
							<option value="hour_25">25시간</option>
							<option value="hour_26">26시간</option>
							<option value="hour_27">27시간</option>
							<option value="hour_28">28시간</option>
							<option value="hour_29">29시간</option>
							<option value="hour_30">30시간</option>
							<option value="hour_31">31시간</option>
							<option value="hour_32">32시간</option>
							<option value="hour_33">33시간</option>
							<option value="hour_34">34시간</option>
							<option value="hour_35">35시간</option>
							<option value="hour_36">36시간</option>
							<option value="hour_37">37시간</option>
							<option value="hour_38">38시간</option>
							<option value="hour_39">39시간</option>
							<option value="hour_40">40시간</option>
							<option value="hour_41">41시간</option>
							<option value="hour_42">42시간</option>
							<option value="hour_43">43시간</option>
							<option value="hour_44">44시간</option>
							<option value="hour_45">45시간</option>
							<option value="hour_46">46시간</option>
							<option value="hour_47">47시간</option>
							<option value="hour_48">48시간</option>
							<option value="hour_49">49시간</option>
							<option value="hour_50">50시간</option>
						</select>
						<select class="time_select time_100 display_none">
							<option value="hour_1">1시간</option>
							<option value="hour_2">2시간</option>
							<option value="hour_3">3시간</option>
							<option value="hour_4">4시간</option>
							<option value="hour_5">5시간</option>
							<option value="hour_6">6시간</option>
							<option value="hour_7">7시간</option>
							<option value="hour_8">8시간</option>
							<option value="hour_9">9시간</option>
							<option value="hour_10">10시간</option>
							<option value="hour_11">11시간</option>
							<option value="hour_12">12시간</option>
							<option value="hour_13">13시간</option>
							<option value="hour_14">14시간</option>
							<option value="hour_15">15시간</option>
							<option value="hour_16">16시간</option>
							<option value="hour_17">17시간</option>
							<option value="hour_18">18시간</option>
							<option value="hour_19">19시간</option>
							<option value="hour_20">20시간</option>
							<option value="hour_21">21시간</option>
							<option value="hour_22">22시간</option>
							<option value="hour_23">23시간</option>
							<option value="hour_24">24시간</option>
							<option value="hour_25">25시간</option>
							<option value="hour_26">26시간</option>
							<option value="hour_27">27시간</option>
							<option value="hour_28">28시간</option>
							<option value="hour_29">29시간</option>
							<option value="hour_30">30시간</option>
							<option value="hour_31">31시간</option>
							<option value="hour_32">32시간</option>
							<option value="hour_33">33시간</option>
							<option value="hour_34">34시간</option>
							<option value="hour_35">35시간</option>
							<option value="hour_36">36시간</option>
							<option value="hour_37">37시간</option>
							<option value="hour_38">38시간</option>
							<option value="hour_39">39시간</option>
							<option value="hour_40">40시간</option>
							<option value="hour_41">41시간</option>
							<option value="hour_42">42시간</option>
							<option value="hour_43">43시간</option>
							<option value="hour_44">44시간</option>
							<option value="hour_45">45시간</option>
							<option value="hour_46">46시간</option>
							<option value="hour_47">47시간</option>
							<option value="hour_48">48시간</option>
							<option value="hour_49">49시간</option>
							<option value="hour_50">50시간</option>
							<option value="hour_51">51시간</option>
							<option value="hour_52">52시간</option>
							<option value="hour_53">53시간</option>
							<option value="hour_54">54시간</option>
							<option value="hour_55">55시간</option>
							<option value="hour_56">56시간</option>
							<option value="hour_57">57시간</option>
							<option value="hour_58">58시간</option>
							<option value="hour_59">59시간</option>
							<option value="hour_60">60시간</option>
							<option value="hour_61">61시간</option>
							<option value="hour_62">62시간</option>
							<option value="hour_63">63시간</option>
							<option value="hour_64">64시간</option>
							<option value="hour_65">65시간</option>
							<option value="hour_66">66시간</option>
							<option value="hour_67">67시간</option>
							<option value="hour_68">68시간</option>
							<option value="hour_69">69시간</option>
							<option value="hour_70">70시간</option>
							<option value="hour_71">71시간</option>
							<option value="hour_72">72시간</option>
							<option value="hour_73">73시간</option>
							<option value="hour_74">74시간</option>
							<option value="hour_75">75시간</option>
							<option value="hour_76">76시간</option>
							<option value="hour_77">77시간</option>
							<option value="hour_78">78시간</option>
							<option value="hour_79">79시간</option>
							<option value="hour_80">80시간</option>
							<option value="hour_81">81시간</option>
							<option value="hour_82">82시간</option>
							<option value="hour_83">83시간</option>
							<option value="hour_84">84시간</option>
							<option value="hour_85">85시간</option>
							<option value="hour_86">86시간</option>
							<option value="hour_87">87시간</option>
							<option value="hour_88">88시간</option>
							<option value="hour_89">89시간</option>
							<option value="hour_90">90시간</option>
							<option value="hour_91">91시간</option>
							<option value="hour_92">92시간</option>
							<option value="hour_93">93시간</option>
							<option value="hour_94">94시간</option>
							<option value="hour_95">95시간</option>
							<option value="hour_96">96시간</option>
							<option value="hour_97">97시간</option>
							<option value="hour_98">98시간</option>
							<option value="hour_99">99시간</option>
							<option value="hour_100">100시간</option>
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
						<a href="./ticket_buy.html" class="b_btn"  id="buy_btn"><input type="button" value="이용권 구매"></a>
						<a href="./book_seat_complete.html" class="b_btn" id="book_btn"><input type="submit" value="예약하기" ></a>
					</div>
			</div>
		</div>
	</div>
</main>
<script>
seatInit();
$('.seat').click(function(){
	let num = $(this).text();
	$('.seat_table .seat_selected').removeClass('seat_selected').addClass('seat');
	$(this).removeClass('seat').addClass('seat_selected');
	$('.seat_num_box').html('<div class="seat_num_title">선택한 좌석번호 :</div> <div id="seat_num">'+num+'</div><div class="seat_num_title">번</div>');
})

$('.seat_selected').click(function(){
	seatInit();
})

$('.ticket_select').click(function(){
	let val = $(this).val();
	console.log(val);
	if(val==4)
		$('.time_select.time_30').removeClass('.display_none');
	if(val==5)
		$('.time_select.time_50').removeClass('.display_none');
	if(val==6)
		$('.time_select.time_100').removeClass('.display_none');
})


function seatInit(){
	$('.seat_table .seat_selected').removeClass('seat_selected').addClass('seat');
	$('.seat_num_box').html('<div class="seat_num_title">좌석을 선택하세요.</div>');
}
</script>