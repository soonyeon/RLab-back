<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="<c:url value='/resources/css/study/photo.css'></c:url>">
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
				</nav>
			</div>
			<div class="left_bottom_menu">
				<a href="#" class="leave_btn">탈퇴하기</a>
				<c:if test="${leaderCount != 0 && leaderCount != null}">
					<a class="manage_btn" href="<c:url value='/study/management'></c:url>" class="list_item">스터디 관리</a>
				</c:if>
			</div>
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
						<progress id="progress-bar" class="mint" value="" max="100"></progress>
					</div>
					
					<!--프로필-->
					<div class="daliy_mission_pro_container">
						<c:forEach items="${studyMember}" var="sm">
							<div class="daliy_mission_pro">
								<c:if test="${!mfList.contains(sm.sm_me_id) || mfList == null}">
									<div class="pro_circle">
										<c:if test="${sm.me_profile == null}">
											<img  class="pro_img" src="<c:url value='/resources/img/user.png'></c:url>" width="80" height="80" >	
										</c:if>
										<c:if test="${sm.me_profile != null}">
											<img  class="pro_img" src="<c:url value='/download/${sm.me_profile}'></c:url>" width="80" height="80" >
										</c:if>
									</div>
									<div class="pro_name">${sm.sm_me_id}</div>
								</c:if>
								<c:if test="${mfList.contains(sm.sm_me_id)}"  >
										<div class="pro-img-check"></div>
										<c:if test="${sm.me_profile == null}">
											<img  class="pro_img" src="<c:url value='/resources/img/user.png'></c:url>" width="80" height="80" >	
										</c:if>
										<c:if test="${sm.me_profile != null}">
											<img  class="pro_img" src="<c:url value='/download/${sm.me_profile}'></c:url>" width="80" height="80" >
										</c:if>
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
				    <c:if test="${mission == null }">
				    <h2>미션내용 등록하기</h2>
					    <form>
					        <label for="content">미션내용입력:</label>
					        <textarea id="content" name="content" rows="4" cols="50" maxlength="100" placeholder="내용은 100자 이내"></textarea>
					        <br>
					    	 <button class="mission_up">등록하기</button>
					    		
						</form>
					</c:if>	
					<c:if test="${mission != null }">
					<h2>미션내용 수정하기</h2>
					    <form>
					        <label for="content">미션내용입력:</label>
					        <textarea id="content" name="content" rows="4" cols="50" maxlength="100" value="${mission.mi_content}" ></textarea>
					        <br> 
					    	 <button class="mission_edit">수정하기</button>			
						</form>
					</c:if>
					
				 </div>
			</div>
		</section>
		<!-- 오른쪽 메뉴 -->
		<aside>
			<div class="right-container">
				<!-- 메뉴바 3개 -->
				<div class="study_link_container">
					<div class="circle_now cc">
	                	<div class="icon_now">NOW</div>
	                	<div class="study_name">${nowSt.st_name}</div>
	            	</div>
					<div class="circle_star cc">
	                	<img class="icon_star" src="<c:url value='/resources/img/favorite_star_on.png'></c:url>">
	                	<div class="study_name"><a href="<c:url value='/study/${favorite.st_num}'></c:url>">${favorite.st_name}</a></div>
					</div>
					<div class="my_study_container">
						<div class="my_list_title">
	                    	<div class="icon_my">MY</div>
	                    	<div class="my_study">나의 스터디<button class="btn_dropdown">▼</button></div>
	                	</div>
	                	<div id="dropdown_list" class="display_none">
							<ul class="dropdown_list">
		                    	<c:forEach items="${stList}" var="st">
		                        	<li class="dropdown_item">
		                            	<input type="hidden" name="list_st_num" value="${st.st_num}">
		                                <div class="item_container">
		                                    <a href="<c:url value='/study/${st.st_num}'></c:url>" class="item_name">${st.st_name}</a>
		                                    <c:if test="${user.me_study==st.st_num}"><div class="star_on"></div></c:if>
		                                    <c:if test="${user.me_study!=st.st_num}"><div class="star_off"></div></c:if>
		                                </div>
		                          	</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<!-- 접속상태 -->
				<div class="accessor">
					
				</div>
			</div>
		</aside>
	</div>
</main>
<script>
/*[미션 완료 게이지 채우기]
 * totalCount = 스터디멤버들 전체 사이즈
 * currentCount = 미션완료한 리스트 사이즈
 * percent : 미션완료멤버 / 전체멤버 X 100 로 퍼센트 계산
 */
let totalCount = '${studyMember.size()}';
let currentCount = '${mfList.size()}';
var percent = (currentCount/totalCount*100).toFixed(2);
$('#progress-bar').val(percent)
$('.percent').text(percent);


//오늘의 미션 등록 모달창
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

//미션 등록
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

//미션 수정
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

$(content).text(`${mission.mi_content}`);



</script>
<script>
var st_num = '${st_num}';
var userId = '${userId}'; 

/* 우측 메뉴 이벤트 */
$(document).ready(function() {
    loadStudyMembers(st_num, userId);
});

$(document).ready(function (){
	$('.btn_dropdown').click(function(){
		$('#dropdown_list').slideToggle();
	});
	
	//star_off 클릭하면 즐겨찾기 등록하는 ajax post
	$('.star_off').click(function(){
		let studyName = $(this).prev().text();
		let studyNum = $(this).parents('.dropdown_item').find('[name=list_st_num]').val();
		if(confirm("'"+studyName+"' 스터디를 즐겨찾기로 등록하시겠습니까?")){
			let obj = {
				st_num: studyNum,
				st_me_id: '${user.me_id}'
			}
			$.ajax({
				type: 'POST',
				data: JSON.stringify(obj),
				url: '<c:url value="/study/setfavorite"></c:url>',
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					alert('즐겨찾기를 변경하였습니다.');
					location.reload();
				}
			})
		}
	});
});

//접속멤버를 불러와서 화면에 출력하는 함수
function loadStudyMembers(st_num, userId) {
    $.ajax({
        url: '<c:url value="/onlineMembers"/>',
        type: 'GET',
        dataType: 'json',
        success: function (onlineMembers) {
            $.ajax({
                url: '<c:url value="/study/getMembers/"/>${st_num}',
                type: 'GET',
                dataType: 'json',
                success: function (members) {
                	// 기존 멤버 목록을 삭제
                    $(".accessor_container").remove();
                    let memberList = "";

                    // 첫 번째 멤버의 study_title을 가져옴
                    if (members.length > 0) {
                        memberList += '<div class="study_title">' + members[0].st_name + '</div>';
                    }

                    // 온라인 회원 목록 처리 (나->접속자->비접속자)
                    members.forEach(member => {
                    const isOnline = onlineMembers.includes(member.me_name);
                        if(userId === member.me_name)
                        	memberList += createMemberListItem(member, userId, true);
                    });
                    members.forEach(member => {
                        const isOnline = onlineMembers.includes(member.me_name);
	                	if(userId != member.me_name && isOnline)
	                    	memberList += createMemberListItem(member, userId, true);
                    });
                    members.forEach(member => {
                        const isOnline = onlineMembers.includes(member.me_name);
	                	if(userId != member.me_name && !isOnline)
	                    	memberList += createMemberListItem(member, userId, false);
                    });
                    document.querySelector(".accessor").innerHTML = memberList;
                }
            });
        }
    });
}
//접속멤버란 - 멤버 한명의 html 문자열 리턴하는 함수
function createMemberListItem(member, userId, isOnline) {
    const defaultImage = '<c:url value="/resources/img/user.png" />';
    const userProfileImage = member.me_profile ? '<c:url value="/download" />' + member.me_profile : defaultImage;

    return '<div class="accessor_container">' +
    	(isOnline ? '<div class="accessor_on"></div>' : '') +
        '<div class="circle_accessor">' +
        '<img class="acc_img" src="' + userProfileImage + '" width="auto" height="40">' +
        '<span class="blind">마이페이지</span>' +
        //(isOnline ? '<div class="accessor_on"></div>' : '') +
        '</div>' +
        '<div class="member_name">' + member.me_name + '</div>' +
        (userId === member.me_name ? '<span class="your">YOU</span>' : '') +
        '</div>';
}
</script>