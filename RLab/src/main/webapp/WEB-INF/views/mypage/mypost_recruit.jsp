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
		                          <label for="except_btn">모집완료된 스터디 제외</label>
		                          <input type="checkbox" name="" id="except_btn">
		                        </div>
		                      </div>
		  
		                      <!-- 컨텐트 박스 -->
		                        <div class="content_box">
		                        <!-- myGatherList가 0 이 아니면 실행 -->
		                          <c:if test="${myGatherList.size() != 0 }">
		                          	<!-- 0부터 myGatherList의 수가 끝날 때까지 row_study_card가 3개씩 반복 -->
		                          	<c:forEach begin="0" end="${myGatherList.size()-1}" step="3" var="i">
			                          	<div class="row_study_card clearfix">
			                          		<!-- 모집글 하나가 index -->
			                          		<c:forEach begin="${i}" end="${i+2}" var="index">
				                          		<c:if test="${myGatherList.size()-1 >= index}">
				                          		  <c:set var="state" value="${myGatherList.get(index).st_state}"/>
					                              <li class="study_card_box add_shadow op st_state" value="${state}">
					                                  <a href="<c:url value='/gather/detail/${myGatherList.get(index).st_num}'></c:url>">
					                                      <div class="study_img_box">
					                                      	<c:if test="${myGatherList.get(index).st_image == null}">
					                                      		<img class="mypage_img" src="<c:url value='/resources/img/recruit_thumb.png'></c:url>">
					                                      	</c:if>
					                                      	<c:if test="${myGatherList.get(index).st_image != null}">					                                      	
						                                      	<img class="" src="<c:url value='/download/study/${myGatherList.get(index).st_image}'></c:url>">					                                      	
					                                      	</c:if>
					                                      </div>
					                                      <div class="study_info">
					                                      	<!-- tag 리스트 -->
				                                      		<div class="study_tag_info">
																<c:forEach items="${tagList}" var="ta" varStatus="vs">
																	<c:if test="${ta.tr_st_num == myGatherList.get(index).st_num}">
																		<span class="study_tag">${ta.tr_name}</span> 
																	</c:if>
																</c:forEach>
															</div>
					                                          <div class="study_recruit_content_box">
					                                              <span class="study_recruit_content">[${myGatherList.get(index).st_re_name}] ${myGatherList.get(index).gatherVO.ga_title} </span>
					                                          </div>
					                                      		<!-- 모집중 상태 -->
					                                          <div class="study_content">
					                                              <div class="study_recruiting">
					                                                  <span>모집중</span>
					                                                  <span>${myGatherList.get(index).st_now_people}</span>
					                                                  <span>/</span>
					                                                  <span>${myGatherList.get(index).st_total_people}</span>
					                                              </div>
					                                             <!-- like -->
										                         <div class="want_icon">
																	<c:if test="${user == null}" >
																		<div class="unlike_img"></div>
																	</c:if>
																	<c:if test="${user != null}">
																		<c:if test="${wantList.contains(myGatherList.get(index).st_num)}">
																			<div class="like_img"></div>	
																		</c:if>
																		<c:if test="${!wantList.contains(myGatherList.get(index).st_num)}">
																			<div class="unlike_img"></div>	
																		</c:if>							
																	</c:if>
																</div>
					                                          </div>
					                                      </div>
					                                  </a>
					                              </li>
					                        	</c:if>
				                          	</c:forEach>
				                          </div>
				                     	</c:forEach>
									</c:if>
		                          
		                        </div>
		  
		                        <!-- 페이지네이션 -->
		                        <div class="page_box clearfix">
		                         <c:if test="${pm.prev}">
		                     			<a class="page-link" href="<c:url value='/mypage/mypost_recruit?page=${pm.endPage-1}'></c:url>">
											<i class="btn_prev"></i>
										</a>
									</c:if>
									<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
										<span class="page_num">										
											<a class="page-link <c:if test="${pm.cri.page == i}"> active</c:if>" href="<c:url value='/mypage/mypost_recruit?page=${i}'></c:url>">${i}</a>
										</span>
									</c:forEach>
									<c:if test="${pm.next}">										
										<a class="page-link" href="<c:url value='/mypage/mypost_recruit?page=${pm.endPage+1}'></c:url>">
											<i class="btn_next"></i>
										</a>
									</c:if>
		                      </div>
		                    </div>                                         
		                </div>
                  </section> 
			</div>
		</main>
${myGatherList}
	</div>
<script>	
	$(document).ready(function(){
		$('#except_btn').click(function(){
			if($(this).is(':checked')){
				$('.st_state').each(function(){
					if($(this).val() !== 1){
						$(this).hide();
					}
				});
			} else {
				$('.study_card_box').show();
			}
		})
	})

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