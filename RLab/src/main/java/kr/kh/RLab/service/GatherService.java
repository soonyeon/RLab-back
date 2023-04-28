package kr.kh.RLab.service;


import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TagVO;

public interface GatherService {

	boolean insertStudy(StudyVO study,MemberVO member,RegionVO region,
			MultipartFile [] files,FileVO file,TagVO tag,TagRegisterVO tagRegister,StudyMemberVO studyMember);

	boolean insertGather(MemberVO member, GatherVO gather, StudyVO study);

	ArrayList<StudyVO> selectStudyAll(GatherCriteria gcri);

	ArrayList<FileVO> selectFileList();

	ArrayList<TagRegisterVO> selectTagList();

	GatherVO getGather(int st_num);

	StudyVO getStudy(int st_num);

	int getStudyTotalCount(GatherCriteria gcri);

	ArrayList<Integer> selectStudyList();

	ArrayList<Integer> selectWantedStudyList(MemberVO user);

	ArrayList<Integer> selectStudyMemberList(MemberVO user);

	StudyMemberVO selelctJoinStudyMemberList(MemberVO user, int st_num);

	ArrayList<StudyVO> selectStudyById(MemberVO member);

	ArrayList<GatherVO> selectGatherAll();

	GatherVO getGatherByComment(int co_ori_num);
	ArrayList<String> getSearchTagList(String search);

	ArrayList<GatherVO> findGatherdById(String me_id);

	GatherVO selectGather(int ga_num, MemberVO user);

	boolean updateGather(GatherVO gather);

	void deleteGather(int ga_num);



	

	










}