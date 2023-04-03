package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.StudyVO;

public interface BoardDAO {


	boolean insertBoard(@Param("board")BoardVO board);

	ArrayList<BoardVO> selectBoardList(Map<String, Object> map);

	BoardVO getBoard(@Param("bo_num") int bo_num);

	int getCount();

	void countViews(@Param("bo_num") int bo_num);

	void deleteBoard(int bo_num);

	boolean updateBoard(BoardVO board);

	ArrayList<StudyVO> selectStudyList(String st_me_id);
}
