package kr.kh.RLab.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.MemberDAO;
import kr.kh.RLab.vo.MemberVO;



@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDAO memberDao;


	
	@Override
	public boolean signup(MemberVO member) {
	    if (member == null) {
	        return false;
	    }
	    int result = memberDao.insertMember(member);
	    if (result != 0) {
	        memberDao.updateAuthority(member.getMe_id(), 1);
	        return true;
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




}

	


