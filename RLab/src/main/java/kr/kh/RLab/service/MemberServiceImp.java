package kr.kh.RLab.service;

import java.util.Random;
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
		if (user == null || user.getMe_id() == null || user.getMe_id().trim().length() == 0)
			return false;
		return memberDao.selectMemberById(user.getMe_id()) == null;
	}

	@Override
	public boolean checkName(MemberVO user) {
		if (user == null || user.getMe_name() == null || user.getMe_name().trim().length() == 0)
			return false;
		return memberDao.selectMemberByName(user.getMe_name()) == null;
	}

	@Override
	public MemberVO login(MemberVO member) {
		// 아이디, 비번 유효성 검사
		if (member == null)
			return null;
		String idRegex = "^[a-zA-Z][a-zA-Z0-9!@#$]{4,12}$";
		String pwRegex = "^[a-zA-Z0-9!@#$]{8,20}$";
		if (member.getMe_id() == null || !Pattern.matches(idRegex, member.getMe_id()))
			return null;
		if (member.getMe_pw() == null || !Pattern.matches(pwRegex, member.getMe_pw()))
			return null;
		// 아이디가 일치하는 회원 정보를 가져옴
		MemberVO user = memberDao.selectMemberById(member.getMe_id());

		if (user == null)
			return null;
		// 입력한 비번과 암호화된 비번이 같은지를 확인
		if (passwordEncoder.matches(member.getMe_pw(), user.getMe_pw()))
			return user;
		return null;
	}

	@Override
	public boolean checkPw(MemberVO pw, MemberVO user) {
		// 입력한 비번과 암호화된 비번이 같은지를 확인'
		String pwRegex = "^[a-zA-Z0-9!@#$]{8,20}$";
		if (pw.getMe_pw() == null || !Pattern.matches(pwRegex, pw.getMe_pw()))
			return false;
//		user = memberDao.selectMemberByPw(pw.getMe_pw());
		System.out.println("비번체크 세션" + user);
		System.out.println("비번체크 입력" + pw);
		if (user == null)
			return false;
		if (passwordEncoder.matches(pw.getMe_pw(), user.getMe_pw()))
			return true;
		return false;
	}


	@Override
	public boolean editUser(MemberVO member, MemberVO user) {
		if (member == null) {
			return false;
		}
		System.out.println("기존 정보" + member);
		if (!member.getMe_pw().equals("")) {
			String newPw = passwordEncoder.encode(member.getMe_pw());
			member.setMe_pw(newPw);
		} else {
			member.setMe_pw(user.getMe_pw());
		}
		System.out.println("encoder" + member);
		try {
			int result = memberDao.updateMember(member);
			if (result == 0) {
				return false;
			}

		} catch (Exception e) {
			// 예외 처리 코드 추가
			e.printStackTrace();
		}

		return true;
	}

	@Override
	public boolean editImg(MemberVO member, MemberVO user) {
		System.out.println(member);
		try {
			int result = memberDao.updateProfile(member);
			if (result == 0) {
				return false;
			}

		} catch (Exception e) {
			// 예외 처리 코드 추가
			e.printStackTrace();
		}

		return true;
	}
	
	public void updateSession(MemberVO user) {
		memberDao.updateSession(user);
	}

	@Override
	public MemberVO getMemberBySession(String me_session_id) {
		return memberDao.selectMemberBySession(me_session_id);
	}

	@Override
	public String findIDByEmail(String email) {
		if (email == null)
			return null;
		return memberDao.findIDByEmail(email);
	}

	@Override
	public MemberVO findPWByEmail(String id, String email) {
		if (id == null || email == null)
			return null;
		return memberDao.findPWByEmail(id, email);
	}

	public String generateTempPW() {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			// characters 문자열의 길이에서 무작위로 선택된 정수를 반환
			// characters 문자열에서 선택된 인덱스에 해당하는 문자를 반환
			sb.append(characters.charAt(random.nextInt(characters.length())));
		}
		return sb.toString();
	}

	@Override
	public void updatePW(MemberVO memberVO, String tempPW) {
		String temp = tempPW;
		String encryptedTempPW = passwordEncoder.encode(temp);
		memberVO.setMe_pw(encryptedTempPW);
		memberDao.updatePW(memberVO);
	}
	
	@Override
	public boolean checkEmail(MemberVO user) {
		if (user == null || user.getMe_email() == null || user.getMe_email().trim().length() == 0)
			return false;
		return memberDao.selectMemberByEamil(user.getMe_email()) == null;
	}
	
}
