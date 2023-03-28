package kr.kh.RLab.service;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.GatherDAO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor 
@Service
public class GatherServiceImp implements GatherService{

	private final GatherDAO gatherDao; 
	
	@Override 
	public boolean insertStudy(StudyVO study, MemberVO member,RegionVO region) {
		System.out.println(study);
		System.out.println(member);
	    if (member == null) {
	        return false;
	    }
	    if (study.getSt_name().trim().length()==0 || study.getSt_total_people() < 1 ) {
	        return false;
	    }
	    study.setSt_me_id(member.getMe_id()); 
	    return gatherDao.insertStudy(study); 
	}

		
}