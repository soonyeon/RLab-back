<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>작성글 관리</title>
<link rel="stylesheet" href="<c:url value='/resources/css/board/list.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/study/study.css'></c:url>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/0639c8d8d2.js" crossorigin="anonymous"></script>


<main>
	<div class="main_container">
		 <div class="left_side">
				<!-- 왼쪽 메뉴바 -->
				<div class="left_menu_container">
					<nav class="left_menu">
						<a href="<c:url value='/study/${st_num}'></c:url>" class="list_item">스터디홈</a>
						<a href="<c:url value='/study/todo/${st_num}'></c:url>" class="list_item">투두 리스트</a> 
						<a href="<c:url value='/study/daily/${st_num}'></c:url>" class="list_item">데일리 미션</a> 
						<a href="<c:url value='/study/photo/${st_num}'></c:url>" class="list_item">인증 게시판</a> 
						<a href="<c:url value='/board/list/${st_num}'></c:url>" class="list_item">자유 게시판</a> 
						<a href="<c:url value='/study/management'></c:url>" class="list_item">스터디 관리</a>
					</nav>
				</div>
				<a href="#" class="leave_btn">탈퇴하기</a>
			</div>

		<section>
			<div class="home_container">
				<h2>자유게시판</h2>
				<div class="my_study_container" id="my_container">
					<div class="study_card_container">
						<!-- table  -->
						<div class="table_container">
							<div class="tab_content">
								<!-- 나의 게시글 -->
								<div class="table_area_1" id="tabs_1">
									<!-- <div class="tab-content_tabel_area 1"> -->
									<table class="border_box">
										<tr class="board_title_list">
											<td class="title_list_item">번호</td>
											<td class="title_list_item">스터디명</td>
											<td class="title_list_item">제목</td>
											<td class="title_list_item">작성자</td>
											<td class="title_list_item">작성일</td>
											<td class="title_list_item">조회수</td>
											<td class="title_list_item">스크랩</td>
										</tr>
										<c:forEach var="board" items="${boardList}">
											<tr class="board_list_${board.bo_num}">
												<td>${board.bo_num}</td>
												<td>${board.st_name}</td>
												<td class="post_title"><a href="<c:url value='/board/detail/${st_num}/${board.bo_num}'></c:url>"> ${board.bo_title}</a></td>
												<td>${board.me_name}</td>
												<td>${board.bo_reg_date_str}</td>
												<td>${board.bo_views}</td>
												<td>${board.scrap_count}</td>
											</tr>
										</c:forEach>
									</table>
									<a class="write_btn" href="<c:url value="/board/insert"></c:url>" style="float: right;">작성하기</a>
								</div>
								<div class="page_box clearfix">
									<c:if test="${pm.prev}">
										<a href="<c:url value='/board/list/${st_num}?page=${pm.startPage-1}&pageSize=${ph.pageSize}'/>"> <i class="btn_prev"></i></a>
									</c:if>
									<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
										<span class="page_num">
											<a class="page_link<c:if test="${pm.cri.page == i}"> selected</c:if>" href="<c:url value='/board/list/${st_num}?page=${i}'/>">${i}</a>
										</span>
									</c:forEach>
									<c:if test="${pm.next}">
										<a href="<c:url value='/board/list/${st_num}?page=${pm.endPage+1}'/>"><i class="btn_next"></i></a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
		<!-- 오른쪽 메뉴 -->
		<aside>
			<div class="right-container">
				<!-- 메뉴바 3개 -->
				<div class="study_link_container">
					<div class="circle_now cc">
						<div class="now">NOW</div>
					</div>
					<div class="circle_star cc">
						<img class="star" src="<c:url value='/resources/img/favorite_star_on.png'></c:url>">
					</div>
					<div class="my_study_container">
						<div class="my_list_title">

							<div class="my">MY</div>

							<!-- <div class="my_study" >나의 스터디<button id="dropdown_btn">▼</button></div> -->
						</div>
						<div id="dropdown_list" style="display: none;">
							<ul class="dropdown_list_ul">
								<li class="dropdown_list_li">
									<div class="dropdown_list_contents">
										<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
										<div class="dropdown_list_contents_on_img"></div>
										<div class="dropdown_hr"></div>
									</div>
								</li>
								<li class="dropdown_list_li">
									<div class="dropdown_list_contents">
										<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
										<div class="dropdown_list_contents_off_img"></div>
										<div class="dropdown_hr"></div>
									</div>
								</li>
								<li class="dropdown_list_li">
									<div class="dropdown_list_contents">
										<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
										<div class="dropdown_list_contents_off_img"></div>
										<div class="dropdown_hr"></div>
									</div>
								</li>
								<li class="dropdown_list_li">
									<div class="dropdown_list_contents">
										<p class="dropdown_list_contents_title">정보처리기사 스터디</p>
										<div class="dropdown_list_contents_off_img"></div>
										<div class="dropdown_hr"></div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 접속상태 -->
				<div class="accessor">
					<div class="study_title">정보처리기사 스터디</div>
					<div class="accessor_container">
						<div class="circle_accessor">
							<div class="accessor_on"></div>
						</div>
						<div class="study_name">김돌탕</div>
						<span class="your">YOU</span>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">김순연</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">김세영</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">김도현</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">이정현</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">가나다</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">라마바</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">사아나</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">s아나</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">s아나</div>
					</div>
					<div class="accessor_container">
						<div class="circle_accessor"></div>
						<div class="study_name">s아나</div>
					</div>

				</div>
			</div>
	</div>
	</aside>
	</div>

</main>
<script>
</script>