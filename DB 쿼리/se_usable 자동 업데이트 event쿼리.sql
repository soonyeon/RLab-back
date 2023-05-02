-- 이벤트가 가능한지 확인
SHOW VARIABLES LIKE 'event%';

-- 현재 DB에서 돌아가고 있는 이벤트 확인
SELECT * FROM information_schema.events;

-- 이벤트 생성
CREATE EVENT refresh_seat
ON SCHEDULE EVERY 1 SECOND
-- STARTS '2021-06-23 02:09:00'
COMMENT '좌석현황(se_usable) 자동 새로고침'
DO
update seat set se_usable=2
where se_num = (시간 넘었는데 아직 안돌아온 se_num);

-- 이벤트 삭제
DROP event ip_reset;

-- 쿼리 연구중임..
select * from reservation
join seat on re_se_num = se_num
where 