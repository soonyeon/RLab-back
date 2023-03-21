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
 <label for="title">제목</label><br>
	<input type="text" name="title" placeholder="제목 10자 이내"><br>
 <label for="content">내용</label><br>
 <div id="summernote"></div>
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