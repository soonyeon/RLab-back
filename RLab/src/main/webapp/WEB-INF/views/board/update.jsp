<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/board/insertBoard.css'></c:url>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/board/mypost_post.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<style>
    .note-editable {
        background-color: white;
    }
</style>

<main>
	<div class="main_container">
		<!-- 왼쪽 메뉴바 -->
		<div class="left_menu_container">
			<nav class="left_menu">
            	<a href="study_basic.html" class="list_item">스터디홈</a>
                <a href="#" class="list_item">스터디 달력</a>
                <a href="to_do_list.html" class="list_item">투두 리스트</a>
                <a href="Daily Mission.html" class="list_item">데일리 미션</a>
                <a href="certification_board.html" class="list_item">인증 게시판</a>
                <a href="#" class="list_item">자유 게시판</a>
                <a href="#" class="list_item">스터디 관리</a>
                <a href="#" class="leave">탈퇴하기</a>
        	</nav>
		</div>

		<section>
			<div class="home_container">
				<div class="main_title"></div> 
              <div class="temporary_storage_box"> 
			    <button class="call_temporary_storage" id="openModal">임시저장 불러오기</button>
			     
			    <!-- Modal -->
			    <div id="temporary-list-modal" class="modal-style" style="display: none;">
			      <h2>임시 게시글<button id="deleteAll">전체 삭제</button></h2>
			      <ul id="itemList">
			        <li>
			            <span class="temp-title" data-title="${temp.te_title}" data-content="${temp.te_content}"></span>
              				<button class="deleteBtn" data-id="${temp.te_num}">삭제</button>
			        </li>
			      </ul>
			    </div>
			    <div id="modal-background" class="modal-background" style="display: none;"></div>
			  </div>
              <form action="<c:url value='/board/update/${st_num}/${bd.bo_num}'></c:url>" method="post"> 
              	<input type="hidden" name="bo_me_id" value="${memberId}">
                <input type="hidden" name="bo_st_num" value="${bd.bo_st_num}">
                <h2>스터디명</h2> 
                <select id="choose_study" name="bo_st_num">
                		<option value="${studies.st_num}">${studies.st_name}</option>
                </select> 
                <h2>제목</h2> 
                <div class="recruit_title_box"> 
                  <input type="text" class="bo_title" name="bo_title" value="${bd.bo_title}" maxlength="10" placeholder="제목 10자 이내"> 
                  <input type="hidden" id="table" name="bo_table" value="board"/>
                </div> 
                <h2>내용</h2> 
				  <textarea id="content" name="bo_content"></textarea>  
					<div class="btn_box">
						<button class="ts_btn" type="button">임시저장</button>
						<button class="write_complete_btn" type="submit">수정완료</button>
					</div>
				</form>
			</div> 
		</section>
			<!-- Modal -->
	<div id="temporary-save-modal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; border: 1px solid #ccc; padding: 20px; z-index: 9999;">
	    <h2>임시등록이 완료되었습니다.</h2>
	</div>
	<div id="modal-background" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 9998;"></div>

	
		
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
			</div>
		</div>
	</aside>
</div>

</main>
<script>

$(document).ready(function() {
    // 임시 저장 버튼 클릭시
	$(".ts_btn").on("click", function() {
		
		 const title = $("input[name='bo_title']").val();
		 const content = $("textarea[name='bo_content']").val();
		 
				 
		    if (!title || !content) {
		        alert('제목과 내용을 모두 입력해주세요.');
		        return;
		    }
		const data = {
				te_title: $("input[name='bo_title']").val(),
			    te_content: $("textarea[name='bo_content']").val(),
			    te_me_id: $("input[name='bo_me_id']").val(),
			    te_st_num: $("#choose_study").val(),
			    te_table: $("input[name='bo_table']").val()
			};
			//ajax
			$.ajax({
			    url: '<c:url value="/temporary/save"/>',
			    method: 'POST',
			    data: JSON.stringify(data), //
			    contentType: 'application/json', //
			    success: function (response) {
			        if (response == "success") {
			            $("#temporary-save-modal").show();
			            $("#modal-background").show();
			        } else {
			            alert('임시저장에 실패하였습니다1');
			        }
			    },
			    error: function () {
			        alert('임시저장에 실패했습니다2');
			    }
			});
    });
	function loadTemporaryList() {
	    $.ajax({
	        url: '<c:url value="/temporary/list"/>',
	        method: 'GET',
	        success: function(response) {
	            // 임시저장 목록을 업데이트
	            $('#itemList').empty(); // 기존 목록 삭제
	            response.forEach(function(temp) {
	                $('#itemList').append('<li><span class="temp-title" data-title="' + temp.te_title + '" data-content="' + temp.te_content + '">' + temp.te_title + '</span><button class="deleteBtn" data-id="' + temp.te_num + '">삭제</button></li>');
	            });
	        },
	        error: function() {
	            alert('임시저장 목록을 가져오는데 실패했습니다.');
	        }
	    });
	}
    //임시저장 불러오기를 클릭했을때
    $("#openModal").click(function () {
	    loadTemporaryList();
	    $("#temporary-list-modal").show();
	    $("#modal-background").show();
	});
    
    	

	$("#modal-background").click(function () {
		$("#temporary-list-modal").hide();
		$("#modal-background").hide();
		  });
    
	// 모달창 외를 클릭했을때 닫기
    $("#modal-background").on("click", function() {
        $("#temporary-save-modal").hide();
        $("#modal-background").hide();
    });
	
  //전체 삭제
    $('#deleteAll').on('click', function() {
        $.ajax({
            url: '<c:url value="/temporary/delete/All" />',
            type: 'POST',
            success: function(response) {
                if (response == "success") {
                    $('#itemList').empty();
                } else {
                    alert('전체 삭제에 실패하였습니다.');
                }
            },
            error: function(error) {
                alert('전체 삭제에 실패하였습니다.');
            }
        });
    });
  //개별 삭제
      $(document).on('click', '.deleteBtn', function() {
      const id = $(this).data('id');
    
    	$.ajax({
        url: '<c:url value="/temporary/delete/' + id + '" />',
        type: 'POST',
        success: function(response) {
            loadTemporaryList();
        },
        error: function(error) {
            alert('삭제 실패');
        }
    });
});
	
    $('#itemList').on('click', '.temp-title', function() {
        const title = $(this).data('title');
        const content = $(this).data('content');

    
        $('input[name=bo_title]').val(title);
        $('#content').summernote('code', content);

        
        $("#temporary-list-modal").hide();
        $("#modal-background").hide();
    });
    
  
});
    $('form').submit(function() {
        let title = $('[name=bo_title]').val();
        let content = $('[name=bo_content]').val();
        if (title.trim().length == 0) {
            alert('제목을 입력하세요.');
            return false;
        }
        if (content.trim().length == 0) {
            alert('내용을 입력하세요.');
            return false;
        }
    })
    
  

    $('#content').summernote({
        tabsize: 2,
        height: 300,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });
    
    $('#content').summernote('code','${bd.bo_content}');
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