<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/calendar_main.css'></c:url>">
<script src="<c:url value='/resources/js/study/calendar/calendar.js'/>"></script>
<script src="<c:url value='/resources/js/study/calendar/study_og.js'/>"></script>


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <style>
 
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
    </style>

<main>
	<div class="main_container">
	    <!-- 왼쪽 메뉴바 -->
	    <div class="left_menu_container">
	        <nav class="left_menu">
	            <a href="<c:url value='/study/'></c:url>" class="list_item">스터디홈</a>
	            <a href="to_do_list.html" class="list_item">투두 리스트</a>
	            <a href="Daily Mission.html" class="list_item">데일리 미션</a>
	            <a href="<c:url value='/study/certificationBoard'></c:url>" class="list_item">인증 게시판</a>
	            <a href="<c:url value='/board/list'></c:url>" class="list_item">자유 게시판</a>
	            <a href="<c:url value='/study/management/member'></c:url>" class="list_item">스터디 관리</a>
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
	                <div class="study_name">김돌탕</div><span class="your">YOU</span>
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