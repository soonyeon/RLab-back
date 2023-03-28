package kr.kh.RLab.service;


import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyVO;

public interface GatherService {

	boolean insertStudy(StudyVO study,MemberVO member,RegionVO region);

}