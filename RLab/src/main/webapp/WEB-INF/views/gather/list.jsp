<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/gather/list.css'></c:url>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/common.css'></c:url>">
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
						<a href="<c:url value='/gather/list?region=지역미지정'></c:url>" class="selected">지역 미지정</a> 
						<a href="<c:url value='/gather/list?region=서울특별시'></c:url>">서울 특별시</a> 
						<a href="<c:url value='/gather/list?region=경기도'></c:url>">경기도</a> 
						<a href="<c:url value='/gather/list?region=부산광역시'></c:url>">부산 광역시</a> 
						<a href="<c:url value='/gather/list?region=인천광역시'></c:url>">인천 광역시</a> 
						<a href="<c:url value='/gather/list?region=대구광역시'></c:url>">대구 광역시</a> 
						<a href="<c:url value='/gather/list?region=경상북도'></c:url>">경상북도</a>
						<a href="<c:url value='/gather/list?region=경상남도'></c:url>">경상남도</a> 
						<a href="<c:url value='/gather/list?region=대전광역시'></c:url>">대전 광역시</a> 
						<a href="<c:url value='/gather/list?region=전라북도'></c:url>">전라북도</a> 
						<a href="<c:url value='/gather/list?region=전라남도'></c:url>">전라남도</a> 
						<a href="<c:url value='/gather/list?region=충청북도'></c:url>">충청북도</a> 
						<a href="<c:url value='/gather/list?region=충청남도'></c:url>">충청남도</a> 
						<a href="<c:url value='/gather/list?region=광주광역시'></c:url>">광주 광역시</a> 
						<a href="<c:url value='/gather/list?region=강원도'></c:url>">강원도</a> 
						<a href="<c:url value='/gather/list?region=울산광역시'></c:url>">울산 광역시</a> 
						<a href="<c:url value='/gather/list?region=제주특별자치도'></c:url>">제주 특별 자치도</a> 
						<a href="<c:url value='/gather/list?region=세종특별자치도'></c:url>">세종 특별 자치도</a>
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
															<!-- <input type="file" accept="image/*" onchange="readURL(this);"> -->
															<img src="<c:url value='/download${fi.fi_name}'></c:url>" class="study_img">
															</c:if>
														</c:forEach>
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
													<div class="study_content">
														<div class="study_recruiting">
															<span>모집중</span> 
															<span>${stList.get(index).st_now_people}</span> 
															<span>/</span> 
															<span>${stList.get(index).st_total_people}</span>
														</div>
														<div class="want_icon">
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
												</a>
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
$('#switch1').change(function(){
	if(${pm.cri.filter != 'on'}){
		location.replace('<c:url value="/gather/list?filter=on"></c:url>');
	}else{
		location.replace('<c:url value="/gather/list?filter=off"></c:url>');	
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
</script>