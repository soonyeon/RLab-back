package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.ItemVO;
import kr.kh.RLab.vo.PayDTO;

public interface ReservationDAO {

	int selectAllPointById(@Param("me_id")String me_id);

	int insertPay(@Param("pa")PayDTO payDto);

	int insertPayDetail(@Param("pa_num")int pa_num, @Param("items")ArrayList<ItemVO> itemList);

}
