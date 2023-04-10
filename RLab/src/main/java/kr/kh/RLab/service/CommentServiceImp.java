package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.CommentDAO;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentServiceImp implements CommentService {
	
	private final CommentDAO commentDao;

	@Override
	public int createComment(CommentVO comment) {
		if(comment == null)
			return 0;
		return commentDao.insertComment(comment);
	}

	@Override
	public int getCommentTotalCount(int co_ex_num) {
		return commentDao.getCommentCount(co_ex_num);
	}

	@Override
	public List<CommentVO> getCommentList(Map<String, Object> map) {
		return commentDao.getCommentList(map);
	}

	@Override
	public boolean deleteComment(CommentVO comment, MemberVO user) {
		if(comment == null || user == null)
			return false;
		CommentVO dbComment = commentDao.selectComment(comment.getCo_num());
		if(dbComment == null || !dbComment.getCo_me_id().equals(user.getMe_id()))
			return false;
		return commentDao.deleteComment(comment) != 0;
	}

	@Override
	public boolean updateComment(CommentVO comment, MemberVO user) {
		if(comment == null || user == null)
			return false;
		CommentVO dbComment = commentDao.selectComment(comment.getCo_num());
		if(dbComment == null || !dbComment.getCo_me_id().equals(user.getMe_id()))
			return false;
		return commentDao.updateComment(comment) != 0;
	}

	@Override
	public ArrayList<CommentVO> selectCommentByBoNum(int bo_num) {
		if(bo_num == 0)
			return null;
		return commentDao.selectCommentByBoNum(bo_num);
	}

	@Override
	public void deleteCommentAll(ArrayList<CommentVO> comment, MemberVO user) {
		commentDao.deleteCommentAll(comment,user.getMe_id());
	}

}
