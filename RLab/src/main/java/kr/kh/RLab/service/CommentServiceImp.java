package kr.kh.RLab.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.CommentDAO;
import kr.kh.RLab.vo.CommentVO;
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

}
