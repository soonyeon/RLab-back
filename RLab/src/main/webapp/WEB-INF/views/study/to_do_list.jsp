<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/to_do_list.css'></c:url>">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<div class="main_container">
    <!-- 왼쪽 메뉴바 -->
    <div class="left_menu_container">
        <nav class="left_menu">
            <a href="study_basic.html" class="list_item">스터디홈</a>
            <a href="#" class="list_item">스터디 달력</a>
            <a href="to_do_list.html" class="list_item">투두 리스트</a>
            <a href="<c:url value='/study/daily/${st_num}'></c:url>" class="list_item">데일리 미션</a> 
            <a href="certification_board.html" class="list_item">인증 게시판</a>
            <a href="board.html" class="list_item">자유 게시판</a>
            <a href="<c:url value='/study/management/study'></c:url>" class="list_item">스터디 관리</a>
            <a href="#" class="leave">탈퇴하기</a>
        </nav>
    </div>

    <section>
        <div class="todo_container">
            <div class="time_line_title"> 투두 리스트</div>
        </div>
        <div class="home_container">
            <div class="todo_container">

                <!-- 투두 컨테이너 마이 -->
                <div class="todo_container_my">
                    <!-- 투두 박스 -->
                    <div class="todo_box add_shadow">
                        <div class="todo_box_content">
                            <div class="todo_box_member_title ">
                                <h3>My</h3>
                            </div>
                            <div class="input_container">
                                <input type="text" class="input_box" placeholder="할 일을 입력하세요">
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
                        </div>
                    </div>


                    <!-- 펫 박스 -->
                    <div class="pet_box">
                        <div class="pet_message_container">
                            <div class="pet_message">조금만 더 힘내요!</div>
                        </div>
                        <div class="pet_image"></div>



                        <!-- 달성률 -->
                        <div class="progress_container">
                            <progress value="20" max="100"></progress>
                            <div>
                                <p class="success_percent">달성률 20%</p>
                            </div>
                        </div>
                    </div>
                    <!-- 펫 박스 끝 -->
                </div>
                <!-- 투두 컨테이너 마이 끝 -->

                <!-- 투두 컨테이너 멤버 -->
                <div class="scroll_box">
                    <div class="todo_container_member">
                        <div class="todo_box_member_content add_shadow ">
                            <div class="todo_box_member_title ">
                                <h3>문동은</h3>
                            </div>
                                <ul class="todo_list">
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">바둑대회</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">김밥먹기</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">바둑대회</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">김밥먹기</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">바둑대회</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">김밥먹기</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">바둑대회</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                    <li>
                                        <span class="todo_check">
                                            <i class="material-icons check">check</i>
                                        </span>
                                        <span class="todo_content">김밥먹기</span>
                                        <span class="todo_clear">
                                            <i class="material-icons clear">clear</i>
                                        </span>
                                    </li>
                                </ul>

                            <div class="progress_container">
                                <progress value="20" max="100"></progress>
                                <div>
                                    <p class="success_percent">달성률 20%</p>
                                </div>
                            </div>
                        </div>
                        <div class="todo_box_member_content add_shadow ">

                            <div class="todo_box_member_title ">
                                <h3>박연진</h3>
                            </div>
                            <ul class="todo_list">
                                <li>
                                    <span class="todo_check">
                                        <i class="material-icons check">check</i>
                                    </span>
                                    <span class="todo_content">일기예보</span>
                                    <span class="todo_clear">
                                        <i class="material-icons clear">clear</i>
                                    </span>
                                </li>
                                <li>
                                    <span class="todo_check">
                                        <i class="material-icons check">check</i>
                                    </span>
                                    <span class="todo_content">쇼핑</span>
                                    <span class="todo_clear">
                                        <i class="material-icons clear">clear</i>
                                    </span>
                                </li>
                            </ul>                       
                            <div class="progress_container">
                                <progress value="20" max="100"></progress>
                                <div>
                                    <p class="success_percent">달성률 20%</p>
                                </div>
                            </div>
                        </div>
                        <div class="todo_box_member_content add_shadow ">
                            <div class="todo_box_member_title ">
                                <h3>전재준</h3>
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
                            <div class="progress_container">
                                <progress value="20" max="100"></progress>
                                <div>
                                    <p class="success_percent">달성률 20%</p>
                                </div>
                            </div>
                        </div>
                        <div class="todo_box_member_content add_shadow ">
                            <div class="todo_box_member_title ">
                                <h3>차무식</h3>
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
                            <div class="progress_container">
                                <progress value="20" max="100"></progress>
                                <div>
                                    <p class="success_percent">달성률 20%</p>
                                </div>
                            </div>
                        </div>
                        <div class="todo_box_member_content add_shadow ">
                            <div class="todo_box_member_title ">
                                <h3>남행선</h3>
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
                            <div class="progress_container">
                                <progress value="20" max="100"></progress>
                                <div>
                                    <p class="success_percent">달성률 20%</p>
                                </div>
                            </div>
                        </div>
                        <div class="todo_box_member_content add_shadow ">
                            <div class="todo_box_member_title ">
                                <h3>민소희</h3>
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
                            <div class="progress_container">
                                <progress value="20" max="100"></progress>
                                <div>
                                    <p class="success_percent">달성률 20%</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 투두 컨테이너 멤버 끝 -->
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

