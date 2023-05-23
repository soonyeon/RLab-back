<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.study_img_box img:nth-child(2){
	display : none;
}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/home/main.css'></c:url>">  

<body>
	<!-- info_modal -->
	<div class="spot_modal_container">
	  <div class="spot_modal">
	    <div class="spot_img_area">
	     <img class="spot_img" src=""width="1200px" height="614px">
	      <div class="info_area">
	        <div class="spot_info_left">
	        
	          <div class="spot_address">
	          	<h1 class="spot_name"></h1>
	            <div class="spot_add"></div>
	            <div class="spot_new_add"></div>
	          </div>
	          <div class="spot_tel_capa">
	            <div class="spot_tel"></div>
	            <div class="spot_capacity"></div>
	          </div>
	        </div>
	        <div class="spot_info_right">
	          <a href="#" class="cabinet_reserv">사물함 예약</a>
	          <a href="#" class="seat_reserv">좌석 예약</a>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  <main class="main_container">
      <div class="reservation_btn">예약하기</div>
      
      <!-- main_banner -->
      <section class="main_area">
        <article class="main_area_box">
          <div class="main_banner_box slide_wrapper">
            <div class="main_btn_left"></div>  
					<ul class="main_banner_area">
						<li class="main_banner_item">
							<a href="/RLab/notice/detail/1"value=""><img src="/RLab/download/banner/main_banner01.png">
								<div class="banner_text_box">
									<span class="banner_icon">함께해요</span>
									<div class="banner_text_main">함께 성장할<br>스터디 메이트를 찾아요</div>
									<div class="banner_text_sub">#우리 #함께성장해요<br>#동료여어디계신가요?</div>
								</div>
							</a>
						</li>
						<li class="main_banner_item">
							<a href="/RLab/notice/detail/2"value=""><img src="/RLab/download/banner/main_banner02.png">
								<div class="banner_text_box">
									<span class="banner_icon" style="background-color: rgb(27 214 26);">스터디 모임</span>
									<div class="banner_text_main">자바 코딩테스트<br>함께 준비해요</div>
									<div class="banner_text_sub">#자바 #코딩테스트 #합격<br>#동료여어디계신가요?</div>
								</div>
							</a>
						</li>
						<li class="main_banner_item">
							<a href="/RLab/notice/detail/2"value=""><img src="/RLab/download/banner/main_banner03.png">
								<div class="banner_text_box">
									<span class="banner_icon">함께해요</span>
									<div class="banner_text_main">알랩 오픈 기념<br>스터디룸 체험단 모집</div>
									<div class="banner_text_sub">#알랩 #이용권 #이벤트<br>#많은관심부탁드려요</div>
								</div>
							</a>
						</li>    
					</ul>
				<div class="main_btn_right"></div>
          </div>
        </article>
      </section>
      
      <!-- info_banner -->
      <section class="info_area">
        <article class="info_area_top">
          <!-- info_left(notice) -->
          <div class="info_left">
            <a href="/RLab/notice/list"><div class="title_box">공지사항</div></a>
            <a href="/RLab/notice/list"><div class="notice_banner_img"></div></a>
          </div>
  
          <!-- info_right(spot) -->
            <div class="info_right">
              <div class="title_box">스터디 지점 안내</div>
              <div class="show_window">
                <div class="spot_container">
                  <div class="spot_banner_box">
                  	<c:forEach items="${spot}" var="sp" varStatus="vs" >
                    <div class="spot_item add_shadow" data-num="${sp.br_num}">
                      <img class="spot_img" src="<c:url value='/download${sp.br_img}'></c:url>"width="275.012" height="188.613px">
                      <div class="spot_content">
                        <div class="spot_name">[${sp.br_re_name}] ${sp.br_name}</div>
                        <div class="spot_road_address">${sp.br_road_address}</div>
                      	<div class="spot_tel">전화 : ${sp.br_tel}</div>
                        <div class="spot_hidden_box">
			          	  <div class="spot_address">${sp.br_address}</div>
			          	  <div class="br_capacity">전체 좌석 : ${sp.br_capacity}석</div>
			          	  <div class="spot_img_file">${sp.br_img}</div>
			          	</div>
                      </div>
                    </div>
                    </c:forEach>
                  </div>   
                </div> 
              </div>
              
              <div class="spot_btn_box">
                <div class="btn_spot1"></div>
                <div class="btn_spot2"></div>
                <div class="btn_spot3"></div>
              </div>
        </article>
        <!-- info_bottom(recruit) -->
        <article class="info_area_bottom">
          <div class="recruit_btn_left"></div>
          <a href="/RLab/gather/list"><div class="title_box2">스터디 모집 공고</div></a>
          	<div class="recruit_box">
	          <div class="recruit_box_container">
	          	<c:if test="${stList.size() != 0}">
					<c:forEach items="${stList}" var="st">
		            <div class="recruit_banner_box add_shadow">
		            <a href="<c:url value='/gather/detail/${st.st_num}'></c:url>">
		              <div class="study_img_box">
			              <c:if test="${files.size() != 0 }">
							<c:forEach items="${fileList}" var="fi">
								<c:if test="${fi.fi_ex_num == st.st_num}">
									<img src="<c:url value='/download${fi.fi_name}'></c:url>" class="recruit_img1">
								</c:if>
							</c:forEach>
						  </c:if>
					  		<c:if test="${fi.fi_ex_num != st.st_num}">
	                        	<img class="recruit_img" src="<c:url value='/resources/img/recruit_thumb.png'></c:url>">
	                        </c:if>	
		              </div>
		              <div class="recruit_banner_inner_box">
						<ul class="recruit_banner_tag">					                  
							<c:forEach items="${tagList}" var="ta" varStatus="vs">
								<c:if test="${ta.tr_st_num==st.st_num}">
									<span class="blue_btn">${ta.tr_name}</span> 
								</c:if>
							</c:forEach>					                
						</ul>
		                <div class="recruit_banner_title">
              					<span class="study_recruit_content">[${st.st_re_name}]</span>
							<c:forEach items="${gaList}" var="ga">
								<c:if test="${ga.ga_st_num==st.st_num}">
									<span> ${ga.ga_title}</span>
								</c:if>
							</c:forEach>
						</div>
						 </a>
		                <div class="recruit_btn_box">
		                  <div class="recruit_banner_btn">
                 				<span>모집중</span> 
							<span>${st.st_now_people}</span> 
							<span>/</span> 
							<span>${st.st_total_people}</span>
		                  </div>
		                  <!-- 스터디 좋아요 -->
		                  <div class="want_icon" data-num="${st.st_num}">
							<c:if test="${user == null}">
								<div class="unlike_btn"></div>
							</c:if>
							<c:if test="${user != null}">
								<c:if test="${waList.contains(st.st_num)}">
									<div class="like_btn"></div>
								</c:if>
								<c:if test="${!waList.contains(st.st_num)}">
									<div class="unlike_btn"></div>
								</c:if>
							</c:if>
						  </div>		
		                </div>
		              </div>             
		            </div>
					</c:forEach>
	         	 </c:if>
	          </div>
          	</div>
          
          <div class="recruit_btn_right"></div>
        </article>
      </section>
  
      <!-- bar_banner -->
      <section class="bar_area">
        <article class="bar_banner_container">
          <div class="bar_banner_img"></div>
          <div class="bar_banner_box">
              <div class="bar_banner_textbox">
                <h1>세상에 없던 나만의 공부 메이트!</h1>
                <h2>지금 바로 만들어보세요</h2>
                <button>
                	<a href="<c:url value='/gather/insertstudy'></c:url>">스터디 만들기</a>
                </button>
              </div>
          </div>
        </article>
      </section>
  
      <!-- event_banner -->
      <section class="event_area">
        <article class="event_container">
          <div class="event_btn_left"></div>
          <div class="title_box">이벤트</div>  
              <div class="event_box_area">
                <div class="event_box">
                  <div class="event_banner add_shadow">
                    <a href="/RLab/notice/detail/5"value=""><img src="/RLab/download/banner/event01.jpeg"></a>
                  </div>
                  <div class="event_banner add_shadow">
                    <a href="/RLab/notice/detail/6"value=""><img src="/RLab/download/banner/event02.png"></a>
                  </div>
                  <div class="event_banner add_shadow">
                    <a href="/RLab/notice/detail/3"value=""><img src="/RLab/download/banner/event03.jpg"></a>
                  </div>
                  <div class="event_banner add_shadow">
                    <a href="/RLab/notice/detail/4"value=""><img src="/RLab/download/banner/event04.jpg"></a>
                  </div>
                </div>
              </div>
          <div class="event_btn_right"></div>
        </article>
      </section>
  </main>   
<script>
//찜하기
const userId = '${user.me_id}'; 

$(document).ready(function() {
	  $('.want_icon').on('click', function() {
		  const  studyNum = $(this).data('num');
		want(studyNum);
	  });
	  

	  function want(studyNum) {
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
	        	 $('.unlike_img').removeClass('unlike_img').addClass('like_img');
	          alert('스터디를 찜 했습니다.');
	          location.reload();
	        } else if (response && response.wantState === 0) {
	        	 $('.like_img').removeClass('like_img').addClass('unlike_img');
	          alert('스터디 찜을 취소 했습니다.');
	          location.reload();
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
<script>

	/** 메인배너 **/
	var banner_area = document.querySelector('.main_banner_area'),
		banner = document.querySelectorAll('.main_banner_area li'),
		currentIdx = 0,
		bannerCount = banner.length,
		bannerWidth = 1200,
		bannerMargin = 300,
		leftBtn = document.querySelector('.main_btn_left'),
		rightBtn = document.querySelector('.main_btn_right');
		
		makeClone();
	
	function makeClone(){
		for(var i = 0; i<bannerCount; i++){
			var cloneBanner = banner[i].cloneNode(true);
			cloneBanner.classList.add('clone'); 
			banner_area.appendChild(cloneBanner);
		}
		
		for(var i = bannerCount-1; i>= 0; i--){
			var cloneBanner = banner[i].cloneNode(true);
			cloneBanner.classList.add('clone');
			banner_area.prepend(cloneBanner);
		}
		
		updateWidth();
		setInitialPos();
		setTimeout(function(){
			banner_area.classList.add('animated');
		});		
	}
	
	function updateWidth(){
		var currentBanner = document.querySelectorAll('.main_banner_area li');
		var newBannerCount = currentBanner.length;
		var newWidth = (bannerWidth + bannerMargin)*newBannerCount - bannerMargin + 'px';
		banner_area.style.width = newWidth;
	}
	
	function setInitialPos(){
		var initialTranslateValue = -(bannerWidth + bannerMargin)*bannerCount;
		banner_area.style.transform = 'translateX('+initialTranslateValue+'px)';
	}
	
	rightBtn.addEventListener('click',function(){
		  moveSlide(currentIdx + 1);
		});
	leftBtn.addEventListener('click',function(){
	  moveSlide(currentIdx - 1);
	});
	
	function moveSlide(num){
	  banner_area.style.left = -num * (bannerWidth + bannerMargin) + 'px';
	  currentIdx = num;

	  if(currentIdx == bannerCount || currentIdx == -bannerCount){
	    banner_area.style.left = '0px';
	    currentIdx = 0;
	    
	  }

	}

/* 스터디 지점 안내 */	
 	// spot_item을 클릭하면
	$('.spot_item').click(function(){
		// 각 클래스를 찾아 태그안에 값을 변수에 할당
		var spotName = $(this).find('.spot_name').text();
		var spotAdd = $(this).find('.spot_address').text();
		var spotNewAdd = $(this).find('.spot_road_address').text();
		var spotTel = $(this).find('.spot_tel').text();
		var spotCapa = $(this).find('.br_capacity').text();
		var linkSeat = '<c:url value="/reservation/1/'+$(this).data('num')+'"></c:url>';
		var linkCabinet = '<c:url value="/reservation/2/'+$(this).data('num')+'"></c:url>';
		// spot_img_file클래스값을 조합하여 url경로를 변수에 할당
		var spotImgSrc = "/RLab/download" + $(this).find('.spot_hidden_box .spot_img_file').text();

		// 각 클래스 위치에 위에서 할당한 값을 넣어줌
		$('.spot_modal .spot_name').text(spotName);
		$('.spot_modal .spot_add').text(spotAdd);
		$('.spot_modal .spot_new_add').text(spotNewAdd);
		$('.spot_modal .spot_tel').text(spotTel);
		$('.spot_modal .spot_capacity').text(spotCapa);
		$('.spot_modal .cabinet_reserv').attr('href',linkCabinet);
		$('.spot_modal .seat_reserv').attr('href',linkSeat);
		$('.spot_img_area .spot_img').attr('src', spotImgSrc);
		$('.spot_modal_container').show();
	});

	// 모달 컨테이너를 클릭하면 하이드 처리(닫힘)
	$('.spot_modal_container').click(function(){
		$(this).hide();
	});

	// 각 버튼을 클릭하면 y축 스타일을 값을 변경하여 슬라이드를 이동
 	document.querySelector('.btn_spot1').addEventListener('click', function(){
	document.querySelector('.spot_container').style.transform = 'translateY(0px)';
	});
	document.querySelector('.btn_spot3').addEventListener('click', function(){
	document.querySelector('.spot_container').style.transform = 'translateY(-1220px)';
	});
	document.querySelector('.btn_spot2').addEventListener('click', function(){
	document.querySelector('.spot_container').style.transform = 'translateY(-610px)';
	});
	
	
/* 스터디 모집 공고 */
	var recruitBannerContainer = document.querySelector('.recruit_box_container'),
	    recruitBanner = document.querySelectorAll('.recruit_banner_box'),
	    recruitCurrentIdx = 0,
	    recruitBannerCount = recruitBanner.length,
	    recruitBannerWidth = 276,
	    recruitBannerMargin =28,
	    recruitBtnLeft = document.querySelector('.recruit_btn_left'),
	    recruitBtnRight = document.querySelector('.recruit_btn_right');

	makeRecruiyClone();
	
	//클론배너 생성
	function makeRecruiyClone(){
		// i가 0부터 3(배너개수보다 작을때)까지 턴하면서 클론배너 생성
		for(var i = 0; i<recruitBannerCount; i++){
		    // a.cloneNode() --> a요소를 그대로 복사
		    // a.cloneNode(true) --> a의 자식요소까지 복사
			var cloneRecruitBanner = recruitBanner[i].cloneNode(true);
		    // 위에서 생성한 클론배너에 클래스명 'clone'을 추가
			cloneRecruitBanner.classList.add('clone');
		    // a.appendChild(b) --> a요소 뒤에 b를 추가 기존 배너 묶음 뒤에 클론배너를 추가
			recruitBannerContainer.appendChild(cloneRecruitBanner);
		}
		// i가 3(배너개수-1)부터 0(0보다 크거나 같을때)까지 -1씩 턴하면서 클론배너 생성
		for(var i = recruitBannerCount-1; i>= 0; i--){
			// recruitBanner의 자식 요소까지 복사해서 cloneRecruitBanner로 변수 선언
			var cloneRecruitBanner = recruitBanner[i].cloneNode(true);
			// 위에서 생성한 클론배너에 클래스명 추가
			cloneRecruitBanner.classList.add('clone');
			// recruitBannerContainer앞에 cloneRecruitBanner추가
			recruitBannerContainer.prepend(cloneRecruitBanner);
		}
		
		recruitUpdateWidth();
		recruitSetInitialPos();
		recruitBannerContainer.classList.add('animated');

	}
	  
	// 클론배너 포함 전체 롤링되는 배너의 너비를 구해 업데이트
	function recruitUpdateWidth(){
		// 클론포함 모든 배너를 찾아 변수에 할당
		var recruitCurrentSlides = document.querySelectorAll('.recruit_banner_box')
		// 클론포함 모든 배너의 개수를 구함
		var recruitNewSlideCount= recruitCurrentSlides.length;
		// 새로운 롤링 배너 총 길이를 구함
		var recruitNewWidth = (recruitBannerWidth + recruitBannerMargin)*recruitNewSlideCount + 'px';
		// 위에서 구한 배너 총 길이를 배너컨테이너의 너비에 할당해준다
		recruitBannerContainer.style.width = recruitNewWidth;
	}
	
	
	function recruitSetInitialPos(){
		// 초기 슬라이드 컨테이너의 이동 위치 값을 계산하여 변수에 할당
		var recruitInitialTranslateValue = -(recruitBannerWidth + recruitBannerMargin)*recruitBannerCount;
		// 슬라이드 컨테이너의 transform속성을 업데이트하여 이동
		recruitBannerContainer.style.transform = 'translateX('+recruitInitialTranslateValue+'px)';
	}
	
	// 오른쪽버튼 클릭하면
	recruitBtnRight.addEventListener('click',function(){
		// 슬라이드 오른쪽으로 한 칸씩 이동
		recruitMoveSlide(recruitCurrentIdx + 1);
	});
	
	// 왼쪽버튼 클릭하면
	recruitBtnLeft.addEventListener('click',function(){
		// 슬라이드를 왼쪽으로 한 칸 이동
		recruitMoveSlide(recruitCurrentIdx - 1);
	});

	
	function recruitMoveSlide(num){
		// 슬라이드 컨테이너의 left 속성을 업데이트하여 슬라이드 이동
		recruitBannerContainer.style.left = -num * (recruitBannerWidth + recruitBannerMargin) + 'px';
		recruitCurrentIdx = num;
	
		// 현재 인덱스가 슬라이드 개수와 동일하거나 마이너스일 경우(마지막 또는 첫번째 슬라이드에 도달한 경우)
		if(recruitCurrentIdx == recruitBannerCount || recruitCurrentIdx == -recruitBannerCount){
			// 0.5초 후에 애니메이션 효과를 제거하고 컨테이너를 초기 위치로 이동
			setTimeout(function(){
				// 애니메이션 클래스 제거
				recruitBannerContainer.classList.remove('animated');
				// 슬라이드 컨테이너의 left 속성을 초기값인 0으로 설정, 처음 슬라이드로 이동
				recruitBannerContainer.style.left ='0px';
				// 현재 인덱스를 0으로 초기화
				recruitCurrentIdx = 0;
			
			},500);
			// 0.6초 후 애니메이션 클래스 추가
			setTimeout(function(){
				recruitBannerContainer.classList.add('animated');
			},600);
		}
	}

	
	/** 이벤트 **/
	var eventBannerContainer = document.querySelector('.event_box'),
		eventBanner = document.querySelectorAll('.event_banner'),
		eventCurrentIdx = 0,
		eventBannerCount = eventBanner.length,
		eventBannerWidth = 581.1,
		eventBannerMargin =35,
		eventBtnLeft = document.querySelector('.event_btn_left'),
		eventBtnRight = document.querySelector('.event_btn_right');
	
	makeEventClone();

	function makeEventClone(){
		for(var i = 0; i<eventBannerCount; i++){
			var cloneEventBanner = eventBanner[i].cloneNode(true);
			cloneEventBanner.classList.add('clone');
			eventBannerContainer.appendChild(cloneEventBanner);
		}
		for(var i = eventBannerCount-1; i>= 0; i--){
			var cloneEventBanner = eventBanner[i].cloneNode(true);
			cloneEventBanner.classList.add('clone'); 
			eventBannerContainer.prepend(cloneEventBanner);
		}
		eventUpdateWidth();
		eventSetInitialPos();
		eventBannerContainer.classList.add('animated');
	}
  
	function eventUpdateWidth(){
		var eventCurrentSlides = document.querySelectorAll('.event_banner');
		var eventNewSlideCount= eventCurrentSlides.length;
		var eventNewWidth = (eventBannerWidth + eventBannerMargin)*eventNewSlideCount + 'px';
		eventBannerContainer.style.width = eventNewWidth;
	} 

	function eventSetInitialPos(){
		var eventInitialTranslateValue = -(eventBannerWidth + eventBannerMargin)*eventBannerCount;
		eventBannerContainer.style.transform = 'translateX('+eventInitialTranslateValue+'px)';
	}
	
		eventBtnRight.addEventListener('click',function(){
		eventMoveSlide(eventCurrentIdx + 1);
	});
	
		eventBtnLeft.addEventListener('click',function(){
		eventMoveSlide(eventCurrentIdx - 1);
	});

	function eventMoveSlide(num){
		eventBannerContainer.style.left = -num * (eventBannerWidth + eventBannerMargin) + 'px';
		eventCurrentIdx = num;
	
		if(eventCurrentIdx == eventBannerCount || eventCurrentIdx == -eventBannerCount){
			setTimeout(function(){
			eventBannerContainer.classList.remove('animated');
			eventBannerContainer.style.left ='0px';
			eventCurrentIdx = 0;
			
			},500);
			
			setTimeout(function(){
			eventBannerContainer.classList.add('animated');
			
			},600);
		}
	}	
</script>
</body>

