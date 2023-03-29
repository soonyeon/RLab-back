package kr.kh.RLab.service;

import java.util.List;
import java.util.Map;

import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.MemberVO;

public interface CommentService {

	int createComment(CommentVO comment);

	int getCommentTotalCount(int co_ex_num);

	List<CommentVO> getCommentList(Map<String, Object> map);

	boolean deleteComment(CommentVO comment, MemberVO user);

}
