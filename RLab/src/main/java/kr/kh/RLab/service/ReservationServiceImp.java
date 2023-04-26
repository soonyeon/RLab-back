package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.ReservationDAO;
import kr.kh.RLab.pagination.ReservationCriteria;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.ItemVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.ReservationVO;
import kr.kh.RLab.vo.TicketOwnVO;

@Service
public class ReservationServiceImp implements ReservationService {
	
	@Autowired
	ReservationDAO reservationDao;

	@Override
	public int getUserPoint(String me_id) {
		return reservationDao.selectAllPointById(me_id);
	}

	@Override
	public boolean insertPayment(PayDTO payDto) {
		if(payDto.getPa_order_id().equals("")) {
			System.out.println("pa_order_id가 없습니다.");
			return false;
		}
		if(reservationDao.insertPay(payDto)==0) {
			System.out.println("pay 등록 실패");
			return false;
		}
		if(reservationDao.insertPayDetail(payDto.getPa_order_id(), payDto.getItemList()) == 0){
			System.out.println("pay_detail 등록 실패");
			return false;
		}
		System.out.println("서비스 임플 - 사전 데이터 등록 성공");
		return true;
	}

	@Override
	public void setPaymentSuccessed(String paOrderId, MemberVO user) {
		System.out.println("넘어온 pa_order_id:"+paOrderId);
		PayDTO pay = reservationDao.selectPayByPaOrderId(paOrderId);
		
		if(!pay.getPa_me_id().equals(user.getMe_id())) {
			System.out.println("로그인한 사용자와 구매진행자 정보가 일치하지 않습니다.");
			return;
		}
		ArrayList<ItemVO> pdList = reservationDao.selectPayDetailByPaOrderId(paOrderId);
		for(ItemVO pd : pdList) {
			//pay_detail 테이블 '결제완료'로 업데이트
			if(reservationDao.updatePayDetailState(pd)==0) {
				System.out.println("결제완료 변경 실패");
				return;
			}
			//ticket_own 테이블에 구매한 티켓 수만큼 데이터 추가
			for(int i=0; i<pd.getPd_amount(); i++) {
				if(reservationDao.insertTicketOwn(pay.getPa_me_id(),paOrderId,pd) == 0) {
					System.out.println("ticket_own 데이터 입력 실패");
					return;
				}
			}
			
		}
		//member 누적적립액 수정
		if(reservationDao.updateMePoint(pay) == 0) {
			System.out.println("누적적립액 적용 실패");
			return;
		}
		//point 적립내역 추가 (적립,사용액이 0이 아닐때만)
		if(pay.getPa_point()!=0)
			reservationDao.insertPoint(pay);
		if(pay.getPa_used_point()!=0)
			reservationDao.insertUsedPoint(pay);
		
	}

	@Override
	public PayDTO getPayDto(String paOrderId) {
		PayDTO pay = reservationDao.selectPayByPaOrderId(paOrderId);
		if(pay==null)
			return null;
		ArrayList<ItemVO> pdList = reservationDao.selectPayDetailByPaOrderId(paOrderId);
		pay.setItemList(pdList);
		return pay;
	}
	
	@Override
	public void deleteCanceledPayment(String orderId) {
		//pd테이블 삭제
		reservationDao.deletePayDetailByPaOrderId(orderId);
		//pay테이블 삭제
//		PayDTO pay = reservationDao.selectPayByPaOrderId(orderId);
		reservationDao.deletePayByPaOrderId(orderId);
	}

	@Override
	public String getItemStrList(String paOrderId) {
		ArrayList<String> itemStrList = reservationDao.selectItemStrList(paOrderId);
		String itemStr = String.join(", ", itemStrList);
		System.out.println(itemStr);
		return itemStr;
	}

	@Override
	public ArrayList<BranchVO> getAllBranchList(ReservationCriteria cri) {
		return reservationDao.selectAllBranch(cri);
	}

	@Override
	public int getBranchTotalCount(ReservationCriteria cri) {
		return reservationDao.selectBranchTotalCount(cri);
	}
	
	@Override
	public BranchVO getBranchByBrNum(int br_num) {
		return reservationDao.selectBranchByBr_num(br_num);
	}

	@Override
	public ArrayList<TicketOwnVO> getSeatTicketOwnListById(String me_id) {
		return reservationDao.selectSeatTicketOwnById(me_id);
	}

	@Override
	public ReservationVO getMyReservation(int kind, String me_id) {
		return reservationDao.selectMyReservation(2, me_id);
	}

	@Override
	public void reserveSeat(ReservationVO book) {
		int tiNum = reservationDao.selectTiNum(book.getRe_to_num());
		if(tiNum!=6 && tiNum!=7 && tiNum!=8) 
			book.setRe_hours(reservationDao.selectTiPeriod(tiNum));

		//reservation에 추가
		if(reservationDao.insertReservation(1,book)!=0)
			System.out.println("좌석 예약추가 성공");
		
		//to_rest_time 소유중인 이용권의 잔여시간 감소(시간패키지면 사용시간만큼, 아니면 ti_period만큼)
		reservationDao.updateTicketRestTime(book);
		//잔여시간이 0이면 to_state를 0으로 변경
		if(reservationDao.selectRestTime(book.getRe_to_num())<=0)
			reservationDao.updateTicketState(book.getRe_to_num());
		
		//me_use_time 누적이용시간 추가
		if(reservationDao.updateMemberUseTime(book)==0)
			System.out.println("회원 누적사용시간 증가 실패");
		
		GrowthVO myPet = reservationDao.getMypet(book.getRe_me_id());
		//pet있을 경우
		if(myPet != null) {
			//gr_exp 펫 누적경험치 추가(펫의 최대레벨에 해당하는 경험치를 넘어가면 안됨)
			reservationDao.updatePetExp(book);
			int exp = myPet.getGr_exp();
			//펫의 누적경험치가 올라서 레벨업 필요하면 update
			reservationDao.updateMypetLevel(book.getRe_me_id());
		}
	}
	
	@Override
	public void reserveCabinet(ReservationVO book) {
		int tiNum = reservationDao.selectTiNum(book.getRe_to_num());
		book.setRe_hours(reservationDao.selectTiPeriod(tiNum));

		//reservation에 추가
		if(reservationDao.insertReservation(2,book)!=0)
			System.out.println("사물함 예약추가 성공");
		
		//to_rest_time 소유중인 이용권의 잔여시간 감소(시간패키지면 사용시간만큼, 아니면 ti_period만큼)
		reservationDao.updateTicketRestTime(book);
		//잔여시간이 0이면 to_state를 0으로 변경
		if(reservationDao.selectRestTime(book.getRe_to_num())<=0)
			reservationDao.updateTicketState(book.getRe_to_num());
		
		//me_use_time 누적이용시간 추가
		if(reservationDao.updateMemberUseTime(book)==0)
			System.out.println("회원 누적사용시간 증가 실패");
		
		GrowthVO myPet = reservationDao.getMypet(book.getRe_me_id());
		//pet있을 경우
		if(myPet != null) {
			//gr_exp 펫 누적경험치 추가(펫의 최대레벨에 해당하는 경험치를 넘어가면 안됨)
			reservationDao.updatePetExp(book);
			int exp = myPet.getGr_exp();
			//펫의 누적경험치가 올라서 레벨업 필요하면 update
			reservationDao.updateMypetLevel(book.getRe_me_id());
		}
	}

	@Override
	public ReservationVO getReservationByBookInfo(ReservationVO book) {
		int tiNum = reservationDao.selectTiNum(book.getRe_to_num());
		if(tiNum!=6 && tiNum!=7 && tiNum!=8) 
			book.setRe_hours(reservationDao.selectTiPeriod(tiNum));
		return reservationDao.selectReservationByBook(book);
	}

	@Override
	public String getTicketNameByBookInfo(ReservationVO rsv) {
		return reservationDao.selectTicketName(rsv);
	}

	@Override
	public int getRestTime(int re_to_num) {
		return reservationDao.selectTicketRestTime(re_to_num);
	}

	@Override
	public ArrayList<TicketOwnVO> getCabinetTicketOwnListById(String me_id) {
		return reservationDao.selectCabinetTicketOwnById(me_id);
		
	}

	@Override
	public ReservationVO getReservation(int reNum) {
		return reservationDao.selecetReservation(reNum);
	}

	@Override
	public BranchVO getBranchBySeNum(int re_se_num) {
		return reservationDao.selectBranchBySenum(re_se_num);
	}

}
