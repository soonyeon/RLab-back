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
        //$(this).find('.my_study').fadeIn(700);
		$('.btn_dropdown').click(function(){
			$('#dropdown_list').slideToggle();
		});
		//$('#dropdown_list').sildeDown();
    }, function() {
        //$(this).find('.my_study').hide();
		$('#dropdown_list').sildeUp();
    });
	
});