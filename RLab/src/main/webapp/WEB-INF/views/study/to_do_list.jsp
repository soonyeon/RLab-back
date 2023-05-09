<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/to_do_list.css'></c:url>">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
				<a href="#" class="leave">탈퇴하기</a>
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
	                        </div>
	                    </div>
	
	                    <!-- 펫 박스 -->
	                    <div class="pet_box">
	                    	<div class="pet_inner_box">
	                    		<c:if test="${myPet == null }">
			                        <div class="pet_message_container">
			                            <div class="pet_message">응원할 펫이 없습니다</div>
			                        </div>
			                        <div class="pet_img_container">
			                        	<img src="<c:url value="/resources/img/egg.png"></c:url>" alt="펫" class="pet">
			                        </div>
			                    </c:if>
	                    		<c:if test="${myPet != null }">
			                        <div class="pet_message_container">
			                            <div class="pet_message">조금만 더 힘내요!</div>
			                        </div>
			                        <div class="pet_img_container">
			                        	<img src="<c:url value="/resources/img${myPet.ev_img}"></c:url>" width="auto" height="149">
			                        </div>
			                     </c:if>
		                        
		                        <!-- 달성률 -->
		                        <div class="progress_container">
		                            <canvas id="gauge" width="100" height="20"></canvas>
		                            <div>
		                                <p class="success_percent">달성률 ${todoProgressRateint}%</p>
		                            </div> 
		                        </div>
	                    	</div>
	                   </div>
	                    <!-- 펫 박스 끝 -->
	                </div>
	                <!-- 투두 컨테이너 마이 끝 -->
	
	                <!-- 투두 컨테이너 멤버 -->
	                <div class="scroll_box">
	                    <div class="todo_container_member">
 	                         
	                      	<c:forEach items="${stMember}" var="sm" varStatus="vs" >
		                      	<c:if test="${sm.sm_me_id ne memberId}">
		                      	
			                        <div class="todo_box_member_content add_shadow ">
			                            <div class="todo_box_member_title ">
			                                <h3>${sm.me_name}</h3>
			                            </div>
		                                <ul class="todo_list">
		                                
			                              <c:forEach items="${stMemberTodo}" var="td" varStatus="vs" >
			                                   <c:if test="${sm.sm_me_id == td.td_me_id}">
				                                    <li>
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
					                                </li>
				                                </c:if>
			                              </c:forEach>
		                                </ul>                                                         
			                            <div class="progress_container">
		                                    <c:forEach items="${stMemberProgRateList}" var="mp">
			                          			<c:if test="${sm.sm_me_id == mp.sm_me_id}">
				                                	<canvas class="gauge" width="100" height="20"></canvas>
					                                <div>
					                                    <p class="success_percent">달성률<span class="prog">${mp.me_prog_rate}</span>%</p>
					                                </div>
			                                	</c:if>
		                             		</c:forEach>
			                        	</div>
				                    </div>
				                    
				                </c:if>    
							</c:forEach>
							
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
	                    <img class="star" src="<c:url value="/resources/img/favorite_star_on.png"></c:url>">
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
</mian>


<script>
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

                    // 온라인 회원 목록 처리
                    members.forEach(member => {
                        const isOnline = onlineMembers.includes(member.me_name);
                        memberList += createMemberListItem(member, userId, isOnline);
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
        '<div class="study_name">' + member.me_name + '</div>' +
        (userId === member.me_name ? '<span class="your">YOU</span>' : '') +
        '</div>';
}


//게이지바

	// 유저의 게이지 바 
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
	ctx.fillRect(0, 0, fillWidth, barHeight);
	

	
	$(document).ready(function() {
		const stMemberSize = ${stMember.size()};
		
		for (let i = 0; i < stMemberSize; i++) {
		const canvas = $('.todo_box_member_content').eq(i).find('.gauge');
			if(canvas.length ==0) return;
		const name = $('.todo_box_member_content').eq(i).find('.todo_box_member_title h3').text();
		/* console.log("이름: "+name);
		console.log(canvas) */
		const ctx = canvas[0].getContext("2d");
		const value = parseFloat($('.todo_box_member_content').eq(i).find('.prog').text());
		/* console.log("멤버의 게이지값: "+value); */
		
		const max = 100;
		const barWidth = 100;
		const barHeight = 20;
		
		const fillWidth = (value / max) * barWidth;
		ctx.fillStyle = "rgb(0, 128, 255)";
		ctx.fillRect(0, 0, fillWidth, barHeight);
		}
	}); 
	
	
//투두 작성
	const todoInput = document.querySelector(".input_box"); // 할 일 입력란
	const todoList = document.querySelector(".todo_list"); // 할 일 목록
	const todo = todoInput.value;
	// 할 일 입력란에서 Enter 키를 눌렀을 때의 이벤트 핸들러
	todoInput.addEventListener("keypress", (e) => {
		
	    if (e.keyCode === 13 && todoInput.value !== '') { // Enter 키를 눌렀고, 입력란이 비어있지 않은 경우
	    	generateTodo(todoInput.value); // 입력된 할 일을 추가하는 함수 호출
	        todoInput.value = ""; // 입력란 비우기
	    }
	    console.log(1); 
		
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
			    	location.replace("<c:url value='/study/todo/${st_num}'></c:url>");
			    }
			});  
	} 
	
	//투두 삭제
	const clearIcons = document.querySelectorAll('.clear');
	clearIcons.forEach(icon => {
	    icon.addEventListener("click", (e) => {
	        var td_num = e.target.parentNode.parentNode.dataset.num;
	        /* console.log(td_num); */
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
	            	location.replace("<c:url value='/study/todo/${st_num}'></c:url>");
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
	            	location.replace("<c:url value='/study/todo/${st_num}'></c:url>");
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
	            	 location.replace("<c:url value='/study/todo/${st_num}'></c:url>");  
	            }
	        });
	    });
	}); 
	
</script>