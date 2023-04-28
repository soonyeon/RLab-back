package kr.kh.RLab.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.NotificationService;
import kr.kh.RLab.vo.AlarmVO;
import kr.kh.RLab.vo.MemberVO;

public class AlarmInterceptor implements HandlerInterceptor {

	@Autowired
	private NotificationService notificationService;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("user");

		if (member != null && modelAndView != null) {
			List<AlarmVO> alarm = notificationService.getUserAlrams(member.getMe_id());
			modelAndView.addObject("alarm", alarm);
		}
	}
}
