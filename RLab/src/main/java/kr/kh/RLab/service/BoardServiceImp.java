package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.BoardDAO;
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
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
		return boardDao.insertBoard(board);
	}
	
	private boolean checkBoard(BoardVO board) {
		if(board == null || 
				board.getBo_title() == null || board.getBo_title().trim().length() == 0 ||
				board.getBo_content() == null || board.getBo_content().trim().length() == 0)
			return false;
		return true;
	}


	@Override
	public BoardVO getBoard(int bo_num) {
		boardDao.countViews(bo_num);
		return boardDao.getBoard(bo_num);
	}

	@Override
	public ArrayList<BoardVO> selectBoardList(Criteria cri) {
		return boardDao.selectBoardList(cri);
	}

	@Override
	public int getCount() {
		return boardDao.getCount();
	}

	@Override
	public void deleteBoard(int bo_num) {
		boardDao.deleteBoard(bo_num);
	}

	@Override
	public boolean updateBoard(BoardVO board) {
		if(!checkBoard(board))
			return false;
		return boardDao.updateBoard(board);
	}

	@Override
	public ArrayList<StudyVO> selectStudyList() {
		return boardDao.selectStudyList();
	}

	@Override
	public BoardVO getBoardByComment(int co_num) {
		if(co_num == 0)
			return null;
		return boardDao.getBoardByComment(co_num);
	}

}
