package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.RLab.vo.BranchVO;

public interface ReservationDAO {

	int selectAllPointById(@Param("me_id")String me_id);

	ArrayList<BranchVO> selectAllBranch();

	ArrayList<BranchVO> selectBranchBySearchName(@Param("search")String search, @Param("region")String region);

}
