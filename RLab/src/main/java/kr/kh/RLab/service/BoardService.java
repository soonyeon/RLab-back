package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.Map;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;

public interface BoardService {
    //게시글 작성
	boolean insertBoard(BoardVO board, MemberVO member);
	
    //게시글 리스트
	ArrayList<BoardVO> selectBoardList(Criteria cri, int st_num);
	
	//게시글 상세조회
	BoardVO getBoard(int bo_num);
	
	//게시글 갯수
	int getCount();
	
	// 게시글 삭제
	void deleteBoard(int bo_num);
	
	//게시글 수정
	boolean updateBoard(BoardVO board);
	
	//스터디 가져오기
	ArrayList<StudyVO> selectStudyList();

	BoardVO getBoardByComment(int co_num);

	
	
	
}
