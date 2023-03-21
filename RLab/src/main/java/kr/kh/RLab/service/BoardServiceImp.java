package kr.kh.RLab.service;

import org.springframework.stereotype.Service;

import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;

@Service
public class BoardServiceImp implements BoardService {

	@Override
	public boolean insertBoard(BoardVO board, MemberVO member) {
		if(board == null || member == null)
			return false;
		if(board.getBo_title().trim().length() == 0 || board.getBo_content().trim().length() == 0)
			return false;
	}

}
