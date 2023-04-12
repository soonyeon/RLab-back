package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.ItemVO;
import kr.kh.RLab.vo.PayDTO;

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


}
