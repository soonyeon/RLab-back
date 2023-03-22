package kr.kh.RLab.service;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.BoardDAO;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImp implements BoardService {
	
	private final BoardDAO boardDao;

	@Override
	public boolean insertBoard(BoardVO board, MemberVO member) {
		if(member == null)
			return false;
		if(!checkBoard(board))
			return false;
		board.setBo_me_id(member.getMe_id());
		System.out.println("board====" + board);
		return boardDao.insertBoard(board);
	}
	
	private boolean checkBoard(BoardVO board) {
		if(board == null || 
				board.getBo_title() == null || board.getBo_title().trim().length() == 0 ||
				board.getBo_content() == null || board.getBo_content().trim().length() == 0)
			return false;
		return true;
	}

}
