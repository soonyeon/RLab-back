package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;

public interface BoardDAO {


	boolean insertBoard(@Param("board")BoardVO board);

	ArrayList<BoardVO> selectBoardList(Criteria cri);

	BoardVO getBoard(@Param("bo_num") int bo_num);

	int getCount();

	void countViews(@Param("bo_num") int bo_num);

	void deleteBoard(int bo_num);

	boolean updateBoard(BoardVO board);

	ArrayList<StudyVO> selectStudyList();

	ArrayList<BoardVO> selectBoardListById(@Param("memberId")String memberId, @Param("cri")Criteria cri);
	
	int getCountById(String memberId);
}
