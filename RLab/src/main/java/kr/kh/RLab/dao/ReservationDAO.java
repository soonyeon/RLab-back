package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.pagination.ReservationCriteria;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.ItemVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.ReservationVO;
import kr.kh.RLab.vo.SeatVO;
import kr.kh.RLab.vo.TicketOwnVO;

public interface ReservationDAO {

	int selectAllPointById(@Param("me_id")String me_id);

	int insertPay(@Param("pa")PayDTO payDto);

	int insertPayDetail(@Param("pa_order_id")String pa_order_id, @Param("items")ArrayList<ItemVO> itemList);

	ArrayList<ItemVO> selectPayDetailByPaOrderId(@Param("pa_order_id")String paOrderId);

	int updatePayDetailState(@Param("pd")ItemVO pd);
	
	PayDTO selectPayByPaOrderId(@Param("pa_order_id")String paOrderId);

	void insertTicketOwn(@Param("pay")PayDTO payDto);

	int insertTicketOwn(@Param("pa_me_id")String pa_me_id,@Param("pa_order_id")String paOrderId,@Param("pd")ItemVO pd);

	int updateMePoint(@Param("pay")PayDTO payDto);

	void insertPoint(@Param("pay")PayDTO payDto);

	void insertUsedPoint(@Param("pay")PayDTO payDto);

	void deletePayByPaOrderId(@Param("pa_order_id")String orderId);

	void deletePayDetailByPaOrderId(@Param("pa_order_id")String orderId);

	ArrayList<String> selectItemStrList(@Param("pa_order_id")String paOrderId);

	ArrayList<BranchVO> selectAllBranch(@Param("cri")ReservationCriteria cri);

	int selectBranchTotalCount(@Param("cri")ReservationCriteria cri);

	ArrayList<BranchVO> selectBranchBySearchName(@Param("search")String search, @Param("region")String region);

	BranchVO selectBranchByBr_num(@Param("br_num")int br_num);

	ArrayList<TicketOwnVO> selectSeatTicketOwnById(@Param("me_id")String me_id);

	ReservationVO selectMyReservation(@Param("ki_num")int kind,@Param("me_id") String me_id);

	int insertReservation(@Param("se_ki_num")int se_ki_num, @Param("book")ReservationVO book);
	
	int selectTiNum(int re_to_num);
	
	int selectTiPeriod(int tiNum);
	
	void updateTicketState(int re_to_num);

	int updateTicketRestTime(ReservationVO book);
	
	int selectRestTime(int re_to_num);

	int updateMemberUseTime(ReservationVO book);

	GrowthVO getMypet(String re_me_id);

	int updatePetExp(ReservationVO book);

	void updateMypetLevel(String re_me_id);

	ReservationVO selectReservationByBook(ReservationVO book);

	String selectTicketName(ReservationVO rsv);

	int selectTicketRestTime(int re_to_num);

	ArrayList<TicketOwnVO> selectCabinetTicketOwnById(String me_id);

	ReservationVO selecetReservation(@Param("re_num")int reNum);

	BranchVO selectBranchBySenum(int re_se_num);

	ArrayList<SeatVO> selectBranchSeat(@Param("br_num")int br_num, @Param("ki_num")int ki_num);

	void updateSeatUsability(@Param("se_ki_num")int se_ki_num, @Param("book")ReservationVO book);
	
	ArrayList<BranchVO> selectAllBranchToMain();

}
