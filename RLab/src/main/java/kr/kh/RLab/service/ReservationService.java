package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.TicketOwnVO;

public interface ReservationService {

	int getUserPoint(String me_id);

	boolean insertPayment(PayDTO payDto);

	void setPaymentSuccessed(String paOrderId, MemberVO user);

	PayDTO getPayDto(String paOrderId);
	
	void deleteCanceledPayment(String receiptId);

	String getItemStrList(String paOrderId);
	
	ArrayList<BranchVO> getAllBranchList();

	ArrayList<BranchVO> searchBranchList(BranchVO br);

	BranchVO getBranchByBrNum(int br_num);

	ArrayList<TicketOwnVO> getTicketOwnListById(String me_id);

}
