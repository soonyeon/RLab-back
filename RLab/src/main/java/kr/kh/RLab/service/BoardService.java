package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.Map;

import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;

public interface BoardService {
    //게시글 작성
	boolean insertBoard(BoardVO board, MemberVO member);
    //게시글 리스트
	ArrayList<BoardVO> selectBoardList(Map<String, Object> map);
	//게시글 상세조회
	BoardVO getBoard(int bo_num);
	int getCount();
	
}
