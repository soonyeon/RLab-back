<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/css/home/main.css'></c:url>">  

 
<main class="main_container">
  <div class="reservation_btn"><a href="<c:url value='/reservation'></c:url>">예약하기</a></div>
  <!-- main_banner -->
  <section class="main_area">
    <div class="main_bannr_box">
      <div class="banner_text_box">
        <span class="banner_icon">함께해요</span>
        <div class="banner_text_main">함께 성장할<br>동료를 찾아요</div>
        <div class="banner_text_sub">#우리 #함께성장해요<br>#동료여어디계신가요?</div>
      </div>
      <div class="main_btn_left"></div>
      <div class="main_btn_right"></div>
    </div>
  </section>

  <!-- info_banner -->
  <section class="info_area">
    <article class="info_area_top">
      <!-- info_left(notice) -->
      <div class="info_left">
        <div class="title_box">공지사항</div>
        <div class="notice_banner_img">
        </div>
      </div>

      <!-- info_right(spot) -->
      <div class="info_right">
        <div class="title_box">스터디 지점 안내</div>
        <div class="spot_banner_box">
          <div class="spot_item1 add_shadow">
            <div class="spot_img1"></div>
            <div class="spot_content">
              <div class="spot_name">[서울] 강남역점</div>
              <div class="spot_address">
                서울특별시 강남구 태헤란로 10길 9, 5층<br>운영시간 : 24시간 연중무휴
              </div>
            </div>
          </div>
          <div class="spot_item2 add_shadow">
            <div class="spot_img2"></div>
            <div class="spot_content">
              <div class="spot_name">[서울] 강남역점</div>
              <div class="spot_address">
                서울특별시 강남구 태헤란로 10길 9, 5층<br>운영시간 : 24시간 연중무휴
              </div>
            </div>
          </div>
          <div class="spot_item3 add_shadow">
            <div class="spot_img3"></div>
            <div class="spot_content">
              <div class="spot_name">[서울] 강남역점</div>
              <div class="spot_address">
                서울특별시 강남구 태헤란로 10길 9, 5층<br>운영시간 : 24시간 연중무휴
              </div>
            </div>
          </div>
          <div class="spot_item4 add_shadow">
            <div class="notice_banner_box">
            <div class="spot_img4"></div>
            </div>
            <div class="spot_content">
              <div class="spot_name">[서울] 강남역점</div>
              <div class="spot_address">
                서울특별시 강남구 태헤란로 10길 9, 5층<br>운영시간 : 24시간 연중무휴
              </div>
            </div>
          </div>
        </div>
      </div>
    </article>

    <!-- info_bottom(recruit) -->
    <article class="info_area_bottom">
      <div class="recruit_btn_left"></div>
      <div class="title_box2">스터디 모집 공고</div>
      <div class="recruit_box_container">
        <div class="recruit_banner_box add_shadow">
          <div class="recruit_img1 "></div>
          <div class="recruit_banner_inner_box">
            <ul class="recruit_banner_tag">
              <span class="blue_btn">#정처기</span>
              <span class="mint_btn">#정보처리기사공부</span>
              <span class="blue_btn">#자격증</span>
              <span class="mint_btn">#정보처리기사</span>
              <span class="blue_btn">#정처기</span>
              <span class="mint_btn">#자격증</span>
            </ul>
            <div class="recruit_banner_title">[서울] 정보처리기사 자격증 함께 공부해서 합격해요</div>
            <div class="recruit_btn_box">
              <button class="recruit_banner_btn">모집중 2 / 5</button>
              <img src="../img/like_on_red copy.png" alt="img" class="like_btn">
            </div>
          </div>
        </div>
        <div class="recruit_banner_box add_shadow">
          <div class="recruit_img2"></div>
          <div class="recruit_banner_inner_box">
            <ul class="recruit_banner_tag">
              <span class="blue_btn">#프론트엔드</span>
              <span class="mint_btn">#HTML</span>
              <span class="mint_btn">#javascript</span>
              <span class="blue_btn">#js</span>
              <span class="mint_btn">#css</span>
              <span class="mint_btn">#front</span>
              <span class="blue_btn">#typescript</span>
            </ul>
            <div class="recruit_banner_title">[서울] 정처기 같이 공부해요!</div>
            <div class="recruit_btn_box">
              <button class="recruit_banner_btn">모집중 2 / 5</button>
              <img src="../img/like_on_red copy.png" alt="img" class="like_btn">
            </div>
          </div>
        </div>
        <div class="recruit_banner_box add_shadow">
          <div class="recruit_img3"></div>
          <div class="recruit_banner_inner_box">
            <ul class="recruit_banner_tag">
              <span class="blue_btn">#정처기</span>
              <span class="mint_btn">#정보처리기사공부</span>
              <span class="blue_btn">#자격증</span>
              <span class="mint_btn">#정보처리기사</span>
              <span class="blue_btn">#정처기</span>
              <span class="mint_btn">#자격증</span>
            </ul>
            <div class="recruit_banner_title">[서울] 정처기 같이 공부해요!</div>
            <div class="recruit_btn_box">
              <button class="recruit_banner_btn">모집중 2 / 5</button>
              <img src="../img/like_on_red copy.png" alt="img" class="like_btn">
            </div>
          </div>
        </div>
        <div class="recruit_banner_box add_shadow">
          <div class="recruit_img4"></div>
          <div class="recruit_banner_inner_box">
            <ul class="recruit_banner_tag">
              <span class="blue_btn">#정처기</span>
              <span class="mint_btn">#정보처리기사공부</span>
              <span class="blue_btn">#자격증</span>
              <span class="mint_btn">#정보처리기사</span>
              <span class="blue_btn">#정처기</span>
              <span class="mint_btn">#자격증</span>
            </ul>
            <div class="recruit_banner_title">[서울] 정처기 같이 공부해요!</div>
            <div class="recruit_btn_box">
              <button class="recruit_banner_btn">모집중 2 / 5</button>
              <img src="../img/like_on_red copy.png" alt="img" class="like_btn">
            </div>
          </div>
        </div>
      </div>
      <div class="recruit_btn_right"></div>
    </article>
  </section>

  <!-- bar_banner -->
  <section class="bar_area">
    <article class="bar_banner_container">
      <div class="bar_banner_img"></div>
      <div class="bar_banner_box">
          <div class="bar_banner_textbox">
            <h1>세상에 없던 나만의 공부 메이트!</h1>
            <h2>지금 바로 만들어보세요</h2>
            <button>스터디 만들기</button>
          </div>
      </div>
    </article>
  </section>

  <!-- event_banner -->
    <section class="event_area">
      <article class="event_container">
        <div class="event_btn_left"></div>
        <div class="title_box">이벤트</div>
        <div class="event_box">
          <div class="event_banner_1 add_shadow">
            <div class="event_img1"></div>
          </div>
          <div class="event_banner_2 add_shadow">
            <div class="event_img2"></div>
          </div>
        </div>
        <div class="event_btn_right"></div>
      </article>
    </section>
</main>



