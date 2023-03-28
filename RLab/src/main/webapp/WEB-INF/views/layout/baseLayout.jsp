<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!doctype html>
<html>
<head>
	<title>RLab</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
	<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
	<script src="<c:url value='/resources/js/popper.min.js'></c:url>"></script>
</head>
<body>
<<<<<<< HEAD
    <tiles:insertAttribute name="header"/> 
    <div style="margin-top:150px;margin:0 auto;width:60%;" class="clearfix">   
    <tiles:insertAttribute name="body" />          
    </div>                                 
=======
    <tiles:insertAttribute name="header"/>   
    <div style="margin-top:100px" class="clearfix">
    <tiles:insertAttribute name="body" /> 
      
    </div>                                         
>>>>>>> gather
    <tiles:insertAttribute name="footer" />
</body>
</html>
