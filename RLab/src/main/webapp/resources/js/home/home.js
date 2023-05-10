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
	

/* 스터디 지점 안내 */
 	document.querySelector('.btn_spot1').addEventListener('click', function(){
	document.querySelector('.spot_container').style.transform = 'translate(0px)';
	});
	document.querySelector('.btn_spot3').addEventListener('click', function(){
	document.querySelector('.spot_container').style.transform = 'translate(-1160px)';
	});
	document.querySelector('.btn_spot2').addEventListener('click', function(){
	document.querySelector('.spot_container').style.transform = 'translate(-595px)';
	});
	document.querySelector('.btn_spot3').addEventListener('click', function(){
	document.querySelector('.spot_container').style.transform = 'translate(-1190px)';
	});
	
	
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
