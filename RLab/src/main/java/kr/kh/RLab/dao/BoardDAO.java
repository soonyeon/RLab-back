package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.BoardVO;

public interface BoardDAO {


	boolean insertBoard(@Param("board")BoardVO board);

	ArrayList<BoardVO> selectBoardList(Map map);

	BoardVO getBoard(@Param("bo_num") int bo_num);

	int getCount();
}
