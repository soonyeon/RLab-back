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
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.ReservationVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TicketOwnVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MypageServiceImp implements MypageService {
	
	private final MypageDAO mypageDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//[마이페이지 홈 > 이용시간]
	@Override
	public ReservationVO getRes(String userId) {
		if (userId == null) {
			return null;
	    }
		return mypageDao.selectRes(userId);
	}
	
	//[마이페이지 홈 > 펫 경험치]
	@Override
	public GrowthVO getPetEx(String userId) {
		if (userId == null) {
			return null;
	    }
		return mypageDao.selectPetEx(userId);
	}
	
	@Override
	public int getLevelUpExp(int currentLevel) {
		return mypageDao.selectLevelUpExp(currentLevel);
	}
	
	@Override
	public int updateExp(int currentEx, String userId) {
		return mypageDao.updateExp(currentEx, userId);
	}
  
  	//[마이페이지 홈 > 펫 정보]
		@Override
		public GrowthVO selectMyPet(String memberId) {
			return mypageDao.selectMyPet(memberId);
		}

		@Override
		public GrowthVO selectPetExp(String memberId) {
			return mypageDao.selectPetExp(memberId);
		}
	
	//[마이페이지 홈 > 적립 포인트]
	@Override
	public int getMyPoint(String userId) {
		 if (userId == null) {
		        return 0;
		  }
		 return mypageDao.selectMyPoint(userId);

	}
	
	//[마이페이지 홈 > 나의 예약]
		//좌석 예약 정보 가져오기
		@Override
		public ReservationVO getMySeat(String userId) {
			if (userId == null) {
		        return null;
		  }
			return mypageDao.selectMySeat(userId);
		}
		
		//사물함 예약 정보 가져오기
		@Override
		public ReservationVO getMyLocker(String userId) {
			if (userId == null) {
		        return null;
		  }
			return mypageDao.selectMyLocker(userId);
		}
	
		@Override
		public ArrayList<ReservationVO> getResList(String userId) {
			if(userId == null)
				return null;
			return mypageDao.selectResList(userId);
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
			
	//[예약 관리 > 나의 결제 내역]	
		//결제 정보 가져오기	
		@Override
		public ArrayList<PayDTO> getPayList(String memberId, Criteria cri) {
			if(memberId == null)
				return null;
			return mypageDao.selectPayList(memberId);
		}
	
		//결제 전체 수 가져오기
		@Override
		public int getPayTotalCount(String memberId) {
			int totalCount = mypageDao.selectPayTotalCount(memberId);
			return totalCount;
		}
		
	//[예약 관리 > 나의 결제 내역 > 결제 상세 내역]	
		//결제번호 가져오기
		@Override
		public String getPaOrderId(String memberId) {
			if(memberId == null)
				return null;
			return mypageDao.selectPaOrderId(memberId);
		}
		//결제번호로 결제 정보 가져오기
		@Override
		public PayDTO getPayDto(String paOrderId) {
			// TODO Auto-generated method stub
			return null;
		}
		// 해당 결제 정보안의 구매목록 가져오기
		@Override
		public String getItemStrList(String paOrderId) {
			// TODO Auto-generated method stub
			return null;
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


}
