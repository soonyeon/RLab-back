package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.ReservationDAO;
import kr.kh.RLab.vo.ItemVO;
import kr.kh.RLab.vo.PayDTO;

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
	public void setPaymentSuccessed(String paOrderId) {
		System.out.println("넘어온 pa_order_id:"+paOrderId);
		paOrderId = "qwe12321412962";
		//pay_detail 테이블 '결제완료'로 업데이트
		ArrayList<ItemVO> pdList = reservationDao.selectPayDetailByPaOrderId(paOrderId);
		for(ItemVO pd : pdList) {
			if(reservationDao.updatePayDetailState(pd)==0) {
				System.out.println("결제완료 변경 실패");
				return;
			}
		}
		//payDto.setItemList(pdList);
		//System.out.println(payDto);
		
		
	}

}
