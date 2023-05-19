<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>작성글 관리</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/list.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/0639c8d8d2.js" crossorigin="anonymous"></script>


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
					</nav>
				</div>
				<div class="left_bottom_menu">
					<a href="#" class="leave_btn">탈퇴하기</a>
					<c:if test="${leaderCount != 0 && leaderCount != null}">
						<a class="manage_btn" href="<c:url value='/study/management'></c:url>" class="list_item">스터디 관리</a>
					</c:if>
				</div>
			</div>

		<section>
			<div class="home_container">
				<h2 class="time_line_title">자유게시판</h2>
				<div class="my_study_container" id="my_container">

					<div class="study_card_container">
						<!-- table  -->
						
						<div class="table_container">
							<div class="tab_content">
							  <div class="select_box_area">
							  	<a class="write_btn" href="<c:url value="/board/insert/${st_num}"></c:url>" style="float: right;">작성하기</a>
		                      	<select class="sort_box" name="sort">
										<option value="" <c:if test="${pm.cri.sort==''}">selected</c:if>>전체보기</option>
										<option value="date" <c:if test="${pm.cri.sort=='date'}">selected</c:if>>최신순</option>
										<option value="views" <c:if test="${pm.cri.sort=='views'}">selected</c:if>>조회순</option>
										<option value="scrap" <c:if test="${pm.cri.sort=='scrap'}">selected</c:if>>스크랩순</option>
								</select>
		                    </div>
								<!-- 나의 게시글 -->
								<div class="table_area_1" id="tabs_1">
									<!-- <div class="tab-content_tabel_area 1"> -->
									<table class="border_box">
										<tr class="board_title_list">
											<td class="title_list_item">번호</td>
											<td class="title_list_item">스터디명</td>
											<td class="title_list_item">제목</td>
											<td class="title_list_item">작성자</td>
											<td class="title_list_item">작성일</td>
											<td class="title_list_item">조회수</td>
											<td class="title_list_item">스크랩</td>
										</tr>
										<c:forEach var="board" items="${boardList}">
											<tr class="board_list_${board.bo_num} link_item"  onclick="location.href='<c:url value='/board/detail/${st_num}/${board.bo_num}'/>';">
												<td>${board.bo_num}</td>
												<td>${board.st_name}</td>
												<td class="post_title"> ${board.bo_title}</td>
												<td>${board.me_name}</td>
												<td>${board.bo_reg_date_str}</td>
												<td>${board.bo_views}</td>
												<td>${board.scrap_count}</td>
											</tr>
										</c:forEach>
									</table>
								<!-- <a class="write_btn" href="<c:url value="/board/insert/${st_num}"></c:url>" style="float: right;">작성하기</a> -->	
								</div>
								<div class="page_box clearfix">
									<c:if test="${pm.prev}">
										<a href="<c:url value='/board/list/${st_num}?page=${pm.startPage-1}&pageSize=${ph.pageSize}'/>"> <i class="btn_prev"></i></a>
									</c:if>
									<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
										<span class="page_num">
											<a class="page_link<c:if test="${pm.cri.page == i}"> selected</c:if>" href="<c:url value='/board/list/${st_num}?page=${i}'/>">${i}</a>
										</span>
									</c:forEach>
									<c:if test="${pm.next}">
										<a href="<c:url value='/board/list/${st_num}?page=${pm.endPage+1}'/>"><i class="btn_next"></i></a>
									</c:if>
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
  $('select[name="sort"]').on('change', function() {
    let sort = $(this).val();
    let url = '/RLab/board/list/${st_num}?sort=' + sort;
    window.location.href = url;
  });
});
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