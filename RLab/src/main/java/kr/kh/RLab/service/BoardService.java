package kr.kh.RLab.service;

import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;

public interface BoardService {

	boolean insertBoard(BoardVO board, MemberVO member);

}
