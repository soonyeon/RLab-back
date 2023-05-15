
/* 호버이벤트 필요없어져서 주석처리
$(document).ready(function () {
    $('.circle_now').hover(function(){
        $(this).children('.study_name').fadeIn(700);
    }, function() {
        $(this).children('.study_name').hide();
    });
    $('.circle_star').hover(function(){
        $(this).children('.study_name').fadeIn(700);
    }, function() {
        $(this).children('.study_name').hide();
    });
    
    $('.my_study_container').hover(function(){
    	$(this).find('.my_list_title').addClass('hover');
        $(this).find('.my_study').fadeIn(700);
    });
});*/
/* 영역 나갔을 때 스터디목록 닫는건데 필요없어짐
$(document).ready(function () {
	$('.my_study_container').mouseout(function() {
    	$(this).find('.my_list_title').removeClass('hover');
		$('#dropdown_list').slideUp();
        $(this).find('.my_study').hide();
        $('#dropdown_list').hide();
    });
});*/