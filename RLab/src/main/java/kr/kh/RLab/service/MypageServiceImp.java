package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.MypageDAO;
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.TagRegisterVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MypageServiceImp implements MypageService {
	
	private final MypageDAO mypageDao;

	// [나의 게시글 > 작성글 관리]
		// 아이디로 작성 게시글 목록 가져오기
		@Override
		public ArrayList<BoardVO> getBoardListById(String memberId, Criteria cri) {
			if(memberId == null)
				return null;
			return mypageDao.selectBoardListById(memberId, cri);
		}
		
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		@Override
		public int getPostBoardTotalCount(String memberId) {
			System.out.println(memberId);
			int totalCount = mypageDao.selectPostBoardTotalCount(memberId);
			return totalCount;			
		}
		
	// [나의 스크랩 > 작성글 관리]	
		// 아이디로 스크랩한 게시글 목록 가져오기
		@Override
		public ArrayList<BoardVO> getScrapListById(String memberId, Criteria cri) {
			if(memberId == null)
				return null;
			return mypageDao.selectScrapListById(memberId, cri);
		}
		
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		@Override
		public int getScrapBoardTotalCount(String memberId) {
			int totalCount = mypageDao.selectScrapBoardTotalCount(memberId);
			return totalCount;
		}

		
	// [나의 모집글 > 작성글 관리]
		// 아이디로 내가 쓴 모집글 가져오기
		@Override
		public ArrayList<GatherVO> getGatherListById(String memberId, Criteria cri) {
			if(memberId == null)
				return null;
			return mypageDao.selectGatherListById(memberId, cri);
		}
		
		// 내가 쓴 모집글 스터디의 태그들 가져오기
		@Override
		public ArrayList<TagRegisterVO> selectTagListById(String memberId) {
			ArrayList<TagRegisterVO> tagList =  mypageDao.selectTagListById(memberId);
			return tagList;
		}


}
