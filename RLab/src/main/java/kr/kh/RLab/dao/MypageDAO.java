package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.TagRegisterVO;

public interface MypageDAO {
	// [나의 게시글 > 작성글 관리]
		// 아이디로 작성 게시글 목록 가져오기
		ArrayList<BoardVO> selectBoardListById(@Param("memberId")String memberId, @Param("cri")Criteria cri);
	
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		int selectPostBoardTotalCount(String memberId);
	
		
	// [나의 스크랩 > 작성글 관리]	
		// 아이디로 스크랩한 게시글 목록 가져오기
		ArrayList<BoardVO> selectScrapListById(@Param("memberId")String memberId, @Param("cri")Criteria cri);
		
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		int selectScrapBoardTotalCount(String memberId);
		
		
	// [나의 모집글 > 작성글 관리]
		// 아이디로 내가 쓴 모집글 가져오기	
		ArrayList<GatherVO> selectGatherListById(@Param("memberId")String memberId, @Param("gatherCri")GatherCriteria cri);
		
		// 내가 쓴 모집글 스터디의 태그들 가져오기
		ArrayList<TagRegisterVO> selectTagListById(String memberId);
	
}
