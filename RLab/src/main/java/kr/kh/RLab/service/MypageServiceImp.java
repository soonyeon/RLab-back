package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.MypageDAO;
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MypageServiceImp implements MypageService {
	
	private final MypageDAO mypageDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//[마이페이지 홈 > 적립 포인트]
	@Override
	public int getMyPoint(String userId) {
		 if (userId == null) {
		        return 0;
		    }
		 return mypageDao.selectMyPoint(userId);

	}
	
	//[마이페이지 홈 > 나의 스터디]
	@Override
	public ArrayList<StudyVO> getMainStudyList(String userId) {
		if(userId == null)
			return null;
		return mypageDao.selectMainStudyList(userId);
	}
	
	
	//[마이페이지 홈 > 나의 스크랩]
	@Override
	public ArrayList<BoardVO> getMainScrapList(String userId) {
		if(userId == null)
			return null;
		return mypageDao.selectMainScrapList(userId);
	}

	
	//[개인정보 수정 > 비밀번호 체크]
		@Override
		public boolean checkPw(MemberVO pw, MemberVO user) {
			//입력한 비번과 암호화된 비번이 같은지를 확인'
			String pwRegex = "^[a-zA-Z0-9!@#$]{8,20}$";
			if(pw.getMe_pw() == null || 
					!Pattern.matches(pwRegex, pw.getMe_pw()))
				return false;
			if(user == null)
				return false;
			if(passwordEncoder.matches(pw.getMe_pw(), user.getMe_pw()))		
				return true;
			return false;
		}
	
	//[개인정보 수정 > 비밀번호 체크 > 개인정보 수정창]
		// 프로필 이미지 수정
		@Override
		public boolean editImg(MemberVO member, MemberVO user) {
			System.out.println(member);
			 try {
			        int result = mypageDao.updateProfile(member);
			        if(result == 0) {
			        	return false;
			        }	        
			    } catch (Exception e) {
			        // 예외 처리 코드 추가
			        e.printStackTrace();
			    }
			return true;
		}
		// 나머지 개인정보 수정
			@Override
			public boolean editUser(MemberVO member, MemberVO user) {
			   if (member == null) {
			        return false;
			    }
			    if(!member.getMe_pw().equals("")) {
				    String newPw = passwordEncoder.encode(member.getMe_pw());
				    member.setMe_pw(newPw);
			    }else {
			    	member.setMe_pw(user.getMe_pw());
			    }
			    try {
			        int result = mypageDao.updateMember(member);
			        if(result == 0) {
			        	return false;
			        }		        
			    } catch (Exception e) {
			        e.printStackTrace();
			    }		
			return true;
			}
	
	
	//[작성글 관리 > 나의 게시글]
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
			int totalCount = mypageDao.selectPostBoardTotalCount(memberId);
			return totalCount;			
		}
		
	//[작성글 관리 > 나의 스크랩]
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
	
		
	//[작성글 관리 > 나의 모집글]
		// 아이디로 내가 쓴 모집글 가져오기
		@Override
		public ArrayList<GatherVO> getGatherListById(String memberId, GatherCriteria cri) {
			if(memberId == null)
				return null;
			System.out.println("me_id" + memberId);
			return mypageDao.selectGatherListById(memberId, cri);
		}
		
		// 내가 쓴 모집글 스터디의 태그들 가져오기
		@Override
		public ArrayList<TagRegisterVO> selectTagListById(String memberId) {
			ArrayList<TagRegisterVO> tagList =  mypageDao.selectTagListById(memberId);
			return tagList;
		}
		
		// 로그인한 회원이 작성한 모집글 전체 수 가져오기
		@Override
		public int getGatherTotalCount(String memberId) {
			int totalCount = mypageDao.selectGatherTotalCount(memberId);
			return totalCount;
		}
		
		// 내가 쓴 모집글의 찜 여부 가져오기
		@Override
		public ArrayList<Integer> selectWantListById(String memberId) {
			ArrayList<Integer> wantList = mypageDao.selectWantListById(memberId);
			return wantList;
		}

		//내 펫 정보 가져오기
		@Override
		public GrowthVO selectMyPet(String memberId) {
			return mypageDao.selectMyPet(memberId);
		}




}
