package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.MemberVO;

public interface CommentService {

	int createComment(CommentVO comment);

	int getCommentTotalCount(int co_ex_num);

	List<CommentVO> getCommentList(Criteria cri);

	boolean deleteComment(CommentVO comment, MemberVO user);

	boolean updateComment(CommentVO comment, MemberVO user);

	ArrayList<CommentVO> selectCommentByBoNum(int bo_num);

	void deleteCommentAll(ArrayList<CommentVO> comment, MemberVO user);

	CommentVO getCommentByCoNum(int co_ori_num);


}
