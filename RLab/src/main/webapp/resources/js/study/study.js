/**
 * 
 */
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
        $(this).find('.my_study').fadeIn(700);
        $('#dropdown_list').hide();
		//$('#dropdown_list').sildeDown();
    }, function() {
		$('#dropdown_list').slideUp();
        $(this).find('.my_study').hide();
        $('#dropdown_list').hide();
    });
	$('.btn_dropdown').click(function(){
		$('#dropdown_list').slideToggle();
	});
	//스터디명 클릭했을 때 me_study 바꾸는 ajax post 추가
	$('.item_name').click(function(){
		
	})
	//꺼진 별 클릭하면 즐겨찾기 등록하는 ajax post
	$('.star_off').click(function(){
		
	})
});