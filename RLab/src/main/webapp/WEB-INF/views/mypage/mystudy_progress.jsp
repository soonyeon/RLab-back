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
 <link rel="stylesheet" href="<c:url value ='/resources/css/common.css'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/mypage/mypage_common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/tab_common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/table_common.css?after'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/mypage/mystudy_open.css?after'></c:url>">
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
		              <a href="<c:url value='/mypage/myres_pay'></c:url>" class="list_item">예약 관리</a>
		              <a href="<c:url value='/mypage/mystudy_favorite'></c:url>" class="list_item">스터디 관리</a>
		              <a href="<c:url value='/mypage/mypost_post'></c:url>" class="list_item">작성글 관리</a>
					</nav>
				</aside>
				
	 			<section>
		            <!-- 탭 -->
		            <div class="tab-container">
		              <a href="<c:url value='/mypage/mystudy_favorite'></c:url>"  class="tab unselected_tab tab1"><div>찜한 스터디</div></a>
		              <a href="<c:url value='/mypage/mystudy_open'></c:url>" class="tab unselected_tab tab2"><div>개설한 스터디</div></a>
		              <a href="<c:url value='/mypage/mystudy_progress'></c:url>"  class="tab selected_tab tab3"><div>진행중인 스터디</div></a>
		            </div>
		
		            <div class="my_study_container" id="my_container">		               
			            <div class="study_card_container">			                  	
		                    <!-- 진행중인 스터디 -->
		                    <div class="tab-content ing_study_ul show">
	                    		
	                    
		                	   <!-- 제외 버튼  -->
		                      <div class="except_container"> 
		                        <div class="except_box">
		                          <label for="except_btn">완료된 스터디 제외</label>
		                          <input type="checkbox" name="" id="except_btn" value="on" <c:if test="${pm.cri.filter == 'on'}">checked</c:if>> 
		                        </div>
		                      </div>                
		                      
		                      
		                      <div class="content_box">
			                      <c:if test="${myProgressList.size() != 0 }">	
			                      	<c:forEach begin="0" end="${myProgressList.size()-1}" step="3" var="i">	                         
			                       		<div class="row_study_card clearfix">
			                       			<c:forEach begin="${i}" end="${i+2}" var="index">
			                       				<c:if test="${myProgressList.size()-1 >= index}">
			                       					<c:set var="state" value="${myProgressList.get(index).st_state}"/>
								                         	<li class="study_card_box add_shadow op" value="${state}">
								                         	
					                       						<c:if test="${myProgressList.get(index).st_state == 1}">
										                            <a href="<c:url value='/study/${myProgressList.get(index).st_num}'></c:url>">				                        
										                              <div class ="ing_study_container2">
										                                <div class="study_info2">
										                                    <c:if test="${myProgressList.get(index).st_image == null}">
											                                    <div class="ing_study_img" >
											                                    	<img 
											                                    	src="<c:url value='/resources/img/user.png'></c:url>" width="auto" height="172">
										                                    	</div>
										                                    </c:if>
										                                    <c:if test="${myProgressList.get(index).st_image != null}">
										                                   		<div class="ing_study_img" >
											                                    	<img  
											                                    	src="<c:url value='/download/study/${myProgressList.get(index).st_image}'></c:url>" width="auto" height="172">
										                                    	</div>
										                                    </c:if>
										                                    <div class = "ing_study">
										                                      <div class="ing_study_title">${myProgressList.get(index).st_name}</div>
										                                      <div class="ing_study_title2">${myProgressList.get(index).st_info}</div>
										                                    </div>
										                                    <div class="ing_study_content">
										                                        <div class="study_recruiting3">
										                                             <c:if test="${myProgressList.get(index).st_now_people != myProgressList.get(index).st_total_people}">
											                                            <span>스터디원 수</span>
											                                            <span>${myProgressList.get(index).st_now_people}</span>
											                                            <span>/</span>
											                                            <span>${myProgressList.get(index).st_total_people}</span>
											                                         </c:if>
											                                         <!-- 아니면 st_state가 2일때.. -->
											                                         <c:if test="${myProgressList.get(index).st_now_people == myProgressList.get(index).st_total_people}">
											                                            <span>모집 완료</span>
											                                         </c:if>
										                                        </div>
										                        
										                                    </div>
										                                  </div>
										                                </div>
										                                </a>
											                       </c:if>
											                       
											                      <c:if test="${myProgressList.get(index).st_state == 0}">
											                      	<a href="<c:url value='/study/${myProgressList.get(index).st_num}'></c:url>">	
											                      		<i class="btn_remove"></i>
											                              <div class ="ing_study_container2 gr2">
											                                <div class="study_info2">
											                                    <c:if test="${myProgressList.get(index).st_image == null}">
												                                    <div class="ing_study_img" >
												                                    	<img 
												                                    	src="<c:url value='/resources/img/user.png'></c:url>" width="auto" height="172">
											                                    	</div>
											                                    </c:if>
											                                    <c:if test="${myProgressList.get(index).st_image != null}">
											                                   		<div class="ing_study_img" >
												                                    	<img  
												                                    	src="<c:url value='/download/study/${myProgressList.get(index).st_image}'></c:url>" width="auto" height="172">
											                                    	</div>
											                                    </c:if>
											                                    <div class = "ing_study">
											                                      <div class="ing_study_title">${myProgressList.get(index).st_name}</div>
											                                      <div class="ing_study_title2">${myProgressList.get(index).st_info}</div>
											                                    </div>
											                                    <div class="ing_study_content">
											                                        <div class="study_recruiting3 gr2">
											                                         
											                                            <span>모집 완료</span>
											                                        </div>
											                                    </div>
											                                  </div>
											                               </div>
										                            </a>
											                       </c:if>
								                         	</li>
						                         </c:if>
						                     </c:forEach>
			                         	</div>
			                         </c:forEach>
			                       	</c:if>
		                      </div>
		                      
		                      <c:if test="${myProgressList.size() == 0 || myProgressList == null}">
		                      	<div class="nullMsg">
		                      		<p> 진행중인 스터디가 없습니다.</p>
		                      		<a class="btn_link link_progress" href="<c:url value='/gather/list'></c:url>">모집글 보러가기</a>
		                      	</div>
		                      </c:if>
		                      
			                        <!-- 페이지네이션 -->
			                        <div class="page_box clearfix">
			                         <c:if test="${pm.prev}">
			                     			<a class="page-link" href="<c:url value='/mypage/mystudy_progress?page=${pm.endPage-1}&filter=${pm.cri.filter}'></c:url>">
												<i class="btn_prev"></i>
											</a>
										</c:if>
										<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
											<span class="page_num">										
												<a class="page-link <c:if test="${pm.cri.page == i}"> active</c:if>" href="<c:url value='/mypage/mystudy_progress?page=${i}&filter=${pm.cri.filter}'></c:url>">${i}</a>
											</span>
										</c:forEach>
										<c:if test="${pm.next}">										
											<a class="page-link" href="<c:url value='/mypage/mystudy_progress?page=${pm.endPage+1}&filter=${pm.cri.filter}'></c:url>">
												<i class="btn_next"></i>
											</a>
										</c:if>
			                      	</div> 
			                    </div>                                         
			            </div>
		            </div>
                  </section> 
			</div>
		</main>
	</div>
<script>	
/*$('#except_btn').change(function(){
	if($(this).is(':checked')){
        location.replace('<c:url value="mypage/mypost_recruit?filter=checked"></c:url>');
	}
})*/
$('#except_btn').change(function(){
	 //현재 페이지 주소
	 var url = new URL(window.location.href)
	//현재 페이지의 param들을 찾아온다. (?page나 &filter=같은것들)
	 var params = url.searchParams;
	
	//#except_btn을 checked로 설정하면
	if($(this).is(':checked')){
		//filter의 값을 on으로 변경한다.
		params.set('filter','on');
		
	//#except_btn의 checked를 해제하면
	}else{
		//filter의 값을 off로 변경한다.
		params.set('filter','off');
	}
	
	//http://localhost:8080 + /test/mypage/mypost_recruit + ? + search
	var fullUrl = url.origin + url.pathname + "?" +params.toString();
	//fullUrl로 url 변경
	location.replace(fullUrl);
})

//btn_remove
/*$(document).ready(function(){
	$('.btn_remove').click(function(){
		console.log(1);
		$(this).closest('.study_card_box').hide();
	});
	
});*/
	
	
	


</script>

</body>
</html>