<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!doctype html>
<html>
<head>
	<title>RLab</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/common.css'></c:url>">
	<script src="/RLab/resources/js/jquery.min.js"></script>
</head>
<body>
    <tiles:insertAttribute name="header"/>    
    <tiles:insertAttribute name="body" />                                           
    <tiles:insertAttribute name="footer" />
</body>
</html>
