<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/css/home/main.css'></c:url>">  

<body>
	<!-- info_modal -->
	<div class="spot_modal_container">
	
<%-- 	<c:forEach items="${spot}" var="spm" varStatus="vs" >
		<c:if test="${sp.br_num} == ${spm.br_num}">	 --%>
		  <div class="spot_modal">
		    <div class="spot_img_area">
		      <div class="info_area">
		        <div class="spot_info_left">
		        
		          <div class="spot_address">
		          	<h1 class="spot_name"></h1>
		            <div class="spot_add">br_address</div>
		            <div class="spot_new_add">br_road_address</div>
		          </div>
		          <div class="spot_tel_capa">
		            <div class="spot_tel">br_tel</div>
		            <div class="spot_capacity">br_capacity</div>
		          </div>
		        </div>
		        <div class="spot_info_right">
		          <a href="#" class="cabinet_reserv">사물함 예약</a>
		          <a href="#" class="seat_reserv">좌석 예약</a>
		        </div>
		      </div>
		    </div>
		  </div>
<%-- 		 </c:if>
		</c:forEach> --%>
	   
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
							<!-- <img src="../../img/main_banner.png"> -->
							<div class="banner_text_box">
								<span class="banner_icon">함께해요</span>
								<div class="banner_text_main">함께 성장할<br>스터디 메이트를 찾아요</div>
								<div class="banner_text_sub">#우리 #함께성장해요<br>#동료여어디계신가요?</div>
							</div>
						</li>
						<li class="main_banner_item">
							<div class="main_banner_img2"></div>
							<!-- <img src="../../img/main_banner2.png"> -->
							<div class="banner_text_box">
								<span class="banner_icon">함께해요22</span>
								<div class="banner_text_main">함께 성장할<br>동료를 찾아요</div>
								<div class="banner_text_sub">#우리 #함께성장해요<br>#동료여어디계신가요?</div>
							</div>
						</li>
						<li class="main_banner_item">
							<div class="main_banner_img3"></div>
							<!-- <img src="../../img/main_banner3.png"> -->
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
                      <div class="spot_img1"></div>
                      <div class="spot_content">
                        <div class="spot_name">[${sp.br_re_name}] ${sp.br_name}</div>
                        <div class="spot_road_address">
                          ${sp.br_road_address}<br>전화 : ${sp.br_tel}
                      	</div>
                        <div class="spot_hidden_box">
			          	  <div class="spot_address">${sp.br_address}</div>
			          	  <div class="spot_new_address">${sp.br_road_address}</div>
			          	  <div class="spot_tel">전화 : ${sp.br_tel}</div>
			          	  <div class="br_capacity">전체 좌석 : ${sp.br_capacity}석</div>
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
	          
	            <div class="recruit_banner_box add_shadow">
	              <div class="recruit_img1 "></div>
	              <div class="recruit_banner_inner_box">
	                <ul class="recruit_banner_tag">
	                  <span class="blue_btn">#11111</span>
	                  <span class="mint_btn">#정보처리기사공부</span>
	                  <span class="blue_btn">#자격증</span>
	                  <span class="mint_btn">#정보처리기사</span>
	                  <span class="blue_btn">#정처기</span>
	                  <span class="mint_btn">#자격증</span>
	                </ul>
	                <div class="recruit_banner_title">[서울] 정보처리기사 자격증 함께 공부해서 합격해요</div>
	                <div class="recruit_btn_box">
	                  <button class="recruit_banner_btn">모집중 2 / 5</button>
	                  <div class="like_btn"></div>
	                  <!-- <img src="../img/like_on_red copy.png" alt="img" class="like_btn"> -->
	                </div>
	              </div>
	            </div>
	            <div class="recruit_banner_box add_shadow">
	              <div class="recruit_img2"></div>
	              <div class="recruit_banner_inner_box">
	                <ul class="recruit_banner_tag">
	                  <span class="blue_btn">#프론트엔드</span>
	                  <span class="mint_btn">#HTML</span>
	                  <span class="mint_btn">#javascript</span>
	                  <span class="blue_btn">#js</span>
	                  <span class="mint_btn">#css</span>
	                  <span class="mint_btn">#front</span>
	                  <span class="blue_btn">#typescript</span>
	                </ul>
	                <div class="recruit_banner_title">[서울] 정처기 같이 공부해요!</div>
	                <div class="recruit_btn_box">
	                  <button class="recruit_banner_btn">모집중 2 / 5</button>
	                  <div class="like_btn"></div>
	                  <!-- <img src="../img/like_on_red copy.png" alt="img" class="like_btn"> -->
	                </div>
	              </div>
	            </div>
	            <div class="recruit_banner_box add_shadow">
	              <div class="recruit_img3"></div>
	              <div class="recruit_banner_inner_box">
	                <ul class="recruit_banner_tag">
	                  <span class="blue_btn">#정처기</span>
	                  <span class="mint_btn">#정보처리기사공부</span>
	                  <span class="blue_btn">#자격증</span>
	                  <span class="mint_btn">#정보처리기사</span>
	                  <span class="blue_btn">#정처기</span>
	                  <span class="mint_btn">#자격증</span>
	                </ul>
	                <div class="recruit_banner_title">[서울] 정처기 같이 공부해요!</div>
	                <div class="recruit_btn_box">
	                  <button class="recruit_banner_btn">모집중 2 / 5</button>
	                  <div class="like_btn"></div>
	                  <!-- <img src="../img/like_on_red copy.png" alt="img" class="like_btn"> -->
	                </div>
	              </div>
	            </div>
	            <div class="recruit_banner_box add_shadow">
	              <div class="recruit_img4"></div>
	              <div class="recruit_banner_inner_box">
	                <ul class="recruit_banner_tag">
	                  <span class="blue_btn">#정처기</span>
	                  <span class="mint_btn">#정보처리기사공부</span>
	                  <span class="blue_btn">#자격증</span>
	                  <span class="mint_btn">#정보처리기사</span>
	                  <span class="blue_btn">#정처기</span>
	                  <span class="mint_btn">#자격증</span>
	                </ul>
	                <div class="recruit_banner_title">[서울] 정처기 같이 공부해요!</div>
	                <div class="recruit_btn_box">
	                  <button class="recruit_banner_btn">모집중 2 / 5</button>
						<div class="like_btn"></div>
	                  <!-- <img src="../img/like_on_red copy.png" alt="img" class="like_btn"> -->
	                </div>
	              </div>
	            </div>
	          
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
                    <div class="event_img1"></div>
                  </div>
                  <div class="event_banner add_shadow">
                    <div class="event_img1"></div>
                  </div>
                  <div class="event_banner add_shadow">
                    <div class="event_img2"></div>
                  </div>
                  <div class="event_banner add_shadow">
                    <div class="event_img2"></div>
                  </div>
                </div>
              </div>
          <div class="event_btn_right"></div>
        </article>
      </section>
  </main>   
<%-- <script src="<c:url value='/resources/js/home/home.js'/>"> --%>
<script>





//메인배너
	var banner_area = document.querySelector('.main_banner_area'),
		banner = document.querySelectorAll('.main_banner_area li'),
		currentIdx = 0,
		bannerCount = banner.length,
		bannerWidth = 1200,
		bannerMargin = 300,
		leftBtn = document.querySelector('.main_btn_left'),
		rightBtn = document.querySelector('.main_btn_right');
		console.log('bannerCount : '+bannerCount);
		
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
		console.log('newWidth :'+newWidth);
	}
	
	function setInitialPos(){
		var initialTranslateValue = -(bannerWidth + bannerMargin)*bannerCount;
		//slides {transform: treanslateX(-1000px);}""
		banner_area.style.transform = 'translateX('+initialTranslateValue+'px)';
		console.log('initialTranslateValue : '+initialTranslateValue);
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
	  console.log(currentIdx,bannerCount);

	  if(currentIdx == bannerCount || currentIdx == -bannerCount){
	    banner_area.style.left = '0px';
	    currentIdx = 0;
	    console.log("currentIdx : "+currentIdx);
	    
	  }

	}

/* 스터디 지점 안내 */

/*  	$('.spot_item').click(function(){
	  let index = $(this).index();
	  $('.spot_modal_container').show();
	});
	
	$('.spot_modal_container').click(function(){
	    $('.spot_modal_container').hide();
	  });

	
	var spotItems = document.querySelectorAll('.spot_item');

	for (var i = 0; i < spotItems.length; i++) {
	  spotItems[i].addEventListener('click', function() {
		    var spotName = this.querySelector('.spot_name').textContent;
		    var spotAdd = this.querySelector('.spot_address').textContent;
		    var spotNewAdd = this.querySelector('.spot_new_add').textContent;
		    var spotTel = this.querySelector('.spot_tel').textContent;
		    var spotCapa = this.querySelector('.spot_capacity').textContent;

		    var modalSpotName = document.querySelector('.spot_modal .spot_name');
		    var modalSpotAdd = document.querySelector('.spot_modal .spot_add');
		    var modalSpotNewAdd = document.querySelector('.spot_modal .spot_new_add');
		    var modalSpotTel = document.querySelector('.spot_modal .spot_tel');
		    var modalSpotCapa = document.querySelector('.spot_modal .spot_capacity');
		    
		    modalSpotName.textContent = spotName;
		    modalSpotAdd.textContent = spotAdd;
		    modalSpotNewAdd.textContent = spotNewAdd;
		    modalSpotNewAdd.textContent = spotTel;
		    modalSpotCapa.textContent = spotCapa;
		    
	    document.querySelector('.spot_modal_container').style.display = 'block';
	  });
	}
	// spot_modal_container 클릭 이벤트 핸들러
	var modalContainer = document.querySelector('.spot_modal_container');

	modalContainer.addEventListener('click', function() {
	  this.style.display = 'none';
	}); */
	
	

	  
	  
	
	$('.spot_item').click(function(){
		  var spotName = $(this).find('.spot_name').text();
		  var spotAdd = $(this).find('.spot_address').text();
		  var spotNewAdd = $(this).find('.spot_new_address').text();
		  var spotTel = $(this).find('.spot_tel').text();
		  var spotCapa = $(this).find('.br_capacity').text();

		  $('.spot_modal .spot_name').text(spotName);
		  $('.spot_modal .spot_add').text(spotAdd);
		  $('.spot_modal .spot_new_add').text(spotNewAdd);
		  $('.spot_modal .spot_tel').text(spotTel);
		  $('.spot_modal .spot_capacity').text(spotCapa);

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
	
	
//스터디 모집 공고
	var recruitBannerContainer = document.querySelector('.recruit_box_container'),
	    recruitBanner = document.querySelectorAll('.recruit_banner_box'),
	    recruitCurrentIdx = 0,
	    recruitBannerCount = recruitBanner.length,
	    recruitBannerWidth = 275,
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
	    //slides {transform: treanslateX(-1000px);}""
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
	    eventBannerWidth = 582,
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
	    //slides {transform: treanslateX(-1000px);}""
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

