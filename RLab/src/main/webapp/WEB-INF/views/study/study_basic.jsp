<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/calendar_main.css'></c:url>">
<script src="<c:url value='/resources/js/study/study.js'/>"></script>
<script src="<c:url value='/resources/js/study/calendar/calendar.js'/>"></script>
<script src="<c:url value='/resources/js/study/calendar/study_og.js'/>"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<main>
	<div class="main_container">
	    <!-- 왼쪽 메뉴바 -->
	    <div class="left_menu_container">
	        <nav class="left_menu">
	            <a href="<c:url value='/study/${st_num}'></c:url>" class="list_item">스터디홈</a>
	            <a href="to_do_list.html" class="list_item">투두 리스트</a>
	            <a href="Daily Mission.html" class="list_item">데일리 미션</a>
	            <a href="<c:url value='/study/photo/${st_num}'></c:url>" class="list_item">인증 게시판</a>
	            <a href="<c:url value='/board/list/${st_num}'></c:url>" class="list_item">자유 게시판</a>
	            <a href="<c:url value='/study/management'></c:url>" class="list_item">스터디 관리</a>
	            <a href="#" class="leave">탈퇴하기</a>
	        </nav>
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
		        	<input type="hidden" value="${ca_st_num}" id="ca_st_num">
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
		                <label class="form-check-label" for="calendarAllDay">하루종일</label>
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
	                        <ul class="todo_list">
	                            <li>
	                                <span class="todo_check">
	                                    <i class="material-icons check">check</i>
	                                </span>
	                                <span class="todo_content">할일</span>
	                                <span class="todo_clear">
	                                    <i class="material-icons clear">clear</i>
	                                </span>
	                            </li> 
	                        </ul>  
	
	                        <!-- 달성률 -->
	                        <div>
	                            <progress class="progress" value="20" max="100"></progress>
	                        </div>
	                        <div>
	                            <p class="success_percent">달성률 20%</p>
	                        </div>
	                    </div>
	                </div>
	
	
	                <!-- 타임라인 -->
	                <div class="time_line_container">
	                    <div class="timeline_box_title">
	                        <h3 class="feed_title">오늘의 인증</h3>
	                    </div>
	                    <div class="feed_content_box">
	                        <div class="today_feed_board">
	                            <div class="feed_board">
	                                <ul class="feed_writer_box">
	                                    <i class="feed_writer_img"></i>
	                                    <i class="feed_writer_name">김돌탕</i>
	                                    <i class="feed_date">2023년 01월 21일 오후 9시 12분</i>
	                                </ul>
	                                <div class="feed_img"></div>
	                                <div class="feed_content_item">
	                                    <div class="feed_like">
	                                        <div class="feed_like_img"></div>
	                                        <div class="feed_like_count">10</div>
	                                    </div>
	                                    <div class="feed_content">
	                                        <span>2/22 인증합니다</span>
	                                    </div>
	                                </div>
	                            </div>
	                            <hr>
	                            <div class="feed_board">
	                                <ul class="feed_writer_box">
	                                    <i class="feed_writer_img"></i>
	                                    <i class="feed_writer_name">김돌탕</i>
	                                    <i class="feed_date">2023년 01월 21일 오후 9시 12분</i>
	                                </ul>
	                                <div class="feed_img"></div>
	                                <div class="feed_content_item">
	                                    <div class="feed_like">
	                                        <div class="feed_like_img"></div>
	                                        <div class="feed_like_count">10</div>
	                                    </div>
	                                    <div class="feed_content">
	                                        <span>인증합니다 </span>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
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
	                                    <div class="circle_new">NEW</div>
	                                    <span>정보처리기사 문제집 추천</span>
	                                </a>
	                            </div>
	                            <div class="board_box">
	                                <a href="#" class="board_item">
	                                    <div class="circle_new">NEW</div>
	                                    <span>바닐자 자바스크립트 vs 제이쿼리</span>
	                                </a>
	                            </div>
	                            <div class="board_box">
	                                <a href="#" class="board_item">
	                                    <div class="circle_new">NEW</div>
	                                    <span>react 온라인 강의 어떤게 좋나요?</span>
	                                </a>
	                            </div>
	                            <div class="board_box">
	                                <a href="#" class="board_item">
	                                    <div class="circle_new">NEW</div>
	                                    <span>react 온라인 강의 어떤게 좋나요?</span>
	                                </a>
	                            </div>
	                            <div class="board_box">
	                                <a href="#" class="board_item">
	                                    <div class="circle_new">NEW</div>
	                                    <span>react 온라인 강의 어떤게 좋나요?</span>
	                                </a>
	                            </div>
	                            <div class="board_box">
	                                <a href="#" class="board_item">
	                                    <div class="circle_new">NEW</div>
	                                    <span>react 온라인 강의 어떤게 좋나요?</span>
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
	                <div class="member_name">김돌탕</div><span class="your">YOU</span>
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
/* 우측 메뉴 이벤트 */
$(document).ready(function (){
	$('.btn_dropdown').click(function(){
		$('#dropdown_list').slideToggle();
	});
	
	//star_off 클릭하면 즐겨찾기 등록하는 ajax post
	$('.star_off').click(function(){
		let studyName = $(this).prev().text();
		let studyNum = $(this).parents('.dropdown_item').find('[name=list_st_num]').val();
		if(confirm("'studyName'를 즐겨찾기로 등록하시겠습니까?")){
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
<script>
const st_num = '${st_num}';
loadStudyMembers(st_num);

function loadStudyMembers(st_num) {
	  $.ajax({
	    url: '<c:url value="/study/onlineMembers"/>',
	    type: 'GET',
	    dataType: 'json',
	    success: function (onlineMembers) {
	      $.ajax({
	        url: '<c:url value="/study/getMembers/"/>${st_num}',
	        type: 'GET',
	        dataType: 'json',
	        success: function (members) {
	          let memberList = "";

	          // 첫 번째 멤버의 study_title을 가져옴
	          if (members.length > 0) {
	            memberList += '<div class="study_title">' + members[0].st_name + '</div>';
	          }

	          for (let i = 0; i < members.length; i++) {
	            const defaultImage = '<c:url value="/resources/img/user.png" />';
	            const userProfileImage = members[i].me_profile ? '<c:url value="/download" />' + members[i].me_profile : defaultImage;

	            const isOnline = onlineMembers.some(onlineMember => onlineMember.me_name === members[i].me_name);

	            memberList += '<div class="accessor_container">' +
	              '<div class="circle_accessor">' +
	              '<img class="acc_img" src="' + userProfileImage + '" width="auto" height="40">' +
	              '<span class="blind">마이페이지</span>' +
	              (isOnline ? '<div class="accessor_on"></div>' : '') +
	              '</div>' +
	              '<div class="member_name">' + members[i].me_name + '</div>' +
	              '</div>';
	          }
	          document.querySelector(".accessor").innerHTML = memberList;
	        }
	      });
	    }
	  });
	}

const todoInput = document.querySelector(".input_box");
const todoList = document.querySelector(".todo_list");

todoInput.addEventListener("keypress",(e) => {
		if(e.keyCode === 13 && todoInput.value !== ''){
    generateTodo(todoInput.value);
		todoInput.value = "";
		}
});

const generateTodo = (todo) => {
	const li = document.createElement("li");
	const checkSpan  = generateCheck(); 
	const contentSpan = generateContent(todo); 
	const clearSpan = generateClear();
	li.appendChild(checkSpan);
	li.appendChild(contentSpan);
	li.appendChild(clearSpan);
	todoList.appendChild(li);
	console.log(li);
	
}

//체크 생성 메서드
const generateCheck= () => {
	const span = document.createElement("span");
	span.classList.add("todo_check")
	const icon = document.createElement("i");
	icon.classList.add("material-icons");
	icon.classList.add("check")
	icon.innerText = "check"
	icon.addEventListener("click",(e) => {
		const li = e.target.parentNode.parentNode;
		li.classList.add('done');
		icon.remove();
	});
	span.appendChild(icon);
	return span;
}

//컨텐트 생성 메서드
const generateContent = (todo) => {
	const span = document.createElement("span");//스팬을 생성, span변수에 할당
	span.classList.add("todo_content");
	span.innerText = todo;
	return span;
}

// x버튼
const generateClear= () => {
	const span = document.createElement("span");
	span.classList.add("todo_clear")
	const icon = document.createElement("i");
	icon.classList.add("material-icons");
	icon.classList.add("clear")
	icon.innerText = "clear"
	icon.addEventListener("click",(e) => {
		const li = e.target.parentNode.parentNode;
		todoList.removeChild(li);
	});
	span.appendChild(icon);
	
	return span;
}

</script>