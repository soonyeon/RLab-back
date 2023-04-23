<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<<style>
.notification {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
    padding: 15px;
    border-radius: 5px;
    display: none;
    z-index: 9999;
}
</style>
<!-- 모달 -->
    <header>
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

  			
          <a href="#" class="btn_home"><i class="icon_home"></i>LAB</a>
          <nav class="top_menu_container">
         	<a href="#" class="list_item">예약하기</a>
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
		  					<c:if test="${user != null}">
			  		    			<img class="alram_img" src="<c:url value='/resources/img/alram.png'></c:url>" width="auto" height="20">
			  		    			<span class="blind">알림</span>
		  		    			</c:if>
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
              				<a class="logout_btn">로그아웃</a>
            			</div>    
              		</form>
		        </c:if>
        	</div>
        </div>
      </div>
    </header>
<script>
$(document).ready(function() {
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
      $('.notification').text(message);
      $('.notification').fadeIn().delay(3000).fadeOut();
  }

if(typeof(EventSource) !== "undefined") {
	  const source = new EventSource("<c:url value='/connect?id=${session.id}' />");

	  source.addEventListener('connect', function(event) {
	    const data = event.data;
	    console.log('connected:', data);
	  });

	  source.addEventListener('newComment', function(event) {
	    const data = JSON.parse(event.data);
	    console.log("Received newComment event:", data); // 이벤트 수신 로그 추가
	    // 알림을 화면에 표시하는 함수 호출
	    showNotification(data.message);
	  });

	  source.onerror = function(event) {
	    console.log('SSE error:', event);
	  };
	}

	function createComment(postId, writerId, content) {
	  $.ajax({
	    type: "POST",
	    url: "<c:url value='/comment/create'/>",
	    contentType: "application/json",
	    data: JSON.stringify({
	      postId: postId,
	      writerId: writerId,
	      content: content
	    }),
	    success: function(response) {
	      console.log("Comment created:", response);
	      // SSE 이벤트를 보내서 새로운 댓글 생성 알림을 받을 수 있도록 함
	      const source = new EventSource("<c:url value='/connect?id=${session.id}' />");
	      source.onopen = function() {
	        console.log("SSE connection opened");
	        source.send('newComment');
	      };
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      console.log("Error creating comment:", jqXHR, textStatus, errorThrown);
	    }
	  });
	}
</script>