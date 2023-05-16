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
	     <img class="spot_img" src="/test/download/branch/역삼점.jpg"width="1200px" height="614px">
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
							<div class="main_banner_img1"></div>
							<div class="banner_text_box">
								<span class="banner_icon">함께해요</span>
								<div class="banner_text_main">함께 성장할<br>스터디 메이트를 찾아요</div>
								<div class="banner_text_sub">#우리 #함께성장해요<br>#동료여어디계신가요?</div>
							</div>
						</li>
						<li class="main_banner_item">
							<div class="main_banner_img2"></div>
							<div class="banner_text_box">
								<span class="banner_icon">함께해요22</span>
								<div class="banner_text_main">함께 성장할<br>동료를 찾아요</div>
								<div class="banner_text_sub">#우리 #함께성장해요<br>#동료여어디계신가요?</div>
							</div>
						</li>
						<li class="main_banner_item">
							<div class="main_banner_img3"></div>
							<div class="banner_text_box">
								<span class="banner_icon">함께해요00</span>
								<div class="banner_text_main">함께 성장할<br>동료를 찾아요</div>
								<div class="banner_text_sub">#우리 #함께성장해요<br>#동료여어디계신가요?</div>
							</div>
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
            <div class="title_box">공지사항</div>
            <div class="notice_banner_img">
            </div>
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
          <div class="title_box2">스터디 모집 공고</div>
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
		                <div class="recruit_btn_box">
		                  <div class="recruit_banner_btn">
                 				<span>모집중</span> 
							<span>${st.st_now_people}</span> 
							<span>/</span> 
							<span>${st.st_total_people}</span>
		                  </div>
		                  <!-- 스터디 좋아요 -->
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
		              </a>
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
                <button>스터디 만들기</button>
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
                    <a href="/RLab/notice/detail/1"value=""><img src="/RLab/download/event/event01.jpeg"></a>
                  </div>
                  <div class="event_banner add_shadow">
                    <a href="/RLab/notice/detail/2"value=""><img src="/RLab/download/event/event02.png"></a>
                  </div>
                  <div class="event_banner add_shadow">
                    <a href="/RLab/notice/detail/3"value=""><img src="/RLab/download/event/event03.jpg"></a>
                  </div>
                  <div class="event_banner add_shadow">
                    <a href="/RLab/notice/detail/4"value=""><img src="/RLab/download/event/event04.jpg"></a>
                  </div>
                </div>
              </div>
          <div class="event_btn_right"></div>
        </article>
      </section>
  </main>   
<script>





/* 메인배너 */
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
			cloneBanner.classList.add('clone'); //위에 복사한 cloneSlide에 clone 클래스명을 넣어줌
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
	},100);		
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
	$('.spot_item').click(function(){
		  var spotName = $(this).find('.spot_name').text();
		  var spotAdd = $(this).find('.spot_address').text();
		  var spotNewAdd = $(this).find('.spot_road_address').text();
		  var spotTel = $(this).find('.spot_tel').text();
		  var spotCapa = $(this).find('.br_capacity').text();

		  var spotImgFileValue = $(this).find('.spot_hidden_box .spot_img_file').text();
		  var spotImgSrc = "/RLab/download" + spotImgFileValue;

		  $('.spot_modal .spot_name').text(spotName);
		  $('.spot_modal .spot_add').text(spotAdd);
		  $('.spot_modal .spot_new_add').text(spotNewAdd);
		  $('.spot_modal .spot_tel').text(spotTel);
		  $('.spot_modal .spot_capacity').text(spotCapa);

		  $('.spot_img_area .spot_img').attr('src', spotImgSrc);

		  $('.spot_modal_container').show();
		});

		$('.spot_modal_container').click(function(){
		  $(this).hide();
		});


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

	function makeRecruiyClone(){
	  for(var i = 0; i<recruitBannerCount; i++){
	    var cloneRecruitBanner = recruitBanner[i].cloneNode(true);
	    cloneRecruitBanner.classList.add('clone');
	    recruitBannerContainer.appendChild(cloneRecruitBanner);
	  }
	  for(var i = recruitBannerCount-1; i>= 0; i--){
	    var cloneRecruitBanner = recruitBanner[i].cloneNode(true);
	    cloneRecruitBanner.classList.add('clone'); 
	    recruitBannerContainer.prepend(cloneRecruitBanner);
	  }
	  
	  recruitUpdateWidth();
	  recruitSetInitialPos();
	  recruitBannerContainer.classList.add('animated');

	}
	  

	  function recruitUpdateWidth(){
	    var recruitCurrentSlides = document.querySelectorAll('.recruit_banner_box');
	    var recruitNewSlideCount= recruitCurrentSlides.length;

	    var recruitNewWidth = (recruitBannerWidth + recruitBannerMargin)*recruitNewSlideCount + 'px';
	    recruitBannerContainer.style.width = recruitNewWidth;
	  } 

	  function recruitSetInitialPos(){
	    var recruitInitialTranslateValue = -(recruitBannerWidth + recruitBannerMargin)*recruitBannerCount;
	    recruitBannerContainer.style.transform = 'translateX('+recruitInitialTranslateValue+'px)';
	  }


	  recruitBtnRight.addEventListener('click',function(){
	    recruitMoveSlide(recruitCurrentIdx + 1);

	  });

	  recruitBtnLeft.addEventListener('click',function(){
	      recruitMoveSlide(recruitCurrentIdx - 1);
	  });

	  function recruitMoveSlide(num){
	    recruitBannerContainer.style.left = -num * (recruitBannerWidth + recruitBannerMargin) + 'px';
	    recruitCurrentIdx = num;

	  if(recruitCurrentIdx == recruitBannerCount || recruitCurrentIdx == -recruitBannerCount){

	    setTimeout(function(){
	      recruitBannerContainer.classList.remove('animated');
	      recruitBannerContainer.style.left ='0px';
	      recruitCurrentIdx = 0;

	    },500);
	    setTimeout(function(){
	      recruitBannerContainer.classList.add('animated');
	    },600);
	    
	  }
	}
	
	
// 이벤트
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

