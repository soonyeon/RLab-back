package kr.kh.RLab.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.vo.AlarmVO;

@Service
public class NotificationServiceImp implements NotificationService {
    private static final Logger logger = LoggerFactory.getLogger(NotificationServiceImp.class);
    private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
    private List<AlarmVO> alarms = new CopyOnWriteArrayList<>();

    @Override
    public void registerUser(String userId, SseEmitter emitter) {
        emitters.put(userId, emitter);

        emitter.onCompletion(() -> emitters.remove(userId));
        emitter.onTimeout(() -> emitter.complete());
    }

    @Override
    public void removeUser(String userId) {
        emitters.remove(userId);
    }

    @Override
    public void sendNotificationToUser(String userId, String message) {
        SseEmitter emitter = emitters.get(userId);
        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event().name("notification").data(message));
            } catch (IOException e) {
                logger.error("Error sending notification to user {}", userId, e);
            }
        }

        AlarmVO alarm = new AlarmVO();
        alarm.setAl_me_id(userId);
        alarm.setAl_content(message);
        alarm.setAl_view(0); // 0: 확인하지 않음, 1: 확인함

        addAlarm(alarm);
    }
    @Override
    public void addAlarm(AlarmVO alarm) {
        alarms.add(alarm);
    }

    @Override
    public List<AlarmVO> getUserAlarms(String userId) {
        return alarms.stream().filter(alarm -> alarm.getAl_me_id().equals(userId)).collect(Collectors.toList());
    }
}