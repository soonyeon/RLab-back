package kr.kh.RLab.service;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.MemberDAO;
import kr.kh.RLab.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	

	@Override
	public boolean signup(MemberVO member) {
	    if (member == null) {
	        return false;
	    }
	    
	    String newPw = passwordEncoder.encode(member.getMe_pw());
	    member.setMe_pw(newPw);
	    
	    try {
	        int result = memberDao.insertMember(member);
	        System.out.println(result);
	        if (result != 0) {
	            memberDao.updateAuthority(member.getMe_id(), 1);
	            return true;
	        }
	    } catch (Exception e) {
	        // 예외 처리 코드 추가
	        e.printStackTrace();
	    }
	    
	    return false;
	}

	
	@Override
	public boolean checkId(MemberVO user) {
		if(user == null || 
			user.getMe_id() == null || 
			user.getMe_id().trim().length() == 0)
			return false;
		return memberDao.selectMemberById(user.getMe_id()) == null;
	}

	@Override
	public boolean checkName(MemberVO user) {
		if(user == null || user.getMe_name()==null || user.getMe_name().trim().length()==0)
		return false;
		return memberDao.selectMemberByName(user.getMe_name()) == null;
	}

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
		//입력한 비번과 암호화된 비번이 같은지를 확인
		if(passwordEncoder.matches(member.getMe_pw(), user.getMe_pw()))
			return user;
		return null;
	}


	@Override
	public boolean checkPw(MemberVO pw, MemberVO user) {
		//입력한 비번과 암호화된 비번이 같은지를 확인'
		String pwRegex = "^[a-zA-Z0-9!@#$]{8,20}$";
		if(pw.getMe_pw() == null || 
				!Pattern.matches(pwRegex, pw.getMe_pw()))
			return false;
//		user = memberDao.selectMemberByPw(pw.getMe_pw());
		System.out.println(user);
		System.out.println(pw);
		if(user == null)
			return false;
		if(passwordEncoder.matches(pw.getMe_pw(), user.getMe_pw()))		
//		if(passwordEncoder.matches(user.getMe_pw(), pw.getMe_pw()))
			return true;
		return false;
	}

}
