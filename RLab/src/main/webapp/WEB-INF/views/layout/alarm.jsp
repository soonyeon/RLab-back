<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
	<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/popper.min.js'></c:url>"></script>
<style>
/* 알람 모달*/
.alarm_modal {
  position: inherit;
  margin-top: 0px;
  margin-left: 0px;
}
</style>
</head>
<div class="alarm_modal" id="alarmModal" style=" max-height: 200px; overflow-y: auto;">
	<div class="alarm_container">
	    <c:forEach var="alarm" items="${alList}">
	   	    <c:if test="${alarm.al_view == 0}">
				<a class="modal_content" href="#">		   
				    <img class="alarm_remove" data-num="${alarm.al_num}" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="20">
			    	<div class="alarm_content_box">
				    	<div class="new_dot"></div>
				        <p>${alarm.al_content}</p>
			    	</div>  
	   			</a>
	   		</c:if>
		    <c:if test="${alarm.al_view == 1}">
				<a class="modal_content read_content" href="#">		   
				    <img class="alarm_remove" data-num="${alarm.al_num}" src="<c:url value='/resources/img/delete.png'></c:url>" width="auto" height="20">
			        <p>${alarm.al_content}</p>
	   			</a>
	   		</c:if>
	    </c:forEach> 
	</div> 
</div> 

