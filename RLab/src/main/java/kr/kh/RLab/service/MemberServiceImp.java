package kr.kh.RLab.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.MemberDAO;
import kr.kh.RLab.vo.MemberOKVO;
import kr.kh.RLab.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	private JavaMailSender mailSender;

	
	@Override
	public boolean signup(MemberVO member) {
		if(member == null)
			return false;
		if(memberDao.insertMember(member)!=0)
			memberDao.updateAuthority(member.getMe_id(), 1);
			return true;
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




}

	


