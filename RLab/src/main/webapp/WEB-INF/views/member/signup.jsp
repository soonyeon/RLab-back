<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value ='/resources/css/signup.css'></c:url>">
<title>signup</title>
</head>

<body>
	<!-- background -->
	<div class="background_bbls">
		<div class="big_bbls">
			<div class="bubble"></div>
			<div class="bubble"></div>
			<div class="bubble"></div>
			<div class="bubble"></div>
		</div>
		<div class="small_bbls">
			<div class="bubble"></div>
			<div class="bubble"></div>
		</div>
	</div>
	<div id="total_container">
		
		<main>
			<div class="sign_up_container">
				<h1>회원가입</h1>
				<form id="signupform" action="#" method="post" class="form_area" encytype="multipart/form-data">
					<!-- <form action="<c:url value='/signup'></c:url>" method="post"> -->
					<div class="form_group">
						<label for="id">아이디:</label> <input type="text"
							class="form_control" id="me_id" name="me_id" placeholder="영문, 숫자 를 이용하여 5-13자 가능">
					</div>
					<button class="btn btn_outline_success col-12 btn_check_id" type="button" >아이디
						중복체크</button>
					<div class="form_group">
						<label for="pw">비밀번호:</label> <input type="password"
							class="form_control" id="me_pw" name="me_pw" placeholder="영문, 숫자, !@#를 이용하여 8-20자 가능">
					</div>
					<div class="form_group">
						<label for="pw2">비밀번호 확인:</label> <input type="password"
							class="form_control" id="pw2" name="me_pw2">
					</div>
					<div class="form_group">
						<label for="nickname">닉네임:</label> <input type="text"
							class="form_control" id="nickname" name="me_name" placeholder="한글,영어,숫자를 이용하여 2-10자 까지 가능">
					</div>
					<button class="btn btn_outline_success col-12 btn_check_name" type="button">닉네임
						중복체크</button>
					<div class="form_group">
						<label for="email">이메일:</label> <input type="text"
							class="form_control" id="useremail" name="me_email">
					</div>
					<button class="btn btn_outline_success col-12 btn_check_email" type="button" >이메일 중복체크</button>
					<button class="btn btn_outline_success col-12" type="button"  id="mail_send_btn">이메일 인증</button>
					<div class="mail-check-box">
						<input class="form_control mail_check_input" disabled="disabled" maxlength="6" placeholder="인증번호 6자리를 입력해주세요!">
					</div>
					<button class="btn btn_outline_success col-12" type="button" id="verify_code_btn">인증 번호 확인</button>
					<button class="btn btn_outline_success col-12 mt-5 btn_signup">회원가입</button>
				</form>
			</div>
		</main>
		<!-- ------------------------------------------------------------------------------>

		
	</div>

<script>
	$('#signupform').validate({
		rules : { //유효성검사
			me_id : {
				required : true,
				regex : /^[a-zA-Z0-9]{5,12}$/
			},
			me_pw : {
				required : true,
				regex : /^[a-zA-Z0-9!@#]{8,19}$/
			},
			me_pw2 : {
				equalTo : me_pw
			},
			me_name : {
				required : true,
				regex : /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{2,9}$/
			},
			me_email : {
				required : true,
				email : true
			}
			
		},
		messages : { //유효성검사하고 메시지
			me_id : {
				required : '필수항목 입니다',
				regex : '아이디는 영문, 숫자 를 이용하여 5-13자 까지 가능합니다'
			},
			me_pw : {
				required : '필수항목 입니다',
				regex : '비밀번호는 영문, 숫자, !@#를 이용하여 8-20자 까지 가능합니다'
			},
			me_pw2 : {
				equalTo : '비밀번호가 일치하지 않습니다'
			},
			me_name : {
				required : '필수항목 입니다',
				regex : '닉네임은 한글,영어,숫자를 이용하여 2-10자 까지 가능합니다'
			},
			me_email : {
				required : '필수항목 입니다',
				email : '이메일 형식이 아닙니다'
			}
		},
		submitHandler: function(form) {
			if(!idCheck){
				alert('아이디 중복체크를 하세요.');
				return false;
			}
			if(!nameCheck){
				alert('닉네임 중복체크를 하세요.');
				return flase;
			}
			if(!emailCheck2){
				alert('이메일 중복체크를 하세요.');
				return false;
			}
			if(!emailCheck){
				alert('이메일 인증 하세요.');
				return false;
			}
			return true;
		}
	});
	
	$.validator.addMethod("regex", function(value, element, regexp) {
		var re = new RegExp(regexp);
		return this.optional(element) || re.test(value);
	}, "Please check your input.");
	
	
	$('[name= me_id]').change(function(){
		idCheck = false;
	});
	$('[name= me_name]').change(function(){
		nameCheck = false;
	});
	$('#verify_code_btn').change(function(){
		emailCheck = false;
	});
	/*
	/*아이디 체크*/
	$('.btn_check_id').click(function(){
		let me_id = $('#signupform [name=me_id]').val();
		let obj = {
				me_id : me_id
		}
		$.ajax({
			async:true,
			type:'POST',
			data: JSON.stringify(obj),
			url: '<c:url value="/check/id"></c:url>',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data.res){
			    	alert('사용 가능한 아이디입니다.');
			    	idCheck = true;
			    }else{
			    	alert('사용 불가능한 아이디입니다.')
			    }
			}
		});
	});
	
	
	
	/*닉네임 체크*/
	$('.btn_check_name').click(function(){
		let me_name = $('[name=me_name]').val();
		let obj = {
				me_name : me_name
		}
		$.ajax({
			async:true,
			type:'POST',
			data: JSON.stringify(obj),
			url: '<c:url value="/check/name"></c:url>',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data.res){
			    	alert('사용 가능한 닉네임 입니다.');
			    	nameCheck = true;
			    }else{
			    	alert('사용 불가능한 닉네임 입니다.')
			    }
			},
			error : function(a,b,c){
				
			}
		});
	});
	$('[name=me_name]').change(function(){
		nameCheck = false;
	});
	let nameCheck = false; 
	
	/* 이메일인증 */
	 $('#mail_send_btn').on('click', function() {
        var email = $('#useremail').val();
        $.post('<c:url value="/sendEmail"/>', {email: email}, function(response) {
            alert(response);
            $('.mail_check_input').prop('disabled', false);
        });
    });
	$('#verify_code_btn').on('click', function () {
	    var verificationCode = $('.mail_check_input').val();
	    if (!verificationCode) {
	        alert('인증번호를 입력해주세요.');
	        return false;
	    }
	    $.ajax({
	        url: '<c:url value="/check"/>',
	        method: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            verificationCode: verificationCode
	        }),
	        success: function (response) {
	            if (response) {
	                alert('인증번호 확인이 완료되었습니다.');
	            } else {
	                alert('인증번호가 일치하지 않습니다.');
	            }
	        },
	        error: function () {
	            alert('인증번호 확인 중 오류가 발생했습니다.');
	        }
	    });
	});
	/*이메일 체크*/
	$('.btn_check_email').click(function(){
		let me_email = $('[name=me_email]').val();
		let obj = {
				me_email : me_email
		}
		$.ajax({
			async:true,
			type:'POST',
			data: JSON.stringify(obj),
			url: '<c:url value="/check/email"></c:url>',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data.res){
			    	alert('사용 가능한 이메일 입니다.');
			    	nameCheck = true;
			    }else{
			    	alert('가입한 이메일 입니다.')
			    }
			},
		});
	});
</script>

</body>
