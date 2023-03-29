package kr.kh.RLab.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagVO;

public interface GatherDAO {

	boolean insertStudy(@Param("study")StudyVO study);

	void insertFile(@Param("file")FileVO fileVo);

	void insertTag(@Param("tag")TagVO tagVO);

	void insertStudyTag(@Param("st_num")int st_num, @Param("ta_name")String ta_name);

}