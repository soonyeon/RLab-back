<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<link rel="stylesheet" href="<c:url value ='/resources/css/notice/inquiry_detail.css'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/mypage/mypage_common.css'></c:url>" />
<title>RLab</title>

</head>
<body>
	<div id="total_container">
		<!-- main -->
		<main>
			<div id="main_container">
				<!-- aside(left_menu) -->
				<aside class="left_menu_container">
					<nav class="left_menu">
						<a href="<c:url value='/notice/list'></c:url>" class="list_item">공지사항</a>
						<a href="<c:url value='/inquiry/list'></c:url>" class="list_item">QnA</a>
					</nav>
				</aside>

				<section>
					<div class="notice_container" >
                        <div class="inner_container">
                            <div class="title_container">
                            	<c:forEach items="${itList}" var="it">
	                                <c:if test="${in.in_it_num == it.it_num}"><span class="type">> 예약문의</span></c:if>
                            	</c:forEach>
                                <h1 class="title">${in.in_title}</h1>
                            </div>
                            <div class="info_container clearfix">
                                <div class="info_box">
                                   	<img class="profile_box" src="<c:url value='/download${in.me_profile}'></c:url>">
                                    <span class="writer">${in.in_me_id}</span>
                                    <span class="date">${in.in_reg_date_str}</span>
                                </div>
                                <c:if test="${in.in_me_id == user.me_id}">
	                                <div class="setting_box">
	                                	<c:if test="${!answered.contains(in.in_num)}">
	                                  		<a href="<c:url value='/inquiry/update/${in_num}'></c:url>" class="update">수정</a>
	                                	</c:if>
	                                    <a href="<c:url value='/inquiry/delete/${in_num}'></c:url>" class="delete">삭제</a>
	                                </div>
                                </c:if>
                            </div>
                            
                        </div>
						<hr>
                        <div class="content_container">${in.in_content}</div>
                        <!-- 문의 답글란 -->
                        <c:if test="${user.me_authority >= 9}">
	                        <c:if test="${ans == null}">
		                        <div class="input_container">
		                            <div class="name_box display_none">
		                                <span class="account">관리자 계정 :</span><span class="replier_id">${user.me_id}</span>
		                            </div>
		                            <div class="reply_box">
		                                <textarea class="reply_input" name="reply_content"></textarea>
		                                <button class="btn_reply">답변 등록</button>
		                            </div>
		                        </div>
	                        </c:if>
	                        <c:if test="${ans != null}">
		                        <div class="reply_container">
		                            <div class="title_container">
	                                    <h3 class="reply_title">문의 답변</h3>
		                                <div class="replier_info">
		                                    <span class="date">${ans.in_reg_date_str2}</span>
		                                </div>
		                                
		                            </div>
		                            <hr>
		                            <div class="reply_content">${ans.in_content}</div>
		                        </div>
	                        </c:if>
                        </c:if>
                        <div class="to_list">
                            <a href="<c:url value='/inquiry/list'></c:url>" class="btn_list">목록으로</a>
                        </div>
                        
					</div>
				</section>
			</div>
		</main>
	</div>
</body>
<script>
$('.btn_reply').click(function(){
	var replyContent = $('[name=reply_content]').val();
	var inquiry = {
		'in_num': ${in_num},
		'in_title': '문의글 답변입니다.',
		'in_content': replyContent
	}
	console.log(inquiry);
	$.ajax({
		type:'POST',
		data: JSON.stringify(inquiry),
		url: '<c:url value="/inquiry/insert/answer"></c:url>',
		dataType:"json",
        contentType:"application/json; charset=UTF-8",
        success :function(){
        	location.href = "<c:url value='/inquiry/detail/${in_num}'></c:url>";
        }
	})
	
});

</script>
</body>
</html>