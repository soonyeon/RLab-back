package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;

public interface HomeService {

	ArrayList<StudyVO> selectStudyAll();

	ArrayList<GatherVO> selectGatherAll();

	ArrayList<FileVO> selectFileList();

	ArrayList<TagRegisterVO> selectTagList();

	ArrayList<Integer> selectWantedStudyList(MemberVO user);
  
	
}
