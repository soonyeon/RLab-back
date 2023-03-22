package kr.kh.RLab.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.BoardVO;

public interface BoardDAO {

	boolean insertBoard(@Param("board")BoardVO board);

}
