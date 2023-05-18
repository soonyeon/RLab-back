<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://webfontworld.github.io/NanumSquareNeo/NanumSquareNeo.css" rel="stylesheet">
<link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
<!-- header -->
<!-- 모달 -->
<style>
	body {
    font-family: Arial, sans-serif;
	}

	.notification_modal {
	    position: fixed;
	    bottom: 20px;
	    right: 20px;
	    display: none;
	    width: 300px;
	    background-color: white;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    border-radius: 8px;
	    padding: 20px;
	    z-index: 1000;
	}
	
	.notification_content {
	    display: flex;
	    flex-direction: column;
	}
	
	.notification_content h4 {
	    margin-bottom: 8px;
	}
	
	.notification_content p {
	    margin: 0;
	}
</style>
<header>
    <!-- 로그인 모달창 -->
	<div class="modal_container" id="loginModal">
        <div class="modal_area">
        <img class="remove_btn login_remove" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="40">
          <div class="login_box">

            <h2>로그인</h2>
            
            <form action="<c:url value='/login'></c:url>" method="post">
            	<div class="input_forms">
	            	<div class="form_groups">
		              <div class="form_group">
		                <!-- <label for="id"></label> -->
		                <input type="text" class="form_control" id="id" name="me_id" placeholder="아이디">
		              </div>
		              <div class="form_group">
		                <!-- <label for="pw">비번:</label> -->
		                <input type="password" class="form_control" id="pw" name="me_pw" placeholder="비밀번호">
		              </div>
		            </div>  
	              	<button class="btn_outline_success col-12">로그인</button>
              	</div>
			  <div class= "login_stay_box">
			 	 <input type="checkbox" name="autoLogin" value="true"> 
			 	 <p>로그인 상태 유지</p>
			  </div>
              <p class="more_action">
                <a href="#" class="more_action_item 1">아이디 찾기</a> |
                <a href="#" class="more_action_item 2">비밀번호 찾기</a> |
                <a href="<c:url value="/signup"></c:url>" class="more_action_item 3">회원가입</a>
              </p>
            </form>

          </div>
        </div>
      </div>

		<div class="modal_container" id="findIDModal">
		  <div class="modal_area">
		  <img class="remove_btn login_remove" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="40">
		    <div class="login_box find_id_box">
		      <h2>아이디 찾기</h2>

		      <form action="<c:url value='/findID'></c:url>" method="post">
		        <div class="form_group">
		          <!-- <label for="email"></label> -->
		          <input type="email" class="form_control" id="email" name="email" placeholder="이메일">
		        </div>
		        <button class="btn_outline_success col-12" type="button" onclick="findID()">아이디 찾기</button>
			      <p class="more_action">
	                <a href="#" class="more_action_item 0">로그인</a> |
	                <a href="#" class="more_action_item 2_1">비밀번호 찾기</a> |
	                <a href="<c:url value="/signup"></c:url>" class="more_action_item 3">회원가입</a>
	              </p>
		      </form>

		    </div>
		  </div>
		</div>

		<div class="modal_container" id="findPWModal">
		  <div class="modal_area">
		  <img class="remove_btn login_remove" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="40">
		    <div class="login_box find_pw_box">
		      <h2>비밀번호 찾기</h2>

		      <form action="<c:url value='/findPW'></c:url>" method="post">
		      	<div class="input_forms">
			      	<div class="form_groups">
				        <div class="form_group">
				          <input type="text" class="form_control" id="findPW_id" name="me_id" placeholder="아이디">
				        </div>
				        <div class="form_group">
				          <input type="email" class="form_control" id="findPW_email" name="email" placeholder="이메일">
				        </div>
				    </div>
			        <button class="btn_outline_success col-12" type="button" onclick="findPW()">전송</button>
			     </div> 
			      <p class="more_action">
	                <a href="#" class="more_action_item 0_1">로그인</a> |
	                <a href="#" class="more_action_item 1_1">아이디 찾기</a> |
	                <a href="<c:url value="/signup"></c:url>" class="more_action_item 3">회원가입</a>
	              </p>
		      </form>
		    </div>
		  </div>
		</div>


      <div id="header_container">
        <div class="header_left">
          <a href="<c:url value='/'></c:url>" class="btn_home">
          	<i class="icon_home">
          		<img  alt="홈 로고" src="<c:url value='/resources/img/rlab_logo.png'></c:url>" width="auto" height="50">
          	</i>LAB
          </a>
          <nav class="top_menu_container">
         	  <a href="<c:url value='/reservation'></c:url>" class="list_item">예약하기</a>
            <a href="<c:url value='/study/${user.me_study}'></c:url>" class="list_item">스터디</a>
            <a href="<c:url value='/gather/list'></c:url>" class="list_item">모집 게시판</a>
          </nav>
        </div>
        <div class="header_right">
	    	<div class="mypage_container">
	    		<c:if test="${user == null}">
            		<div class="join_box">
            			<a href="#" class="login_modal">로그인</a>
           				<a href="<c:url value='/signup'></c:url>" class="signup_btn">회원가입</a>
           			</div>
        		</c:if> 
		        <c:if test="${user != null}">		  		       
     				<form action="<c:url value='/logout'></c:url>" method="post">     
		  				<div class="logout_box">
              				<div class="alarm_bell_box">
              					<div class="alarm_modal display_none" id="alarmModal" style=" max-height: 200px; overflow-y: auto;">	
								    <c:forEach var="alarm" items="${alarm}">
								   	    <c:if test="${alarm.al_view == 0}">
											<a class="modal_content" href="
											<c:if test='${alarm.al_table=="board"}'><c:url value='/board/detail/${alarm.al_ex_num}'></c:url></c:if>
											<c:if test='${alarm.al_table=="gather"}'><c:url value='/gather/detail/${alarm.al_ex_num}'></c:url></c:if>
											<c:if test='${alarm.al_table=="photo"}'><c:url value='/study/photo/${alarm.al_ex_num}'></c:url></c:if>
											<c:if test='${alarm.al_table=="study"}'><c:url value='/study/${alarm.al_ex_num}'></c:url></c:if>
											">		   
										    	<div class="alarm_content_box">
											    	<div class="new_dot"></div>
											        <p>${alarm.al_content}</p>
										    	</div>  
											    <img class="alarm_remove" data-num="${alarm.al_num}" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="20">
								   			</a>
								   		</c:if>
									    <c:if test="${alarm.al_view == 1}">
											<a class="modal_content read_content" href="
											<c:if test='${alarm.al_table=="board"}'><c:url value='/board/detail/${alarm.al_ex_num}'></c:url></c:if>
											<c:if test='${alarm.al_table=="gather"}'><c:url value='/gather/detail/${alarm.al_ex_num}'></c:url></c:if>
											<c:if test='${alarm.al_table=="photo"}'><c:url value='/study/photo/${alarm.al_ex_num}'></c:url></c:if>
											<c:if test='${alarm.al_table=="study"}'><c:url value='/study/${alarm.al_ex_num}'></c:url></c:if>
											">		
												<div class="alarm_content_box">   
											        <p>${alarm.al_content}</p>
								   				</div>
												<img class="alarm_remove" data-num="${alarm.al_num}" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="20">
								   			</a>
								   		</c:if>
								    </c:forEach> 
								</div> 
              					<!-- 새로운 알람이 있으면 new_dot이 보이게 -->
              					<c:if test="${newAlarm != 0}">
	              					<div class="new_dot bell_dot"></div>
			  		    			<img class="alarm_img" src="<c:url value='/resources/img/alram.png'></c:url>" width="auto" height="20">
			  		    			<span class="blind">알림</span>
		  		    			</c:if>
		  		    			<c:if test="${newAlarm == 0}">
			  		    			<img class="alarm_img" src="<c:url value='/resources/img/alram.png'></c:url>" width="auto" height="20">
			  		    			<span class="blind">알림</span>
		  		    			</c:if>
		  		    		</div>
		  		    		
		  		    		<a href="<c:url value='/mypage'></c:url>" class="icon_mypage">
		  		    			<c:if test="${user.me_profile == null}">
		  		    				<img class="mypage_img" src="<c:url value='/resources/img/user.png'></c:url>" width="auto" height="40">
		  		    				<span class="blind">마이페이지</span>
		  		    			</c:if>
		  		    			
		  		    			<c:if test="${user.me_profile != null}">
			  		    			<img class="mypage_img" src="<c:url value='/download${user.me_profile}'></c:url>" width="auto" height="40">
			  		    			<span class="blind">마이페이지</span>
		  		    			</c:if>
			  		    	</a>
		  		    		<a class="logout_btn">로그아웃</a>
            			</div>    
              		</form>
		        </c:if>
        	</div>
        </div>

    </div>
    <!-- 하단 실시간 알림 -->
	<div id="notificationModal" class="notification_modal">
        <div class="notification_box">
            <h4 class="notification_title">알림</h4>
            <span class="notification_content"></span>
        </div>
    </div> 
    <!-- 상단 알림창 -->
	<div class="alarm_modal display_none" id="alarmModal" style=" max-height: 200px; overflow-y: auto;">	
		<div class="alarm_container">
		    <c:forEach var="alarm" items="${alList}">
		   	    <c:if test="${alarm.al_view == 0}">
					<a class="modal_content" data-num="${alarm.al_num}" href="
					<c:if test='${alarm.al_table=="board"}'><c:url value='/board/detail/${alarm.al_ex_num}'></c:url></c:if>
					<c:if test='${alarm.al_table=="gather"}'><c:url value='/gather/detail/${alarm.al_ex_num}'></c:url></c:if>
					<c:if test='${alarm.al_table=="photo"}'><c:url value='/study/photo/${alarm.al_ex_num}'></c:url></c:if>
					<c:if test='${alarm.al_table=="study"}'><c:url value='/study/${alarm.al_ex_num}'></c:url></c:if>
					">		   
				    	<div class="alarm_content_box">
					    	<div class="new_dot"></div>
					        <p>${alarm.al_content}</p>
				    	</div>  
					    <img class="alarm_remove" data-num="${alarm.al_num}" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="20">
		   			</a>
		   		</c:if>
			    <c:if test="${alarm.al_view == 1}">
					<a class="modal_content read_content" data-num="${alarm.al_num}" href="
					<c:if test='${alarm.al_table=="board"}'><c:url value='/board/detail/${alarm.al_ex_num}'></c:url></c:if>
					<c:if test='${alarm.al_table=="gather"}'><c:url value='/gather/detail/${alarm.al_ex_num}'></c:url></c:if>
					<c:if test='${alarm.al_table=="photo"}'><c:url value='/study/photo/${alarm.al_ex_num}'></c:url></c:if>
					<c:if test='${alarm.al_table=="study"}'><c:url value='/study/${alarm.al_ex_num}'></c:url></c:if>
					">		   
					    <p>${alarm.al_content}</p>
		   				<img class="alarm_remove" data-num="${alarm.al_num}" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="20">
				    </a>
		   		</c:if>
		    </c:forEach> 
	    </div>
	</div> 
</header>

<script>
// login 모달
$(document).ready(function() {
	// 로그인 버튼 click 로그인 모달 show
	$('.login_modal').click(function(e) {
		  e.preventDefault();
		  $('#loginModal').show();
	});
	// x버튼 누르면 로그인 모달 닫기
	$('.remove_btn').click(function(e) {
	    e.preventDefault();
	    $('.modal_container').hide();
	});
	
	// 로그인 -> 아이디 찾기 
	$('.more_action_item.1').click(function(e) {
		  e.preventDefault();
		  $('#loginModal').hide();
		  $('#findIDModal').show();
	});
	// 로그인 -> 비번 찾기
	$('.more_action_item.2').click(function(e) {
		  e.preventDefault();
		  $('#loginModal').hide();
		  $('#findPWModal').show();
	});
	// 아이디 찾기 -> 로그인
	$('.more_action_item.0').click(function(e) {
	    e.preventDefault();
	    $('#findIDModal').hide();
	    $('#loginModal').show();
	});
	// 아이디 찾기 -> 비번찾기
	$('.more_action_item.2_1').click(function(e) {
        e.preventDefault();
        $('#findIDModal').hide();
        $('#findPWModal').show();
    });
	// 비번 찾기 -> 로그인
	$('.more_action_item.0_1').click(function(e) {
	    e.preventDefault();
	    $('#findPWModal').hide();
	    $('#loginModal').show();
	});
	// 비번 찾기 -> 아이디 찾기
	$('.more_action_item.1_1').click(function(e) {
	    e.preventDefault();
	    $('#findPWModal').hide();
	    $('#findIDModal').show();
	});
});

//모달 외 영역 누르면 로그인 모달 닫기
$(document).mouseup(function (e){
	if($(".modal_container").has(e.target).length === 0){
		$(".modal_container").hide();
	}
});

//아이디 찾기
function findID() {
let email = $("#email").val();
$.ajax({
  type: "POST",
  url: "<c:url value='/findID'/>",
  data: {
    email: email
  },
  success: function(response) {
    if (response === "found") {
      alert("이메일로 아이디를 보냈습니다.");
    } else {
      alert("해당 이메일로 등록된 아이디가 없습니다.");
    }
  },
  error: function() {
    alert("이메일로 전송이 실패 했습니다.");
  }
});
}

//비밀번호 찾기
function findPW() {
let id = $("#findPW_id").val();
let email = $("#findPW_email").val();
$.ajax({
  type: "POST",
  url: "<c:url value='/findPW'/>",
  data: {
    id: id,
    email: email
  },
  success: function(response) {
    if (response === "found") {
      alert("이메일로 임시번호를 보냈습니다.");
    } else {
      alert("해당 아이디와 이메일로 등록된 정보가 없습니다.");
    }
  },
  error: function() {
    alert("이메일로 전송이 실패 했습니다.");
  }
});
}

//로그아웃 버튼 클릭 이벤트
$("#logout_btn").on("click", function() {
 $.ajax({
     url: '/logout',
     type: 'POST',
     success: function() {
         location.reload();
     },
     error: function() {
         console.log("Logout request failed");
     }
 });
});

$('.close_btn').click(function(e) {
  e.preventDefault();
  $('.modal_container').hide();
});

$('.logout_btn').click(function(e) {
	e.preventDefault();
	$(this).closest('form').submit();
});

</script>
<script>
var source = null;

// 스크롤 내리면 헤더에 그림자넣기
$("body").on("mousewheel", function(e){
	var wheel = e.originalEvent.wheelDelta;
	var now= $("header").offset().top;
	if(now <= 100){
		$("header").css("box-shadow", "none");
	}
	if(wheel > 0){
	}else{
		$("header").css("box-shadow", "2px 2px 5px #d9cec5ba");
	}
});

// 알림
$(document).ready(function() {
	// 알람 누르면 알람 모달 보이기
	$('.alarm_img').click(function() {
		$('.alarm_modal').show();
	})
});

// 모달 외 영역 눌리면 알림 모달 닫기
$(document).mouseup(function (e){
	if($(".alarm_modal").has(e.target).length === 0){
		$(".alarm_modal").hide();
	}
});

//알림 클릭 시 al.view 0->1 변경
$(document).on("click",'.modal_content',function(){
	let al_num = $(this).data('num');
	$.ajax({
        url: '<c:url value="/update/alview/'+al_num+'"></c:url>',
        type: 'POST',
        success: function() {
        	console.log('알림 확인 변경 성공');
            //location.reload();
        },
        error: function() {
            console.log("알림 확인 변경 실패");
        }
    });
});

//알림 삭제 버튼
$(document).on("click",'.alarm_remove',function(){
	let al_num = $(this).data('num');
	$.ajax({
        url: '<c:url value="/delete/alarm/'+al_num+'"></c:url>',
        type: 'POST',
        success: function() {
            location.reload();
        },
        error: function() {
            console.log("Delete Alarm request failed");
        }
    });
});

connect();

function connect() {
    const userId = "${user.me_id}"; 
    const connectUrl = "<c:url value='/connect' />" + "?id=" + userId;
    source = new EventSource(connectUrl);
    
    source.onopen = function() {
        console.log("SSE connection opened");
    };
    source.addEventListener("connect", function(event) {
        console.log("Received connect event:", event.data);
    });
    
    source.onerror = function(event) {
        console.log("SSE error:", event);
    };
    
    source.addEventListener("newComment", function(event) {
    	console.log('새댓글');
    	//이벤트가 일어날 일을 여기밑에다가 쓰기
		const title = "새로운 댓글";
		const message = '게시글에 댓글이 달렸습니다.';
		showModal(title, message);

		setTimeout(function() {
		    hideModal();
		}, 5000); 
		reloadAlarmModal();
	 });
    
    source.addEventListener("newLike", function (event) {
        // 이벤트가 발생할 때 여기에 코드 작성
        const title = "좋아요 알림";
        const message = '게시글에 좋아요가 추가되었습니다.';
        showModal(title, message);

        setTimeout(function() {
            hideModal();
        }, 5000);
		reloadAlarmModal();
    });
    

    source.addEventListener("joinStudy", function (event) {
        // 이벤트가 발생할 때 여기에 코드 작성
        const title = "스터디 가입 알림";
        const message = '스터디에 새로운 회원이 가입했습니다. 스터디관리로 이동하여 확인해주세요.';
        showModal(title, message);

        setTimeout(function() {
            hideModal();
        }, 5000);
		reloadAlarmModal();
    });
    
    source.addEventListener("leaveStudy", function (event) {
        // 이벤트가 발생할 때 여기에 코드 작성
        const title = "스터디 탈퇴 알림";
        const message = '스터디원이 스터디를 탈퇴하였습니다. 스터디관리로 이동하여 확인해주세요.';
        showModal(title, message);

        setTimeout(function() {
            hideModal();
        }, 5000);
		reloadAlarmModal();
    });
    
    source.addEventListener("authorizeStudy", function (event) {
        // 이벤트가 발생할 때 여기에 코드 작성
        const title = "스터디장 임명";
        const message = '새로운 스터디장으로 임명되었습니다. 스터디관리로 이동하여 확인해주세요.';
        showModal(title, message);

        setTimeout(function() {
            hideModal();
        }, 5000);
		reloadAlarmModal();
    });
    
}
//알림창 새로고침하는 함수
function reloadAlarmModal(){
	$("#alarmModal").load(location.href+" .alarm_container");
}
 
function showModal(title, message) {
    $(".notification_title").text(title);
    $(".notification_content").text(message);
    $(".notification_modal").fadeIn(300);
}

function hideModal() {
    $(".notification_modal").fadeOut(300);
}

//페이지를 떠날 때 연결요청한 source 삭제
$(window).on("beforeunload", function() {
	if(source != null)
		source.close();
});
</script>

