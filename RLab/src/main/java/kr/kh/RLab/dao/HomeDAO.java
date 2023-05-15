package kr.kh.RLab.dao;

import java.util.ArrayList;

import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;

public interface HomeDAO {

	ArrayList<StudyVO> selectStudyAll();

	ArrayList<GatherVO> selectGatherAll();

	ArrayList<FileVO> selectFileList();

	ArrayList<TagRegisterVO> selectTagList();

	ArrayList<Integer> selectWantedStudyList(String me_id);


}
