package kr.kh.RLab.dao;

import org.apache.ibatis.annotations.Param;

public interface ReservationDAO {

	int selectAllPointById(@Param("me_id")String me_id);

}
