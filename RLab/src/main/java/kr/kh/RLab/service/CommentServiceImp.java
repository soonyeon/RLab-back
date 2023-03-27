package kr.kh.RLab.service;

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

}
