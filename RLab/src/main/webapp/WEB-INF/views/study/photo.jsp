<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

<link rel="stylesheet" href="<c:url value='/resources/css/study/photo.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
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
                        <div class="time_line_container_top">
                            <div class="time_line_title"> 인증 게시판</div>
                            	<div class="time_line_cover">
		                           <div class="time_line_container2">
		                           		<div id="modal" class="modal">
									        <div class="modal-content">
									            <span ><img class="close" src="<c:url value='/resources/img/delete.png'></c:url>"></span>
										         <div class="inner_container">
										            <h2>인증하기 양식</h2>
										            <form>
										            	<div class="inner_item">
											            	<label for="category">카테고리 선택</label>
											                <select id="ph_pt_num" name="ph_pt_num">
										                		<c:forEach var="pt" items="${ptList}">
											                   	 <option value="${pt.pt_num}">${pt.pt_name}</option>
										                		</c:forEach>
											                </select>
										                </div>
										                <div class="inner_item">
											                <label for="photo">사진</label>
											                <input type="file" id="photo" name="photo" accept="image/*">
										                </div>
										                <div class="inner_item">
											                <label for="content">내용입력</label>
											                <textarea id="content" name="content" rows="4" cols="50" maxlength="100" placeholder="내용은 100자 이내"></textarea>
										                </div>
										                
										                <button class="register_btn">등록하기</button>
										           </form>
										        </div>  
					                       </div>
				                    	</div>
								        <c:choose>
								            <c:when test="${empty photos}">
								                <div class="no_certification_message">
								                     오늘의 인증글이 없습니다. <br>
								                     가장 먼저 인증글을 올려보세요!
								                </div>
								            </c:when>
								            <c:otherwise>
								                <div class="today_feed_board">
								                    <c:forEach var="photo" items="${photos}">
								                        <div class="board">
								                        
								                        	<div class="profile_box">
								                        		<div class="user_box">
									                        		<c:if test="${photo.me_profile == null }">
									                        			<div class="photo_feed_img_box">
										                        			<img class="photo_feed_img" src="<c:url value='/resources/img/user.png'></c:url>" width="auto" height="40px">
										                        		</div>
										                        	</c:if>	
										                        	<c:if test="${photo.me_profile != null }">
										                        		<div class="photo_feed_img_box">
										                        			<img class="photo_feed_img" src="<c:url value='/download${photo.me_profile}'></c:url>"width="auto" height="40px">
										                        		</div>
										                        	</c:if>	
										                            <div class="feed_name">${photo.me_name}</div>
									                            </div>
									                            <div class="feed_date">${photo.ph_register_date_str}</div>
								                            </div>
								                            <div class="feed_contents_img">
								                                <img width="auto" height="350"src="<c:url value='/download${photo.ph_img}'/>" alt="이미지">
								                            </div>
								                            <div class="middle_container3">
								                                <input type="hidden" id="like_clicked_image_url" value="<c:url value='/resources/img/like_clicked.png'/>">
								                                <input type="hidden" id="like_off_image_url" value="<c:url value='/resources/img/like_off.png'/>">
								                                <c:choose>
								                                    <c:when test="${likeCounts[photo.ph_num] > 0 && userLikes[photo.ph_num]}">
								                                        <img class="feed_like_img" data-photo-id="${photo.ph_num}" src="<c:url value='/resources/img/like_clicked.png'/>" />
								                                    </c:when>
								                                    <c:otherwise>
								                                        <img class="feed_like_img" data-photo-id="${photo.ph_num}" src="<c:url value='/resources/img/like_off.png'/>" />
								                                    </c:otherwise>
								                                </c:choose>
								                                <div class="feed_like_count">${likeCounts[photo.ph_num]}</div>
								                            </div>
								                            <div class="middle_container2">
								                                <span class="feed_contents">${photo.ph_content}</span>
								                            </div>
								                        </div>
								                        <hr>
								                    </c:forEach>
								                </div>
								            </c:otherwise>
								        </c:choose>
		    						</div>
		    						<div class="circle_btn">인증하기</div>
		    					</div>
							</div>
						<!--  	 <div id="modal" class="modal">
					        <div class="modal-content">
					            <span class="close">&times;</span>
					            <h2>인증하기 양식</h2>
					            <form>
					                <label for="photo">사진:</label>
					                <input type="file" id="photo" name="photo" accept="image/*">
					                <br>
					                <label for="content">내용입력:</label>
					                <textarea id="content" name="content" rows="4" cols="50" maxlength="500" placeholder="내용은 500자 이내"></textarea>
					                <br>
					                <label for="category">카테고리 선택:</label>
						                <select id="ph_pt_num" name="ph_pt_num">
					                <c:forEach var="pt" items="${ptList}">
						                    <option value="${pt.pt_num}">${pt.pt_name}</option>
					                </c:forEach>
						                </select>
					                <button>등록하기</button>
					           </form>
	                       </div>
                    	</div>-->
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
const likeclickedImageUrl = $("#like_clicked_image_url").val();
const likeOffImageUrl = $("#like_off_image_url").val();
$(document).ready(function() {
    var modal = $("#modal");

    var btn = $(".circle_btn");

    var span = $(".close");

    btn.click(function() {
        modal.show();
    });

    span.click(function() {
        modal.hide();
    });

    $(window).click(function(event) {
        if (event.target == modal[0]) {
            modal.hide();
        }
    });
});
//모달 외 영역 눌리면 인증 양식 모달 닫기
	$(document).mouseup(function (e){
		if($("#modal").has(e.target).length === 0){
			$("#modal").hide();
		}
	});
	$(".register_btn").click(function(e){
		
		 e.preventDefault();
		    let formData = new FormData();
		    formData.append('photo', $('#photo')[0].files[0]);
		    formData.append('content', $('#content').val());
		    formData.append('ph_pt_num', $('#ph_pt_num').val());
		    formData.append('ph_st_num', ${st_num});
		   // formData.append('mi_num',${mi_num});
		    console.log(formData);
		    $.ajax({
		        type: "POST",
		        url: "<c:url value='/study/photo/insert'/>",
		        data: formData,
		        processData: false,
		        contentType: false,
		        success: function(response){
		            if(response === "success"){
		                alert("인증이 등록되었습니다.");
		                location.reload();
		            }else if(response === "already"){
		            	alert("이미 오늘의 인증을 완료했습니다.")
		            }else if(response == "noMission"){
		     			alert("오늘의 미션이 아직 등록되지 않았습니다.")	
		            }else{
		                alert("인증 등록에 실패했습니다.");
		            }
		        },
		        error: function(e){
		            console.log(e);
		        }
		    });
		

});

$(".feed_like_img").on("click", function () {
    const li_ph_num = $(this).data("photo-id");
    const $likeCount = $(this).siblings(".feed_like_count");
    const $likeImg = $(this).children(".feed_like_img");

    $.ajax({
    	url: '<c:url value="/study/toggleLike" />',
        type: "POST",
        data: {
            li_ph_num: li_ph_num
        },
        success: function (response) {
            if (response === "inserted" || response === "updated") {
                $likeImg.attr("src", likeclickedImageUrl);
                $likeCount.text(parseInt($likeCount.text()) + 1);
                location.reload();
            } else if (response === "canceled") {
                $likeImg.attr("src", likeOffImageUrl);
                $likeCount.text(parseInt($likeCount.text()) - 1);
                location.reload();
            }
        },
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
