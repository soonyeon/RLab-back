package kr.kh.RLab.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.MemberVO;

public interface CommentDAO {
	
	 int insertComment(CommentVO comment);

	int getCommentCount(int co_ex_num);

	List<CommentVO> getCommentList(Map<String, Object> map);

	CommentVO selectComment(int co_num);

	int deleteComment(CommentVO comment);

	int updateComment(CommentVO comment);

	ArrayList<CommentVO> selectCommentByBoNum(int bo_num);

	void deleteCommentAll(ArrayList<CommentVO> comment, String me_id);
	

}
