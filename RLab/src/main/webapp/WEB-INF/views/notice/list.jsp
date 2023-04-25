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
<link rel="stylesheet"
	href="<c:url value ='/resources/css/common.css?after'></c:url>" />
<link rel="stylesheet"
	href="<c:url value ='/resources/css/notice/list.css'></c:url>" />
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
						<a href="#" class="list_item">마이페이지 홈</a>
						<a href="#" class="list_item">개인정보 수정</a>
						<a href="#" class="list_item">예약 관리</a>
						<a href="#" class="list_item">스터디 관리</a>
						<a href="#" class="list_item">작성글 관리</a>
					</nav>
				</aside>

				<section>
					<!-- 탭 -->
					<div class="tab-container">
						<a href="#" class="tab selected_tab tab1"><div>전체보기</div></a>
						<a href="#" class="tab unselected_tab tab2"><div>공지사항</div></a>
						<a href="#" class="tab unselected_tab tab3"><div>QnA</div></a>
					</div>
					<div class="my_study_container" id="my_container">
						<div class="study_card_container">

							<!-- table  -->
							<div class="table_container">
								<div class="select_box_area">
									<select name="select_view">
										<option value="전체보기">전체보기</option>
										<option value="최신 순">최신 순</option>
										<option value="작성일 순">작성일 순</option>
									</select>
								</div>

								<div class="tab_content">

									<!-- 공지사항 -->
									<div class="table_area" id="tabs_3">
										<table class="border_box">
											<thead>
												<tr class="board_title_list">
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
														<td>${no.no_num}</td>
														<td class="post_title"><a href="<c:url value='/notice/detail/${no.no_num}'></c:url>"> ${no.no_title}</a></td>
														<td>${no.no_me_id}</td>
														<td>${no.no_register_date_str}</td>
														<td>${no.no_views}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- 페이지 이동 -->
									<div class="page_area"></div>
									<div class="page_box clearfix">
										<c:if test="${pm.prev}">
											<a href="<c:url value='/notice/list?page=${pm.startPage-1}'></c:url>"><i class="btn_prev"></i></a>
										</c:if>
										<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
											<span class="page_num<c:if test="${pm.cri.page == i }"> selected</c:if>">
												<a href="<c:url value='/notice/list?page=${i}'></c:url>">${i}</a>
											</span>
										</c:forEach>
										<c:if test="${pm.next}">
											<a href="<c:url value='/notice/list?page=${pm.endPage+1}'></c:url>"><i class="btn_next"></i></a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</section>
		</div>
		</main>
	</div>
	<script>
	</script>
</body>
</html>