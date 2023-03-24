package kr.kh.RLab.service;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.dao.MemberDAO;
import kr.kh.RLab.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	


	@Override
	public MemberVO login(MemberVO member) {
		//아이디, 비번 유효성 검사
		if(member == null)
			return null;
		String idRegex = "^[a-zA-Z][a-zA-Z0-9!@#$]{4,12}$";
		String pwRegex = "^[a-zA-Z0-9!@#$]{8,20}$";
		if(member.getMe_id() == null || 
				!Pattern.matches(idRegex, member.getMe_id()))
			return null;
		if(member.getMe_pw() == null || 
				!Pattern.matches(pwRegex, member.getMe_pw()))
			return null;
		//아이디가 일치하는 회원 정보를 가져옴
		MemberVO user = memberDao.selectMemberById(member.getMe_id());
//		System.out.println(user);
		
		if(user == null)
			return null;
		//입력한 비번과 저장된 비번이 같은지를 확인'
		if(member.getMe_pw().equals(user.getMe_pw()));
			return user;
			
	}
	


}
