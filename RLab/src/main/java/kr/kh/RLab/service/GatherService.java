package kr.kh.RLab.service;


import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyVO;

public interface GatherService {

	boolean insertStudy(StudyVO study,MemberVO member,RegionVO region,MultipartFile [] files,FileVO file);

}