<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<!-- 모달 -->
<style>
	.notification {
	  position: fixed;
	  top: 20px;
	  left: 50%;
	  transform: translateX(-50%);
	  z-index: 9999;
	}
	
	body {
    font-family: Arial, sans-serif;
	}

	.notification-modal {
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
	
	.notification-content {
	    display: flex;
	    flex-direction: column;
	}
	
	.notification-content h4 {
	    margin-bottom: 8px;
	}
	
	.notification-content p {
	    margin: 0;
	}
</style>
    <header>
      <div class="notification" style="display:none;"></div>
    <!-- 로그인 모달창 -->
      <div class="modal_container" id="loginModal">
        <div class="modal_area">
          <a href="#" class="close_btn">x</a>
          <div class="login_box">

            <h1>로그인</h1>
            
            <form action="<c:url value='/login'></c:url>" method="post">
              <div class="form_group">
                <!-- <label for="id"></label> -->
                <input type="text" class="form_control" id="id" name="me_id" placeholder="아이디">
              </div>
              <div class="form_group">
                <!-- <label for="pw">비번:</label> -->
                <input type="password" class="form_control" id="pw" name="me_pw" placeholder="비밀번호">
              </div>
              <button class="btn_outline_success col-12">로그인</button>
			  <input type="checkbox" name="autoLogin" value="true"> 자동로그인
              <hr>
              <p class="more_action">
                <a href="#" class="more_action_item 1">아이디 찾기</a> |
                <a href="#" class="more_action_item 2">비밀번호 찾기</a> |
                <a href="<c:url value="/singup"></c:url>" class="more_action_item 3">회원가입</a>
              </p>
            </form>

          </div>
        </div>
      </div>

		<div class="modal_container" id="findIDModal">
		  <div class="modal_area">
		    <a href="#" class="close_btn">x</a>
		    <div class="find_id_box">
		      <h1>아이디 찾기</h1>

		      <form action="<c:url value='/findID'></c:url>" method="post">
		        <div class="form_group">
		          <!-- <label for="email"></label> -->
		          <input type="email" class="form_control" id="email" name="email" placeholder="이메일">
		        </div>
		        <button class="btn_outline_success col-12" type="button" onclick="findID()">아이디 찾기</button>
		      </form>

		    </div>
		  </div>
		</div>

		<div class="modal_container" id="findPWModal">
		  <div class="modal_area">
		    <a href="#" class="close_btn">x</a>
		    <div class="find_pw_box">
		      <h1>비밀번호 찾기</h1>

		      <form action="<c:url value='/findPW'></c:url>" method="post">
		        <div class="form_group">
		          <input type="text" class="form_control" id="findPW_id" name="me_id" placeholder="아이디">
		        </div>
		        <div class="form_group">
		          <input type="email" class="form_control" id="findPW_email" name="email" placeholder="이메일">
		        </div>
		        <button class="btn_outline_success col-12" type="button" onclick="findPW()">전송</button>
		      </form>
		    </div>
		  </div>
</div>


      <div id="header_container">
        <div class="header_left">

  
          <a href="<c:url value='/'></c:url>" class="btn_home"><i class="icon_home"></i>LAB</a>
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
              				<a class="logout_btn">로그아웃</a>
		  		    			<img class="alram_img" src="<c:url value='/resources/img/alram.png'></c:url>" width="auto" height="20">
		  		    			<span class="blind">알림</span>
		  		    		<a href="<c:url value='/mypage'></c:url>" class="icon_mypage">
		  		    			<c:if test="${user.me_profile == null}">
		  		    				<img class="mypage_img" src="<c:url value='/resources/img/user.png'></c:url>" width="auto" height="40">
		  		    				<span class="blind">마이페이지</span>
		  		    			</c:if>
		  		    			
		  		    			<c:if test="${user.me_profile != null}">
			  		    			<img class="mypage_img" src="<c:url value='/download/profile/${user.me_profile}'></c:url>" width="auto" height="40">
			  		    			<span class="blind">마이페이지</span>
		  		    			</c:if>
			  		    	</a>
            			</div>    
              		</form>
		        </c:if>
        	</div>
        </div>
      </div>	
      		   <div id="notificationModal" class="notification-modal">
			        <div class="notification-content">
			            <h4 id="notificationTitle">알림</h4>
						<c:choose>
							<c:when test="${notification.alarm_type == 'COMMENT'}">
									올리신 게시글에 댓글이 달렸습니다.
							</c:when>
							<c:when test="${notification.alarm_type == 'LIKE'}">
									올리신 게시글이 좋아요를 받았습니다.
							</c:when>
						</c:choose>
			        </div>
			    </div>
      			
			<div class="alarm_modal" id="alarmModal" style="height: 200px; overflow-y: scroll;">			   
			    <img class="alram_img2" src="<c:url value='/resources/img/alram.png'></c:url>" width="auto" height="20">
			    <c:forEach var="alarm" items="${alarm}">  
			        <p>${alarm.al_content}</p>
			        <hr>
			    </c:forEach> 
			</div> 
    </header>
<script>
let source;

$(document).ready(function() {
	 $('.alram_img').click(
		      function() {
		        $('#alarmModal').show();
		      }/*,
		       function() {
		        $('#alarmModal').hide();
		      } /*
		      function() {
			        $('#alarmModal').hide();
			      }
		      */
		    );
	/* $(document).mouseup(function(e){
			var modal = $('#alarmModal');
			if(!modal.is(e.target)&& modal.has(e.target.length === 0) {
				modal.hide();
			}
		});*/
		
	  $('#alarmModal').click(
		     function() {
		        $('#alarmModal').show();
		      },
		      function() {
		        $('#alarmModal').hide();
		      }
		    );
		    // 로그아웃 버튼 클릭 이벤트
		    $("#logout_btn").on("click", function() {
		        // 로그아웃 POST 요청
		        $.ajax({
		            url: '/logout',
		            type: 'POST',
		            success: function() {
		                // 로그아웃 성공 후 페이지 새로고침
		                location.reload();
		            },
		            error: function() {
		                console.log("Logout request failed");
		            }
		        });
		    });
	
    function connect() {
        const userId = "${user.me_id}"; 
        console.log(userId);
        const connectUrl = "<c:url value='/connect' />" + "?id=" + userId;
         source = new EventSource(connectUrl);
         let bt = "${board.bo_title}"
        
        source.onopen = function() {
            console.log("SSE connection opened");
        };
        
        source.addEventListener("connect", function(event) {
            console.log("Received connect event:", event.data);
        });
        
        source.onerror = function(event) {
            console.log("SSE error:", event);
        };
        source.addEventListener("newComment", function (event) {
        	//이벤트가 일어날 일을 여기밑에다가 쓰기
	  	    const data = JSON.parse(event.data);
        	console.log(event);
		    const title = "새로운 댓글";
		    const message = '게시글에 댓글이 달렸습니다.';
		    showModal(title, message);
		
		    setTimeout(function() {
		        hideModal();
		    }, 5000); 
  	      console.log("Received newComment event:", data);
  	      showNotification(data.message);
  	    });
        
        source.addEventListener("newLike", function (event) {
            // 이벤트가 발생할 때 여기에 코드 작성
            const data = JSON.parse(event.data);
            const title = "좋아요 알림";
            const message = '게시글에 좋아요가 추가되었습니다.';
            showModal(title, message);

            setTimeout(function() {
                hideModal();
            }, 5000);
            console.log("Received newLike event:", data);
            showNotification(data.message);
        });
        source.addEventListener("joinStudy", function (event) {
            // 이벤트가 발생할 때 여기에 코드 작성
            const data = JSON.parse(event.data);
            const title = "스터디 가입 신청이 도착했습니다";
            const message = '스터디에 가입 신청을 하셨습니다. 스터디관리로 이동하여 확인해주세요. .';
            showModal(title, message);

            setTimeout(function() {
                hideModal();
            }, 5000);
            console.log("Received joinStudy event:", data);
            showNotification(data.message);
        });
        source.addEventListener("leaveStudy", function (event) {
            // 이벤트가 발생할 때 여기에 코드 작성
            const data = JSON.parse(event.data);
            const title = "스터디 탈퇴 알림";
            const message = '스터디관리로 이동하여 확인해주세요.';
            showModal(title, message);

            setTimeout(function() {
                hideModal();
            }, 5000);
            console.log("Received leaveStudy event:", data);
            showNotification(data.message);
        });
        source.addEventListener("authorizeStudy", function (event) {
            // 이벤트가 발생할 때 여기에 코드 작성
            const data = JSON.parse(event.data);
            const title = "스터디 위임 알림";
            const message = '스터디관리로 이동하여 확인해주세요.';
            showModal(title, message);

            setTimeout(function() {
                hideModal();
            }, 5000);
            console.log("Received authorizeStudy event:", data);
            showNotification(data.message);
        });
    }

    connect();
	
	
	
	
    $('.login_modal').click(function(e) {
      e.preventDefault();
      $('#loginModal').show();
    });

    $('.more_action_item.1').click(function(e) {
      e.preventDefault();
      $('#loginModal').hide();
      $('#findIDModal').show();
    });

    $('.more_action_item.2').click(function(e) {
      e.preventDefault();
      $('#loginModal').hide();
      $('#findPWModal').show();
    });

    $('.close_btn').click(function(e) {
      e.preventDefault();
      $('.modal_container').hide();
    });
  });
  
	function showModal(title, message) {
	    $("#notificationTitle").text(title);
	    $("#notificationMessage").text(message);
	    $("#notificationModal").fadeIn(300);
	}
	
	function hideModal() {
	    $("#notificationModal").fadeOut(300);
	}

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

  $('.logout_btn').click(function(e) {
    e.preventDefault();
    $(this).closest('form').submit();
  });
  function showNotification(message) {
	  console.log("showNotification called with message:", message);
	  $(".notification").text(message);
	  $(".notification").fadeIn().delay(3000).fadeOut();
	}
  $(document).ready(function () {
	    if ('${board.bo_num}' == '')
	      return;
	    const source = new EventSource(`/sse/new/comment/${bo_num}`);

	    source.onopen = function () {
	      console.log("SSE connection opened");
	    };

	    source.addEventListener("newComment", function (event) {
	      const data = JSON.parse(event.data);
	      console.log("Received newComment event:", data);
	      showNotification(data.message);
	    });

	    source.onerror = function (event) {
	      console.log("SSE error:", event);
	    };
	    
	    const sourceNewLike = new EventSource(`/sse/new/photo/${ph_num}`);

	    sourceNewLike.onopen = function () {
	        console.log("SSE connection for newLike opened");
	    };

	    sourceNewLike.addEventListener("newLike", function (event) {
	        const data = JSON.parse(event.data);
	        console.log("Received newLike event:", data);
	        showNotification(data.message);
	    });

	    sourceNewLike.onerror = function (event) {
	        console.log("SSE error for newLike:", event);
	    };
	  });
</script>