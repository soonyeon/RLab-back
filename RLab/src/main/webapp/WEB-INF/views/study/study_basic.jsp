<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/calendar_main.css'></c:url>">
<script src="<c:url value='/resources/js/study/study.js'/>"></script>
<script src="<c:url value='/resources/js/study/calendar/calendar.js'/>"></script>
<script src="<c:url value='/resources/js/study/calendar/study_og.js'/>"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
dialog {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	border: none;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#calendarDialog {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 9999;
}

form {
	display: flex;
	flex-direction: column;
}

.form-control {
	margin-bottom: 10px;
}

body {
	font-family: Arial, sans-serif;
}

.overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.modal {
	background-color: white;
	padding: 20px;
	border-radius: 4px;
	width: 80%;
	max-width: 500px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.modal menu {
	display: flex;
	justify-content: flex-end;
}

#calendarDialog button {
	background-color: #007bff;
	border: none;
	color: white;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
	padding: 8px 16px;
}

#calendarDialog button:hover {
	background-color: #0056b3;
	color: white;
}

#calendarDialog #closecalendar {
	background-color: #6c757d;
}

#calendarDialog #deletecalendar {
	background-color: #dc3545;
}

#calendarDialog #savecalendar {
	background-color: #28a745;
}

#editCalendarDialog button {
	background-color: #007bff;
	border: none;
	color: white;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
	padding: 8px 16px;
}

#editCalendarDialog button:hover {
	background-color: #0056b3;
	color: white;
}

#editCalendarDialog #closeEditCalendar {
	background-color: #6c757d;
}

#editCalendarDialog #deleteCalendar {
	background-color: #dc3545;
}

#editCalendarDialog #updateCalendar {
	background-color: #28a745;
}
</style>

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
				<div class="tab_container">
					<div class="tabs">
						<div class="tab">
							<input type="radio" id="tab1" name="tab_control" checked>
							<label for="tab1" class="tab1">달력</label>
						</div>
						<div class="tab">
							<input type="radio" id="tab2" name="tab_control"> 
							<label for="tab2" class="tab2">일정 리스트</label>
						</div>
						<div class="tab">
							<input type="radio" id="tab3" name="tab_control"> 
							<label for="tab3" class="tab3">스탬프</label>
						</div>
					</div>
				</div>
				<!-- 달력 -->
				<div class="calendar_container">
					<div class="calendar_box1">
						<div id='calendar'></div>
					</div>
					<div class="calendar_box2 display_none">
						<div id='calendar'></div>
					</div>
					<div class="calendar_box3 display_none">
						<div id='calendar'></div>
					</div>
				</div>

				<dialog id="calendarDialog">
					<form id="calendarForm">
						<input type="hidden" value="${st_num}" id="ca_st_num">
						<div class="mb-3">
							<label for="calendarTitle" class="form-label">제목</label> 
							<input type="text" class="form-control" id="calendarTitle">
						</div>
						<div class="mb-3">
							<label for="calendarStart" class="form-label">시작일</label>
							<input type="datetime-local" class="form-control" id="calendarStart">
						</div>
						<div class="mb-3">
							<label for="calendarEnd" class="form-label">종료일</label> 
							<input type="datetime-local" class="form-control" id="calendarEnd">
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="calendarAllDay"> 
							<label class="form-check-label"	for="calendarAllDay">하루종일</label>
						</div>
						<menu>
							<button type="button" id="closecalendar">닫기</button>
							<button type="button" id="savecalendar">저장</button>
						</menu>
					</form>
				</dialog>
				
				<dialog id="editCalendarDialog">
					<form id="editCalendarForm">
						<input type="hidden" id="editCa_num">
					    <input type="hidden" id="editCa_st_num">
					    <h3>일정 수정 및 삭제</h3>
					    <div class="mb-3">
					    	<label for="editCalendarTitle" class="form-label">제목</label>
					    	<input type="text" class="form-control" id="editCalendarTitle">
					    </div>
					    <div class="mb-3">
					    	<label for="editCalendarStart" class="form-label">시작일</label>
					    	<input type="datetime-local" class="form-control" id="editCalendarStart">
					    </div>
					    <div class="mb-3">
					    	<label for="editCalendarEnd" class="form-label">종료일</label>
					    	<input type="datetime-local" class="form-control" id="editCalendarEnd">
					    </div>
					    <div class="mb-3 form-check">
					    	<input type="checkbox" class="form-check-input" id="editCalendarAllDay">
					    	<label class="form-check-label" for="editCalendarAllDay">하루종일</label>
					    </div>
					    <menu>
					    	<button type="button" id="closeEditCalendar">닫기</button>
					    	<button type="button" id="updateCalendar">수정</button>
					    	<button type="button" id="deleteCalendar">삭제</button>
					    </menu>
					</form>
				</dialog>
				<div class="middle_container clearfix">
				<!-- TO-DO LIST -->
				<div class="todo_container">
				<!-- 제목 -->
				<div class="todo_box_title">
					<h3>TODO</h3>
					<a href="#" class="plus1">+더보기</a>
				</div>
				<!-- 내용 -->
				<div class="todo_box_content">
					<div class="input_container">
						<input type="text"class="input_box" placeholder="할 일을 입력하세요">
 					</div>
					<ul class="todo_list" id="todo_list">
						<c:forEach items="${tdList}" var="td" varStatus="vs" >
							<li data-num="${td.td_num}">
								<c:if test="${td.td_finish == 0}">
									<span class="todo_check">
									<i class="material-icons check check_on">check</i>
									</span>
									<span class="todo_content">${td.td_content}</span>
								</c:if>
								<c:if test="${td.td_finish == 1}">
									<span class="todo_check">
									<i class="material-icons check check_off">check</i>
									</span>
									<span class="todo_content done">${td.td_content}</span>
								</c:if>
								<span class="todo_clear">
									<i class="material-icons clear">clear</i>
								</span>
							</li>
						</c:forEach>
					</ul>
					<!-- 달성률 -->
					<div class="progress_container">
						<canvas id="gauge" width="100" height="20"></canvas>
						<div>
					    	<p class="success_percent">달성률 ${todoProgressRateint}%</p>
					    </div> 
					</div>
				</div>
			</div>

			<!-- 타임라인 -->
			<div class="time_line_container">
				<div class="timeline_box_title">
					<h3 class="feed_title">오늘의 인증</h3>
				</div>
				<div class="feed_content_box">
					<c:forEach items="${photo}" var="ph">
						<c:if test="${ph.ph_st_num != null && ph.ph_num == 1}">
							<div class="today_feed_board">
								<div class="feed_board">
									<ul class="feed_writer_box">
										<i class="feed_writer_img"></i>
										<i class="feed_writer_name">${ph.ph_me_id}</i>
										<i class="feed_date">${ph.ph_register_date }</i>
									</ul>
							<img class="feed_img" src="<c:url value='/download${ph.ph_img}'></c:url>">
							</div>
							<div class="feed_content_item">
								<div class="feed_like">
									<div class="feed_like_img"></div>
									<div class="feed_like_count">10</div>
								</div>
								<div class="feed_content">
									<span>${ph.ph_content}</span>
									</div>
								</div>
							</div>
							<hr>
						</c:if>
					</c:forEach> 
				</div>
			</div>
			<!-- 자유게시판 최신글 -->
			<div class="free_board">
				<!-- 제목 -->
				<div class="free_box_title">
					<h3 class="contents_title">자유게시판 최신글</h3>
					<a href="" class="plus2">+더보기</a>
				</div>
				<div class="board_content_box">
					<!-- 내용 1,2,3 -->
					<div class="boardContainer">
						<div class="board_box">
							<a href="#" class="board_item">
								<div class="circle_new">NEW</div> <span>정보처리기사 문제집 추천</span>
							</a>
						</div>
						<div class="board_box">
							<a href="#" class="board_item">
								<div class="circle_new">NEW</div> <span>바닐자 자바스크립트 vs
									제이쿼리</span>
							</a>
						</div>
						<div class="board_box">
							<a href="#" class="board_item">
								<div class="circle_new">NEW</div> <span>react 온라인 강의 어떤게
									좋나요?</span>
							</a>
						</div>
						<div class="board_box">
							<a href="#" class="board_item">
								<div class="circle_new">NEW</div> <span>react 온라인 강의 어떤게
									좋나요?</span>
							</a>
						</div>
						<div class="board_box">
							<a href="#" class="board_item">
								<div class="circle_new">NEW</div> <span>react 온라인 강의 어떤게
									좋나요?</span>
							</a>
						</div>
						<div class="board_box">
							<a href="#" class="board_item">
								<div class="circle_new">NEW</div> <span>react 온라인 강의 어떤게
									좋나요?</span>
							</a>
						</div>
					</div>
				</div>
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
                	<div class="icon_now">NOW</div>
                	<div class="study_name">${now.st_name}</div>
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
		</div>
		<!-- 접속상태 -->
		<div class="accessor">
			<div class="study_title">정보처리기사 스터디</div>
			<div class="accessor_container">
				<div class="circle_accessor">
					<div class="accessor_on"></div>
				</div>
				<div class="member_name">김돌탕</div>
				<span class="your">YOU</span>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">김순연</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">김세영</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">김도현</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">이정현</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">가나다</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">라마바</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">사아나</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">s아나</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">s아나</div>
			</div>
			<div class="accessor_container">
				<div class="circle_accessor"></div>
				<div class="member_name">s아나</div>
			</div>
		</div>
	</aside>
	</div>
</main>
<script>

var url = new URL(location.href);
var top2 = url.searchParams.get("top");
$(document).scrollTop(top2);

//할 일 추가 후, todo_list 업데이트
//DOM 요소 가져오기
const todoInput = document.querySelector(".input_box"); // 할 일 입력란
const todoList = document.querySelector(".todo_list"); // 할 일 목록
const todo = todoInput.value;
// 할 일 입력란에서 Enter 키를 눌렀을 때의 이벤트 핸들러
todoInput.addEventListener("keypress", (e) => {
	
    if (e.keyCode === 13 && todoInput.value !== '') { // Enter 키를 눌렀고, 입력란이 비어있지 않은 경우
    	const todo = todoInput.value;
    	generateTodo(todo); // 입력된 할 일을 추가하는 함수 호출
        todoInput.value = ""; // 입력란 비우기
        /* updateTodoList(); */
    }
});

// 할 일을 생성하고 서버에 전송하는 함수
const generateTodo = (todo) => {
	const obj = {
   		td_content : todo,
   		td_me_id : '${user.me_id}'
    };
	$.ajax({
		async:false,
	    type:'POST',
	    data:JSON.stringify(obj),
	    url:"<c:url value='/study/todo/create'></c:url>",
	    //서버에서 받는 데이터 타입
	    dataType:"json",
	    //서버에서 보내는 데이터 타입
	    contentType:"application/json; charset=UTF-8",
	    success : function(data){
	    	/* updateTodoList(); */
	    	var top = $(document).scrollTop();
	    	location.href = "<c:url value='/study/${st_num}?top="+top+"'></c:url>"; 
	    }
	});  
} 

//투두 삭제
const clearIcons = document.querySelectorAll('.clear');
clearIcons.forEach(icon => {
    icon.addEventListener("click", (e) => {
        var td_num = e.target.parentNode.parentNode.dataset.num;

        console.log(td_num);
        
        $.ajax({
            async: false,
            type: 'POST',
            data:JSON.stringify({'td_num': td_num}),
            url: "<c:url value='/study/todo/delete'></c:url>",
            // 서버에서 받는 데이터 타입
            dataType: "json",
            // 서버에서 보내는 데이터 타입
            contentType: "application/json; charset=UTF-8",
            success: function (data) {
		    	/* updateTodoList(); */
		    	var top = $(document).scrollTop();
		    	location.href = "<c:url value='/study/${st_num}?top="+top+"'></c:url>";
            }
        });
    });
});

//투두 상태 변경 0->1
const checkOn = document.querySelectorAll('.check_on');
checkOn.forEach(icon => {
    icon.addEventListener("click", (e) => {
        var td_num = e.target.parentNode.parentNode.dataset.num;
       
        $.ajax({
            async: false,
            type: 'POST',
            data:JSON.stringify({'td_num': td_num}),
            url: "<c:url value='/study/todo/finish'></c:url>",
            // 서버에서 받는 데이터 타입
            dataType: "json",
            // 서버에서 보내는 데이터 타입
            contentType: "application/json; charset=UTF-8",
            success: function (data) { 
		    	var top = $(document).scrollTop();
		    	location.href = "<c:url value='/study/${st_num}?top="+top+"'></c:url>";
            }
        });
    });
}); 

//투두 상태 변경 1 -> 0
const checkOff = document.querySelectorAll('.check_off');
checkOff.forEach(icon => {
    icon.addEventListener("click", (e) => {
        var td_num = e.target.parentNode.parentNode.dataset.num;
        
        console.log(td_num);
       
        $.ajax({
            async: false,
            type: 'POST',
            data:JSON.stringify({'td_num': td_num}),
            url: "<c:url value='/study/todo/finish/undo'></c:url>",
            // 서버에서 받는 데이터 타입
            dataType: "json",
            // 서버에서 보내는 데이터 타입
            contentType: "application/json; charset=UTF-8",
            success: function (data) { 
		    	var top = $(document).scrollTop();
		    	location.href = "<c:url value='/study/${st_num}?top="+top+"'></c:url>";
            }
        });
    });
}); 

const st_num = '${st_num}';
const userId = '${userId}'; 
$(document).ready(function() {
    loadStudyMembers(st_num, userId);
});

const sse = new EventSource("<c:url value='/connect'></c:url>" + "?id=" + userId);
sse.addEventListener('connect', (e) => {
    const { data: receivedConnectData } = e;
    console.log('connect event data: ', receivedConnectData);  // "connected!"
    console.log(new Date());
});
sse.addEventListener('count', e => {
    const { data: receivedCount } = e;
    console.log("count event data", receivedCount);
});

$('.leave').click(function() {
	if(confirm('스터디를 탈퇴 하시겠습니까?')) {
		$.ajax({
	    	url: '<c:url value="/study/leave/${st_num}" />',
            type: 'POST',
            success: function(response) {
            	alert(response);
            	if(response == 'leader') {
            		alert('스터디장은 스터디 탈퇴가 불가능합니다. 스터디장을 회원에게 위임한 후 탈퇴하기를 진행하거나, 관리페이지에서 스터디 삭제를 진행해주세요.');
            		return false;
            	}else {
                alert('해당 스터디를 탈퇴했습니다.');
                window.location.href = '<c:url value="/" />';
            	}
            },
            error: function(error) {
                alert('해당 스터디 탈퇴에 실패하였습니다.');
            }
        });
	}
})


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

const canvas = document.getElementById("gauge");
const ctx = canvas.getContext("2d");

const value = ${todoProgressRateint}; // 게이지바 값
const max = 100; // 게이지바 최대값
const barWidth = 100; // 게이지바 너비
const barHeight = 20; // 게이지바 높이
const centerX = canvas.width / 2 - barWidth/2;
const centerY = canvas.height / 2;

// 게이지바 그리기
const fillWidth = (value / max) * barWidth;
ctx.fillStyle = "rgb(0, 128, 255)";
ctx.fillRect(centerX, centerY - barHeight/2, fillWidth, barHeight);


</script>
<script>
/* 우측 메뉴 이벤트 */
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
</script>