<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="<c:url value='/resources/css/study/certification_board.css'></c:url>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/study/daily.css'></c:url>">



<div class="main_container">
	<!-- 왼쪽 메뉴바 -->
	    <div class="left_menu_container">
	        <nav class="left_menu">
	            <a href="<c:url value='/study/${user.me_study}'></c:url>" class="list_item">스터디홈</a>
	            <a href="#" class="list_item">스터디 달력</a>
	            <a href="to_do_list.html" class="list_item">투두 리스트</a>
	            <a href="<c:url value='/study/daily/${user.me_study}'></c:url>" class="list_item">데일리 미션</a>
	            <a href="<c:url value='/study/photo/${user.me_study}'></c:url>" class="list_item">인증 게시판</a>
	            <a href="<c:url value='/board/list/${user.me_study}'></c:url>" class="list_item">자유 게시판</a>
	            <a href="<c:url value='/study/management/member'></c:url>" class="list_item">스터디 관리</a>
	            <a href="#" class="leave">탈퇴하기</a>
	        </nav>
	    </div>

	<section>
		<div class="home_container">
			<div class="todo_list_container_top">
				<div class="time_line_title">데일리 미션</div>
			</div>
			<div class="daliy_mission_container">
				<!-- 오늘의 미션 -->
				<div class="today_mission">
					<span class="today_mission_title">오늘의미션</span> <span
						class="today_mission_date">23.02.28</span>
					<div class="today_mission_contents">정처기 1과 까지 공부하고 인증하기</div>
				</div>
				<div class="today_mission_button">
					<c:forEach items="${studyMember}" var="member">
					   <c:if test="${member.sm_authority > 1}">
					      <a href="#" class="mbutton1">등록/수정</a>
					   </c:if> 
					</c:forEach> 
					<a href="<c:url value='/study/photo/${user.me_study}'></c:url>" class="mbutton2">인증하기</a>	
				</div>
				<!--달성률-->
				<div>
					<p class="success_percent2">달성률 %</p>
				</div>
				<div>
					<progress class="mint" value="20" max="100"></progress>
				</div>
				
				<!--프로필-->
				<div class="daliy_mission_pro_container">
					<c:forEach items="${studyMember}" var="sm">
						<div class="daliy_mission_pro">
							<img class="pro-img-check">
							<img  class="pro_img" src="<c:url value='/download/${sm.me_profile}'></c:url>" >
							<div class="pro_name">${sm.sm_me_id}</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		



	</section>
	<!-- 오른쪽 메뉴 -->
	<aside>
		<div class="right-container">
			<!-- 메뉴바 3개 -->
			<div class="study_link_container">
				<div class="circle_now cc">
					<div class="now">NOW</div>
				</div>
				<div class="circle_star cc">
					<img class="star" src="../img/favorite_star_on.png">
				</div>
				<div class="my_study_container">
					<div class="my_list_title">

						<div class="my">MY</div>

						<!-- <div class="my_study" >나의 스터디<button id="dropdown_btn">▼</button></div> -->
					</div>
					<div id="dropdown_list" style="display: none;">
						<ul class="dropdown_list_ul">
							<li class="dropdown_list_li">
								<div class="dropdown_list_contents">
									<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
									<div class="dropdown_list_contents_on_img"></div>
									<div class="dropdown_hr"></div>
								</div>
							</li>
							<li class="dropdown_list_li">
								<div class="dropdown_list_contents">
									<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
									<div class="dropdown_list_contents_off_img"></div>
									<div class="dropdown_hr"></div>
								</div>
							</li>
							<li class="dropdown_list_li">
								<div class="dropdown_list_contents">
									<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
									<div class="dropdown_list_contents_off_img"></div>
									<div class="dropdown_hr"></div>
								</div>
							</li>
							<li class="dropdown_list_li">
								<div class="dropdown_list_contents">
									<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
									<div class="dropdown_list_contents_off_img"></div>
									<div class="dropdown_hr"></div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 접속상태 -->
		<div class="accessor">
			<div class="study_title">정보처리기사 스터디</div>
			<div class="accessor_container">
				<div class="circle_accessor">
					<div class="accessor_on"></div>
				</div>
				<div class="study_name">김돌탕</div>
				<span class="your">YOU</span>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">김순연</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">김세영</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">김도현</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">이정현</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">가나다</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">라마바</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">사아나</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">s아나</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">s아나</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="study_name">s아나</div>
			</div>

		</div>
	</aside>
</div>