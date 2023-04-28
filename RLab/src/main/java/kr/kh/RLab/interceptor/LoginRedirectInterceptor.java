package kr.kh.RLab.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.RLab.service.MemberService;
import kr.kh.RLab.vo.MemberVO;

public class LoginRedirectInterceptor extends HandlerInterceptorAdapter  {

	@Autowired
	MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) 
			return true;

		String prevUrl = (String)session.getAttribute("prevURL");
		if(prevUrl == null)
			return true;
		response.sendRedirect(prevUrl);
		session.removeAttribute("prevURL");
		return false;
	}
}