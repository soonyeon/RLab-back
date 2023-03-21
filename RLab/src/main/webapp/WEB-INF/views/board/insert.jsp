<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/summernote-lite.min.css'></c:url>" rel="stylesheet">
<script src="<c:url value='/resources/js/summernote-lite.min.js'></c:url>"></script>
<style>
 #summernote {
 	width: 800px;
 }
}
</style>
<form action="<c:url value='/board/insert'></c:url>" method="post" style="width:800px;margin: 0 auto">
	<button type="button" style="float:right">임시저장 불러오기</button><br>
 <label for="name">스터디명</label><br>
 <select>
 	<option>정처기 준비하는 스터디</option>
 </select><br>
  <label for="name">작성자</label><br>
	<input type="text" name="name" value="김돌탕" disabled="disabled"><br>
 <label for="title">제목</label><br>
	<input type="text" name="title" placeholder="제목 10자 이내"><br>
 <label for="content">내용</label><br>
 <div id="summernote"></div>
 <div style="float: right">
	 <button type="button">임시저장</button><button type="button">작성완료</button>
 </div>
 </form>
 
 
 <script>
   $('#summernote').summernote({
     tabsize: 2,
     height: 300,
     toolbar: [
       ['style', ['style']],
       ['font', ['bold', 'underline', 'clear']],
       ['color', ['color']],
       ['para', ['ul', 'ol', 'paragraph']],
       ['table', ['table']],
       ['insert', ['link', 'picture', 'video']],
       ['view', ['fullscreen', 'codeview', 'help']]
     ]
   });
 </script>