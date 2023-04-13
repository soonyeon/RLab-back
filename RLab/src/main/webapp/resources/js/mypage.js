// pet_store 모달 열기
$(document).on('click', '#pet_store_container', function(e){
	console.log('click');
	$('#pet_store_popup_container').removeClass('display_none');
})

// pet_store 모달 닫기
$(document).on('click', '.btn_remove', function(e){
	console.log('click');
	$('#pet_store_popup_container').addClass('display_none');
})