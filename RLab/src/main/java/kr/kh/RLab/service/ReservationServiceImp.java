package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.ReservationDAO;
import kr.kh.RLab.vo.ItemVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.BranchVO;
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
	public ArrayList<BranchVO> getAllBranchList() {
		return reservationDao.selectAllBranch();
	}

	@Override
	public ArrayList<BranchVO> searchBranchList(BranchVO br) {
		String search = "%"+br.getBr_name()+"%";
		return reservationDao.selectBranchBySearchName(search, br.getBr_re_name());
	}

	@Override
	public BranchVO getBranchByBrNum(int br_num) {
		return reservationDao.selectBranchByBr_num(br_num);
	}

	@Override
	public ArrayList<TicketOwnVO> getTicketOwnListById(String me_id) {
		return reservationDao.selectAllTicketOwnById(me_id);
	}

}
