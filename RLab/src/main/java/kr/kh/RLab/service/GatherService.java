package kr.kh.RLab.service;


import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TagVO;

public interface GatherService {

	boolean insertStudy(StudyVO study,MemberVO member,RegionVO region,MultipartFile [] files,FileVO file,TagVO tag,TagRegisterVO tagRegister);

	boolean insertGather(MemberVO member, GatherVO gather, StudyVO study);

	ArrayList<StudyVO> selectStudyAll();

	ArrayList<FileVO> selectFileList();

	ArrayList<TagRegisterVO> selectTagList();


	GatherVO getGather(int st_num);







}