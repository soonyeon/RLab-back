<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/gather/list.css'></c:url>">
<link rel="stylesheet" 	href="<c:url value='/resources/css/common.css'></c:url>">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<main>
	<!-- 검색창 -->
	<section>
	
		<div class="search_container">
		<form action="<c:url value='/gather/list'></c:url>" id="gather_form">
			<div class="search_content">
				<input type="text" class="search_title" placeholder="제목으로 검색하기" name="search" value="${pm.cri.search}">
				<button class="search_icon" type="submit"><img class="icon_search"
					src="<c:url value='/resources/img/serch.png'></c:url>" alt=""></button>
			</div>
			<div class="search_content">
				<input type="text" class="search_tag" placeholder="# 태그로 검색하기" name="tagList[${pm.cri.tagList.size()}]" value="${pm.cri.searchTag}" >
				<c:forEach items="${pm.cri.tagList}" var="tag" varStatus="vs">
					<input type="hidden" name="tagList[${vs.index}]" value="${tag}" class="list_tag">
				</c:forEach>
			</div>
			<input type="hidden" name="region" value="${pm.cri.region}">
			<input type="hidden" name="filter" value="${pm.cri.filter}">
		</form>
			<div class="tag_box">
				<span class="tag_box_name">관련 태그 : </span>
			</div>
		</div>
	</section>

	<!-- 모집 부분 -->
	<div class="result_container">
		<section>
			<div class="flex_box">
				<div class="menu_nav clearfix">
					<div class="recruit_state">
						<div class="recruit_state_title">모집중</div>
							<input type="checkbox" id="switch1" name="switch1" class="input__on-off" value="on" <c:if test="${pm.cri.filter == 'on'}">checked</c:if>>
						<label for="switch1" class="label__on-off">
						  <span class="marble"></span>
						  <span class="on">on</span>
						  <span class="off">off</span>
						</label>
					</div>
					<div class="recruit_tag_box ">
						<span id="tag_title">#태그</span>
						<div class="selectd_tag clearfix">
						<c:forEach items="${pm.cri.tagList}" var="tag" varStatus="vs">
								<a href="" class="sel_hashTag" ><span>${tag}</span>
									<button class="delete_tag">X</button> 
								</a> 
						</c:forEach>
						</div>
					</div>
					<div class="line"></div>
					<div class="sel_region clearfix">
						<span class="region_title">지역</span> 
						<a class="link_region <c:if test='${pm.cri.region == "지역미지정"}'>selected</c:if>" href="#" >지역미지정</a> 
						<a class="link_region <c:if test='${pm.cri.region == "서울특별시"}'>selected</c:if>" href="#" >서울특별시</a> 
						<a class="link_region <c:if test='${pm.cri.region == "경기도"}'>selected</c:if>" href="#" >경기도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "부산광역시"}'>selected</c:if>" href="#" >부산광역시</a> 
						<a class="link_region <c:if test='${pm.cri.region == "인천광역시"}'>selected</c:if>" href="#" >인천광역시</a> 
						<a class="link_region <c:if test='${pm.cri.region == "대구광역시"}'>selected</c:if>" href="#" >대구광역시</a> 
						<a class="link_region <c:if test='${pm.cri.region == "경상북도"}'>selected</c:if>" href="#" >경상북도</a>
						<a class="link_region <c:if test='${pm.cri.region == "경상남도"}'>selected</c:if>" href="#" >경상남도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "대전광역시"}'>selected</c:if>" href="#" >대전광역시</a> 
						<a class="link_region <c:if test='${pm.cri.region == "전라북도"}'>selected</c:if>" href="#" >전라북도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "전라남도"}'>selected</c:if>" href="#" >전라남도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "충청북도"}'>selected</c:if>" href="#" >충청북도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "충청남도"}'>selected</c:if>" href="#" >충청남도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "광주광역시"}'>selected</c:if>" href="#" >광주광역시</a> 
						<a class="link_region <c:if test='${pm.cri.region == "강원도"}'>selected</c:if>" href="#" >강원도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "울산광역시"}'>selected</c:if>" href="#" >울산광역시</a> 
						<a class="link_region <c:if test='${pm.cri.region == "제주특별자치도"}'>selected</c:if>" href="#" >제주특별자치도</a> 
						<a class="link_region <c:if test='${pm.cri.region == "세종특별자치도"}'>selected</c:if>" href="#" >세종특별자치도</a>
					</div>
				</div>
				<div class="make_rc_box">
					<span>바로 지금,나만의 공부메이트</span> 
					<c:if test="${user != null }">
						<a href="<c:url value='/gather/insertstudy'></c:url>"
							class="make_project"> 스터디 만들기</a>
					</c:if>
				</div>
			</div>
		</section>
		<div class="study_card_container">
			<ul>
				<c:if test="${stList.size() != 0}">
					<c:forEach begin="0" end="${stList.size()-1}" step="3" var="i">
							<div class="row_study_card clearfix">
								<c:forEach begin="${i}" end="${i+2}" var="index">
									<c:if  test="${stList.size()-1 >= index}" >
										<li class="study_card_box add_shadow">
											<a href="<c:url value='/gather/detail/${stList.get(index).st_num}'></c:url>">
												<div class="study_img_box">
													<c:if test="${files.size() != 0 }">
														<c:forEach items="${fileList}" var="fi">
															<c:if test="${fi.fi_ex_num == stList.get(index).st_num}">
																<img src="<c:url value='/download${fi.fi_name}'></c:url>" class="study_img">
															</c:if>
														</c:forEach>
													</c:if>	
													<c:if test="${fi.fi_ex_num != stList.get(index).st_num}">
					                        			<img class="study_img" src="<c:url value='/resources/img/recruit_thumb.png'></c:url>">
					                      	 		</c:if>	
												</div>
												<div class="study_info">
													<div class="study_tag_info">
														<c:forEach items="${tagList}" var="ta" varStatus="vs">
															<c:if test="${ta.tr_st_num==stList.get(index).st_num}">
																<span class="study_tag">${ta.tr_name}</span> 
															</c:if>
														</c:forEach>
													</div>
													<div class="study_recruit_content_box">
														<span class="study_recruit_content">[${stList.get(index).st_re_name}]</span>
														<c:forEach items="${gaList}" var="ga">
															<c:if test="${ga.ga_st_num==stList.get(index).st_num}">
																<span> ${ga.ga_title}</span>
															</c:if>
														</c:forEach>
													</div>
											</a>
													<div class="study_content">
													<c:if test="${stList.get(index).st_state == 1 }">
														<div class="study_recruiting">
															<span>모집중</span> 
															<span>${stList.get(index).st_now_people}</span> 
															<span>/</span> 
															<span>${stList.get(index).st_total_people}</span>
														</div>
													</c:if>	
													<c:if test="${stList.get(index).st_state == 0}">
														<div class="study_recruiting">
															<span>모집완료</span> 	
														</div>
													</c:if>
														<div class="want_icon" data-num="${stList.get(index).st_num }">
															<c:if test="${user == null}" >
																<div class="unlike_img"></div>
															</c:if>
															<c:if test="${user != null}">
																<c:if test="${waList.contains(stList.get(index).st_num)}">
																	<div class="like_img"></div>	
																</c:if>
																<c:if test="${!waList.contains(stList.get(index).st_num)}">
																	<div class="unlike_img"></div>	
																</c:if>
															</c:if>
														</div>
													</div>
											</li>
										</c:if >
								</c:forEach>
							</div>
					</c:forEach>
				</c:if>
			</ul>
			<c:if test="${user != null}">
           		 <a class="make_recruit" href="<c:url value='/gather/insertgather'></c:url>">모집글 작성</a>
            </c:if>
            <div class="page_box clearfix">
            	<c:if test="${pm.prev}">
               	 	<a href="<c:url value='/gather/list?page=${pm.startPage-1}'></c:url>"><i class="btn_prev"></i></a>
                </c:if>	 
                <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	               	 <span class="page_num <c:if test="${pm.cri.page == i }">selected</c:if>">
						<a href="<c:url value='/gather/list?page=${i}&search=${pm.cri.search}&searchTag=${pm.cri.searchTag}'></c:url>">${i}</a>
	               	 </span>
                </c:forEach>
                <c:if test="${pm.next}">
                	<a href="<c:url value='/gather/list?page=${pm.endPage+1}&search=${pm.cri.search}&searchTag=${pm.cri.searchTag}'></c:url>"><i class="btn_next"></i></a>
                </c:if>	 
            </div>
		</div>


</main>
<script>	
function getTagStr(){
	let tagStr='';
	if(${pm.cri.tagList.size()>0}){
		<c:forEach items="${pm.cri.tagList}" var="item" varStatus="vs">
			tagStr += "&tagList%5B${vs.index}%5D=${item}";
		</c:forEach>
	} 
	return tagStr;
}

$('.link_region').click(function(){
	let region = $(this).text();
	let tagStr = getTagStr();
	let link = "<c:url value='/gather/list?region="+region+"&search=${pm.cri.search}&filter=${pm.cri.filter}"+tagStr+"'></c:url>";
	location.replace(link);
});

$('#switch1').change(function(){
	let tagStr = getTagStr();
	if(${pm.cri.filter != 'on'}){
		location.replace('<c:url value="/gather/list?filter=on&region=${pm.cri.region}&search=${pm.cri.search}'+tagStr+'"></c:url>');
	}else{
		location.replace('<c:url value="/gather/list?filter=off&region=${pm.cri.region}&search=${pm.cri.search}'+tagStr+'"></c:url>');	
	}
})
//지역검색
$(document).ready(function(){
  $('.sel_region a').click(function(e){
    //e.preventDefault(); // 기본 동작 중지
    $('.sel_region .selected').removeClass('selected');
    $(this).addClass('selected');
  });
});

//태그 삭제
$(document).on('click', '.delete_tag', function(e){
	e.preventDefault();
	var tag = $(this).prev().text()
	console.log(tag)
	$('.list_tag').each(function(){
		console.log($(this).val()==tag)
		if($(this).val()==tag)
			$(this).remove();
	})
  $(this).parent().remove();
  $('#gather_form').submit();
});
//a태그 새로고침 막아주는 스크립트
$(document).on('click', '.sel_hashTag', function(e){
	e.preventDefault();
});


//실시간 태그 검색
$(document).ready(function(){
	$('.search_tag').on("propertychange change paste input", function() {
		let search = $('.search_tag').val();
		let obj = {
				'ta_name' : search
			}
		$.ajax({
	        url: '<c:url value="/gather/search"></c:url>',
	        type: 'POST',
	        data: JSON.stringify(obj),
	        contentType: 'application/json',
	        dataType: 'json',
	        success: function(data) {
	        	let list = data.list;
	        	let tagStr = '<span class="tag_box_name">관련 태그 : </span>';
	        	for(i=0;i<list.length;i++){
        			tagStr += '<a href="#" class="hashTag">#'+list[i]+'</a>';
	        	}
	        	$('.tag_box').html(tagStr);
	        },
	        error: function( request, status, error ){
	            console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
	           }
		})
	});
})

//검색된 태크 클릭하면 해당 태그로 필터링
$(document).on('click','.hashTag', function(){
	let tag = $(this).text().substring(1);
	let tagStr = '<input type="hidden" name="tagList[${pm.cri.tagList.size()}]" value="'+tag+'" class="list_tag">';
	$('.search_content').eq(1).append(tagStr);
	$('.search_tag').eq(0).remove();
	$('#gather_form').submit();
})

//모집글 좋아요
const userId = '${user.me_id}'; 

$(document).ready(function() {
  $('.want_icon').on('click', function() {
	  const studyNum = $(this).data('num');
	want(studyNum);
  });
  
  function want(studyNum) {
	  if(${user == null}){
		  alert('로그인이 필요한 기능입니다')
		  return;
	  }
	    // 데이터
	    var requestData = {
	      wa_me_id: userId,
	      st_num: studyNum
	    };
	    $.ajax({
	      url: '<c:url value="/wantst" />',
	      type: 'POST',
	      contentType: "application/json",
	      data: JSON.stringify(requestData),
	      success: function(response) {
	        if (response && response.wantState === 1) {
	          	alert('스터디를 찜 했습니다.');
	        	 location.reload();
	        } else if (response && response.wantState === 0) {
	        	 location.reload();
	          alert('스터디 찜을 취소 했습니다.');
	        }
	      },
	      error: function(error) {
	    	  console.log(error)
	        alert('찜에 실패하였습니다. 다시 시도해주세요');
	      }
	      
	    });
	  }
	});
</script>