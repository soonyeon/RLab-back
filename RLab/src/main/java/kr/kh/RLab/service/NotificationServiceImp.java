package kr.kh.RLab.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.dao.NotificationDao;
import kr.kh.RLab.vo.AlarmVO;
import kr.kh.RLab.vo.AlarmVO.AlarmType;

@Service
public class NotificationServiceImp implements NotificationService {
    private static final Logger logger = LoggerFactory.getLogger(NotificationServiceImp.class);
    private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
    private List<AlarmVO> alarms = new CopyOnWriteArrayList<>();
    @Autowired
    NotificationDao notificationDao;
    
    @Override
    public void registerUser(String userId, SseEmitter emitter) {
        emitters.put(userId, emitter);

        emitter.onCompletion(() -> emitters.remove(userId));
        emitter.onTimeout(() -> {
            emitters.remove(userId);
            emitter.complete();
        });
        emitter.onError((e) -> {
            logger.error("Error in SseEmitter for user {}: {}", userId, e.getMessage());
            emitters.remove(userId);
        });
    }

    @Override
    public void removeUser(String userId) {
        emitters.remove(userId);
    }

    @Override
    public void sendNotificationToUser(String userId, String message,AlarmType al_type) {
        SseEmitter emitter = null;
        if (emitters.containsKey(userId)) {
            emitter = emitters.get(userId);
        } else {
            // 등록되어 있지 않은 경우 등록
            SseEmitter newEmitter = new SseEmitter();
            registerUser(userId, newEmitter);
            emitter = newEmitter;
        }

        AlarmVO alarm = new AlarmVO(userId, message, 0, al_type);// 0: 확인하지 않음, 1: 확인함
        addAlarm(alarm);
        notificationDao.createNotificationEvent(alarm);
    }

    @Override
    public void addAlarm(AlarmVO alarm) {
        alarms.add(alarm);
    }

    @Override
    public List<AlarmVO> getUserAlrams(String userid) {
        return notificationDao.getUserAlarms(userid);
    }

	@Override
	public void deleteAlarm(int al_num) {
		notificationDao.deleteAlarm(al_num);
	}
	
	@Override
	public int getNewAlarmCount(String userId) {
		return notificationDao.selectNewAlarmCount(userId);
	}
}