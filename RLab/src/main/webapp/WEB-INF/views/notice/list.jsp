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
<link rel="stylesheet" href="<c:url value ='/resources/css/tab_common.css'></c:url>" />
<link rel="stylesheet" href="<c:url value ='/resources/css/notice/list.css'></c:url>" />
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
						<a href="<c:url value='/notice/list'></c:url>" class="list_item">전체보기</a>
						<a href="<c:url value='/notice/list?type=1'></c:url>" class="list_item">공지사항</a>
						<a href="<c:url value='/notice/list?type=2'></c:url>" class="list_item">QnA</a>
						<a href="<c:url value='/notice/list?type=3'></c:url>" class="list_item">이벤트</a>
					</nav>
				</aside>

				<section>
					<!-- 탭 
					<div class="tab-container">
						<a href="#" class="tab selected_tab tab1"><div>전체보기</div></a>
						<a href="#" class="tab unselected_tab tab2"><div>공지사항</div></a>
						<a href="#" class="tab unselected_tab tab3"><div>QnA</div></a>
					</div>-->
					<div class="notice_container">
						<div class="study_card_container">

							<!-- table  -->
							<form action="<c:url value='/notice/list'></c:url>">
								<div class="table_container">
									<div class="select_box_area">
										<select name="sort">
											<option value="" <c:if test="${pm.cri.sort==''}">selected</c:if>>전체보기</option>
											<option value="date" <c:if test="${pm.cri.sort=='date'}">selected</c:if>>최신순</option>
											<option value="views" <c:if test="${pm.cri.sort=='views'}">selected</c:if>>조회순</option>
										</select>
									</div>
	
									<div class="tab_content">
										<!-- 공지사항 -->
										<div class="table_area" id="tabs_3">
											<table class="border_box">
												<thead>
													<tr class="board_title_list">
														<td class="title_list_item">분류</td>
														<td class="title_list_item">번호</td>
														<td class="title_list_item">제목</td>
														<td class="title_list_item">작성자</td>
														<td class="title_list_item">작성일</td>
														<td class="title_list_item">조회수</td>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${noList}" var="no">
														<tr class="board_list">
															<td><c:forEach items="${ntList}" var="nt">
																	<c:if test="${no.no_nt_num == nt.nt_num}">${nt.nt_name}</c:if>
																</c:forEach></td>
															<td>${no.no_num}</td>
															<td class="post_title"><a href="<c:url value='/notice/detail/${no.no_num}'></c:url>"> ${no.no_title}</a></td>
															<td>${no.no_me_id}</td>
															<td>${no.no_register_date_str}</td>
															<td>${no.no_views}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<c:if test="${user.me_authority >= 9}">
												<a class="write_btn" href="<c:url value="/notice/insert"></c:url>" style="float: right;">작성하기</a>
											</c:if>
										</div>
										<!-- 페이지 이동 -->
										<div class="page_box clearfix">
											<c:if test="${pm.prev}">
												<a href="<c:url value='/notice/list?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}&sort=${pm.cri.sort}'></c:url>"><i class="btn_prev"></i></a>
											</c:if>
											<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
												<span class="page_num<c:if test="${pm.cri.page == i}"> selected</c:if>">
													<a href="<c:url value='/notice/list?page=${i}&type=${pm.cri.type}&search=${pm.cri.search}&sort=${pm.cri.sort}'></c:url>">${i}</a>
												</span>
											</c:forEach>
											<c:if test="${pm.next}">
												<a href="<c:url value='/notice/list?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}&sort=${pm.cri.sort}'></c:url>"><i class="btn_next"></i></a>
											</c:if>
										</div>
										<div class="search_area clearfix">
											<select id="choose_type" name="type">
												<option value="0">전체</option>
												<c:forEach items="${ntList}" var="nt">
													<option value="${nt.nt_num}">${nt.nt_name}</option>
												</c:forEach>
											</select>
											<div class="search_box">
												<input type="text" class="search" placeholder="검색어를 입력하세요" name="search">
												<button class="icon_search"></button>
											</div>
										</div>
									
									</div>
								</div>
							</form>
						</div>
					</div>
				</section>
			</div>
		</main>
	</div>
<script>
$('[name=sort]').change(function(){
	$('form').submit();
});
$('#choose_type').change(function(){
	$('form').submit();
});
</script>
</body>
</html>