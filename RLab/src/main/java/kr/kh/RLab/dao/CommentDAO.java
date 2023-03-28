package kr.kh.RLab.dao;

import java.util.List;
import java.util.Map;

import kr.kh.RLab.vo.CommentVO;

public interface CommentDAO {
	
	 int insertComment(CommentVO comment);

	int getCommentCount(int co_ex_num);

	List<CommentVO> getCommentList(Map<String, Object> map);
	

}
