package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.ReservationVO;
import kr.kh.RLab.vo.SeatVO;
import kr.kh.RLab.pagination.ReservationCriteria;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.TicketOwnVO;

public interface ReservationService {

	int getUserPoint(String me_id);

	boolean insertPayment(PayDTO payDto);

	void setPaymentSuccessed(String paOrderId, MemberVO user);

	PayDTO getPayDto(String paOrderId);
	
	void deleteCanceledPayment(String receiptId);

	String getItemStrList(String paOrderId);
	
	ArrayList<BranchVO> getAllBranchList(ReservationCriteria cri);

	int getBranchTotalCount(ReservationCriteria cri);

	BranchVO getBranchByBrNum(int br_num);

	ArrayList<TicketOwnVO> getSeatTicketOwnListById(String me_id);

	ReservationVO getMyReservation(int kind, String me_id);

	void reserveSeat(ReservationVO book);
	
	void reserveCabinet(ReservationVO book);

	ReservationVO getReservationByBookInfo(ReservationVO book);

	String getTicketNameByBookInfo(ReservationVO rsv);

	int getRestTime(int re_to_num);

	ArrayList<TicketOwnVO> getCabinetTicketOwnListById(String me_id);

	ReservationVO getReservation(int reNum);

	BranchVO getBranchBySeNum(int re_se_num);

	ArrayList<SeatVO> getBranchSeat(int br_num, int ki_num);

	ArrayList<BranchVO> getAllBranchListToMain();

}
