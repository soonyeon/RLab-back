package kr.kh.RLab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.ReservationDAO;
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
		if(reservationDao.insertPay(payDto)==0) {
			System.out.println("pay 등록 실패");
			return false;
		}
		System.out.println(payDto);
		if(reservationDao.insertPayDetail(payDto.getPa_num(), payDto.getItemList())==0){
			System.out.println("pay_detail 등록 실패");
			return false;
			
		}
		return true;
	}

}
