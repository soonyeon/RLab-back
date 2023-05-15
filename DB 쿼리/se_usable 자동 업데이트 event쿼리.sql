-- 이벤트가 가능한지 확인
SHOW VARIABLES LIKE 'event%';

-- 현재 DB에서 돌아가고 있는 이벤트 확인
SELECT * FROM information_schema.events;

-- 이벤트 생성
CREATE EVENT refresh_seat
ON SCHEDULE EVERY 1 SECOND
-- STARTS '2023-05-03 16:22:00'
COMMENT '좌석현황(se_usable) 자동 새로고침'
DO
update seat 
join reservation on re_se_num = se_num
set se_usable = 2
where re_valid_time < now() and se_usable = 1;

-- 이벤트 삭제
DROP event refresh_seat;

