<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="<c:url value='/resources/css/study/certification_board.css'></c:url>">
	<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/daily.css'></c:url>">
<c:set var="now" value="<%=new Date()%>" />
<c:set var="currentDate2" value="<fmt:formatDate pattern='yyyy.MM.dd' value='${now}'/>" />
<fmt:formatDate pattern='yyyy.MM.dd' value='${now}' var="currentDate"/>
<main>
	<div class="main_container">
		<div class="left_side">
			<!-- 왼쪽 메뉴바 -->
			<div class="left_menu_container">
				<nav class="left_menu">
					<a href="<c:url value='/study/${st_num}'></c:url>" class="list_item">스터디홈</a>
					<a href="<c:url value='/study/todo/${st_num}'></c:url>" class="list_item">투두 리스트</a> 
					<a href="<c:url value='/study/daily/${st_num}'></c:url>" class="list_item">데일리 미션</a> 
					<a href="<c:url value='/study/photo/${st_num}'></c:url>" class="list_item">인증 게시판</a> 
					<a href="<c:url value='/board/list/${st_num}'></c:url>" class="list_item">자유 게시판</a> 
					<a href="<c:url value='/study/management'></c:url>" class="list_item">스터디 관리</a>
				</nav>
			</div>
			<a href="#" class="leave_btn">탈퇴하기</a>
		</div>
	
		<section>
			<div class="home_container">
				<div class="todo_list_container_top">
					<div class="time_line_title">데일리 미션</div>
				</div>
				<div class="daliy_mission_container">
					<!-- 오늘의 미션 -->
					
					<div class="today_mission">
						<span class="today_mission_title">오늘의 미션</span> <span
							class="today_mission_date">${mission.mi_date}</span>
							<c:choose>	
					            <c:when test="${empty mission}">
					           		  <c:if test="${authority == 9}">
						                <div class="today_mission_contents">
						                     오늘의 인증미션이 없습니다. 오늘의 미션을 등록해주세요!
						                </div>
					              	</c:if> 
					              	<c:if  test="${authority == 1}">
					              		<div class="today_mission_contents">
						                    데일리 미션이 아직 등록되지않았습니다.
						                </div>
					              	</c:if>
					            </c:when>
						        <c:otherwise>
									<div class="today_mission_contents">${mission.mi_content}</div>
								</c:otherwise>
							</c:choose>
					</div>
					<div class="main_today_mission_button clearfix">
						<div class="today_mission_button">
							   <c:if test="${authority == 9}">
							      <button class="mbutton1 mbtn">등록/수정</button>
							   </c:if> 
							<a href="<c:url value='/study/photo/${user.me_study}'></c:url>" class="mbutton2 mbtn">인증하기</a>	
						</div>
					</div>
					<!--달성률-->
					<div>
						<p class="success_percent2">달성률 <span class="percent"></span>%</p>
					</div>
					<div>
						<progress id="progress-bar" class="mint" value="0" max="100"></progress>
					</div>
					
					<!--프로필-->
					<div class="daliy_mission_pro_container">
						<c:forEach items="${studyMember}" var="sm">
							<div class="daliy_mission_pro">
								<c:if test="${!mfList.contains(sm.sm_me_id) || mfList == null}">
									<div class="pro_circle">
										<img  class="pro_img" src="<c:url value='/download/${sm.me_profile}'></c:url>" width="auto" height="80" >
									</div>
									<div class="pro_name">${sm.sm_me_id}</div>
								</c:if>
								<c:if test="${mfList.contains(sm.sm_me_id)}"  >
									<img class="pro-img-check">
									<div class="pro_circle">
										<img  class="pro_img" src="<c:url value='/download/${sm.me_profile}'></c:url>" width="auto" height="80">
									</div>
									<div class="pro_name">${sm.sm_me_id}</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="modal" class="modal">
				<div class="modal-content">
				    <span class="close">&times;</span>
				    <h2>미션내용 등록하기</h2>
					    <form>
					        <label for="content">미션내용입력:</label>
					        <textarea id="content" name="content" rows="4" cols="50" maxlength="100" placeholder="내용은 100자 이내"></textarea>
					        <br>
					    	 <button class="mission_up">등록하기</button>
					    	 <button class="mission_edit">수정하기</button>			
						</form>
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
						<img class="star" src="<c:url value='/resources/img/favorite_star_on.png'></c:url>">
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
</main>
<script>
//게이지 채우기
let totalCount = '${studyMember.size()}';
let currentCount = '${mfList.size()}';
var percent = currentCount/totalCount*100;
$('#progress-bar').val(percent)
$('.percent').text(percent);


$(document).ready(function() {
    var modal = $("#modal");

    var btn = $(".mbutton1");

    var span = $(".close");

    btn.click(function() {
        modal.show();
    });

    span.click(function() {
        modal.hide();
    });

    $(window).click(function(event) {
        if (event.target == modal[0]) {
            modal.hide();
        }
    });
});

$(".mission_up").click(function(e){
    e.preventDefault();
    let formData = new FormData();
    formData.append('mi_content',$('#content').val());
   	formData.append('mi_st_num',${st_num});
    console.log(formData);
    $.ajax({
        type: "POST",
        url: "<c:url value='/study/daily/{st_num}/insertmission'/>",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response){
            if(response === "success"){
                alert("미션이 등록되었습니다.");
                location.reload();
            }else{
                alert("미션 등록에 실패했습니다.");
            }
        },
        error: function(e){
            console.log(e);
        }
    });
});

$(".mission_edit").click(function(e){
    e.preventDefault();
    let formData = new FormData();
    formData.append('mi_content',$('#content').val());
   	formData.append('mi_st_num',${st_num});
    console.log(formData);
    $.ajax({
        type: "POST",
        url: "<c:url value='/study/daily/{st_num}/updatemission'/>",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response){
            if(response === "success"){
                alert("미션이 수정되었습니다.");
                location.reload();
            }else{
                alert("미션 수정에 실패했습니다.");
            }
        },
        error: function(e){
            console.log(e);
        }
    });
});




</script>