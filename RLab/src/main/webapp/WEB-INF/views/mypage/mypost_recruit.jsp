<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
 <link rel="stylesheet" href="<c:url value ='/resources/css/common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/mypage/mypage_common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/tab_common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/table_common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/mypage/mypost_recruit.css?after'></c:url>">
<title>작성글 관리</title>
</head>
<body>
	<div id="total_container">
		<!-- main -->
		<main>
			<div id="main_container">
				<!-- aside(left_menu) -->
				<aside class="left_menu_container">
					<nav class="left_menu">
					  <a href="<c:url value='/mypage'></c:url>" class="list_item">마이페이지 홈</a>
		              <a href="<c:url value='/mypage/pwcheck'></c:url>" class="list_item">개인정보 수정</a>
		              <a href="./book_info_ticket.html" class="list_item">예약 관리</a>
		              <a href="./mystudy_favorite.html" class="list_item">스터디 관리</a>
		              <a href="<c:url value='/mypage/mypost_post'></c:url>" class="list_item">작성글 관리</a>
					</nav>
				</aside>
				
	 			<section>
		            <!-- 탭 -->
		            <div class="tab-container">
		              <a href="<c:url value='/mypage/mypost_post'></c:url>"  class="tab unselected_tab tab1"><div>나의 게시글</div></a>
		              <a href="<c:url value='/mypage/mypost_recruit'></c:url>" class="tab selected_tab tab2"><div>나의 모집글</div></a>
		              <a href="<c:url value='/mypage/mypost_scrap'></c:url>"  class="tab unselected_tab tab3"><div>나의 스크랩</div></a>
		            </div>
		
		            <div class="my_study_container" id="my_container">
		               
		                <div class="study_card_container">
		                  
		
		                    <!-- 나의 모집글 -->
		                    <div class="tab_content">
		                      <!-- 제외 버튼  -->
		                      <div class="except_container">
		                        <div class="except_box">
		                          <label for="ee">모집완료된 스터디 제외</label>
		                          <input type="checkbox" name="" id="ee">
		                        </div>
		                      </div>
		  
		                      <!-- 컨텐트 박스 -->
		                        <div class="content_box">
		                          <c:if test="${myGatherList.size() != 0 }">
		                          	<div class="row_study_card clearfix">
		                              <li class="study_card_box add_shadow op">
		                                  <a href="">
		                                      <div class="study_img_box"></div>
		                                      <div class="study_info">
		                                          <div class="study_tag_info">
		                                              <span href="#" class="study_tag">#자격증</span>
		                                              <span href="#" class="study_tag">#프로젝트</span>
		                                              <span href="#" class="study_tag">#컴퓨터</span>
		                                              <span href="#" class="study_tag">#독서토론</span>
		                                              <span href="#" class="study_tag">#운동</span>
		                                              <span href="#" class="study_tag">#경제학과</span>
		                          
		                                          </div>
		                                          <div class="study_recruit_content_box">
		                                              <span class="study_recruit_content">[서울] 정처기 같이 공부해요 </span>
		                                            </div>
		                                          <div class="study_content">
		                                              <div class="study_recruiting">
		                                                  <span>모집중</span>
		                                                  <span>1</span>
		                                                  <span>/</span>
		                                                  <span>5</span>
		                                              </div>
		                                              <div class="like_img"></div>
		                                          </div>
		                                      </div>
		                                  </a>
		                              	</li>
			                          </div>
									</c:if>
		                          
		                        </div>
		  
		                        <!-- 페이지네이션 -->
		                        <div class="page_box clearfix">
		                          <i class="btn_prev"></i>
		                          <span class="page_num selected">1</span>
		                          <span class="page_num">2</span>
		                          <span class="page_num">3</span>
		                          <i class="btn_next"></i>
		                      </div>
		                    </div>                                         
		                </div>
                  </section> 
			</div>
		</main>

	</div>
<script>	
	$('#edit_info').submit(function(){
		event.preventDefault(); // submit 이벤트 막기
		
		if($("#profile_img").val() != ''){	
			
			var allowedExtensions = ["jpg", "jpeg", "png", "gif"];
			var fileName = $("#profile_img").val();
			var fileExtension = "";
			
			// 파일 이름에서 확장자 추출
	        var i = fileName.lastIndexOf('.');
	        if (i > 0) {
	            fileExtension = fileName.substring(i+1);
	            
		    	// 이미지 파일이 아닌 경우
		        if ($.inArray(fileExtension.toLowerCase(), allowedExtensions) == -1) {
		            alert("이미지 파일 형식이 아닙니다.");
		            return false;
		        }else{	    	 
					alert('이미지가 변경되었습니다.');
					$(this).unbind('submit').submit(); // submit 이벤트 다시 실행	        	
		        }
	        }
		}else{
			alert('파일을 선택해주세요.');
			return false;			
		}
	});


</script>

</body>
</html>