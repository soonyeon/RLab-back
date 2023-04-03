package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TagVO;

public interface GatherDAO {

	boolean insertStudy(@Param("study")StudyVO study);

	void insertFile(@Param("file")FileVO fileVo);

	void insertTag(@Param("tag")TagVO tagVO);

	void insertStudyTag(@Param("st_num")int st_num, @Param("ta_name")String ta_name);

	boolean insertGather(@Param("gather")GatherVO gather);

	ArrayList<StudyVO> selectStudyAll(@Param("cri")Criteria cri);

	ArrayList<FileVO> selectFileList();

	ArrayList<TagRegisterVO> selectTagList();

	GatherVO selectGather(@Param("st_num")int st_num);

	StudyVO selectStudy(@Param("st_num")int st_num);

	void countViews(@Param("st_num")int st_num);

	int selectStudyTotalCount(@Param("cri")Criteria cri);





}