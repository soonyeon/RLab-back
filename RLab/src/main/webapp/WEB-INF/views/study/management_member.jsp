<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">  
<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/management_member.css'></c:url>">

<main>
	<div id="main_container">
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
	    
	    <div class="content_container">
	        <!-- 탭 -->
	        <div class="tab_container">
	            <a href="<c:url value='/study/management/member'></c:url>" class="item_tab  selected tab1">회원 관리</a>
	            <a href="<c:url value='/study/management/study/${st_num}'></c:url>" class="item_tab unselected tab2">스터디 관리</a>
	        </div>
	
	        <div class="my_study_container" id="my_container">
	            <!-- table  -->
	            <div class="table_container">
	
	                <div class="tab_content">

	                    <div class="table_area" id="tabs_3">
	                    	                                        
	                        <table class="border_box">
	                            <thead>
	                                <tr class="board_title_list">
	                                    <td class="title_list_item">닉네임</td>
	                                    <td class="title_list_item">가입일</td>
	                                    <td class="title_list_item"></td>
	                                </tr>
	                            </thead>
	                            
	                            <tbody>
	                            	<c:forEach items="${memberList}" var="sm" varStatus="vs" >
		                                <tr class="board_list">
			                            	<td class="post_title">
		                                        <div class="profile_box">
                                            		<div class="img_box">
	                                                	<img class="profile_img" src="<c:url value='/download${sm.me_profile}'></c:url>"width="auto" height="40">
                                                	</div>
		                                            <span name="me_name" class="">${sm.me_name}</span>
		                                        </div>
		                                    </td>
		                                    <td>${sm.sm_join_date}</td>
		                                    <td>
		                                        <div class="btn_container" >
		                                            <button class="btn_member btn_drop<c:if test="${sm.sm_me_id == user.me_id}"> display_none</c:if>">강퇴</button>
		                                            <button class="btn_member btn_power<c:if test="${sm.sm_me_id == user.me_id}"> display_none</c:if>">스터디장 위임</button>
		                                        </div>
		                                    </td>
		                                </tr>
	                                </c:forEach>
	                                
	
	                            </tbody>
	                        </table>
	                    </div>
	                    
	                    
	                    
	                    <!-- 페이지 이동 -->
	                    <div class="page_area">
	                    
	                    <div class="page_box clearfix">
		                    <c:if test="${pm.prev}">
		                        <a class="page-link" herf="<c:url value='/study/management/member/${st_num}?page=${pm.endPage-1}'></c:url>">
		                        	<i class="btn_prev"></i>
		                        </a>
		                    </c:if>
							<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
								<span class="page_num">										
									<a class="page-link <c:if test="${pm.cri.page == i}"> active</c:if>" href="<c:url value='/study/management/member/${st_num}?page=${i}'></c:url>">${i}</a>
								</span>
							</c:forEach>
	                    
							<c:if test="${pm.next}">										
								<a class="page-link" href="<c:url value='/study/management/member/${st_num}?page=${pm.endPage+1}'></c:url>">
		                        	<i class="btn_next"></i>
		                        </a>
		                    </c:if>
	                    
                    	</div>
                    </div>
                    	
                    	
                  
                </div>
            </div>
        </div>
    </div>

	
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
</main>	
	
	
<script>
//icon_info 마우스 hover시 설명창 나타남
function toggleInfo(target){
	$(target).toggleClass("display_none");
}

$(document).ready(function(){
	$(".info_1, .info_2").hover(function(){
		if(this.classList.contains("info_1")){
			toggleInfo(".info_finish");
		}else if(this.classList.contains("info_2")){
			toggleInfo(".info_delete");
		}
	})
})

// 버튼 클릭시 스터디 선택 여부에 따라 confirm창 나타남
function confirmAction(buttonText, action) {
	
  if (confirm(buttonText)) {
    action();
  } else {
    console.log("작업 취소");
  }
}


$(".btn_drop").on("click", function() {
	let me_name = $(this).parents('.board_list').find('[name=me_name]').text();
	let obj ={
		  me_name: me_name,
		  sm_st_num: ${st_num}
	} 
	
	
  confirmAction("본 회원을 강퇴시키겠습니까?", function() {
	  console.log($(this));
	  $.ajax({
			async:false,
		    type:'POST',
		    data:JSON.stringify(obj),
		    url:"<c:url value='/study/management/member/delete'></c:url>",
		    //서버에서 받는 데이터 타입
		    dataType:"json",
		    //서버에서 보내는 데이터 타입
		    contentType:"application/json; charset=UTF-8",
		    success : function(data){
		        console.log(data);
		    }
		});
	  
		location.replace("<c:url value='/study/management/member/${st_num}'></c:url>");
	    alert("강퇴처리 되었습니다.");
  }); 
	  
});   


  
$(".btn_power").on("click", function() {
	console.log(1)
	let me_name  = $(this).parents('.board_list').find('[name=me_name]').text();
	console.log(me_name);
	
	let obj ={
			me_name: me_name,
			sm_st_num: ${st_num}
	}
	confirmAction("본 회원에게 스터디장을 위임하시겠습니까?", function(){
		$.ajax({	
			async:false,
		    type:'POST',
		    data:JSON.stringify(obj),
		    url:"<c:url value='/study/management/member/authorize'></c:url>",
		    //서버에서 받는 데이터 타입
		    dataType:"json",
		    //서버에서 보내는 데이터 타입
		    contentType:"application/json; charset=UTF-8",
		    success : function(data){
		        console.log(data);
		    }
		});
	location.replace("<c:url value='/study/management/'></c:url>");
    alert("위임처리 되었습니다."); 
	});
	  
});


$('btn_drop').click(function() {
	//조상중에 form태그를 찾아서 action부분을 수정()
	
})


</script>
