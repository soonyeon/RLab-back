package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.vo.BranchVO;

public interface ReservationService {

	int getUserPoint(String me_id);

	ArrayList<BranchVO> getAllBranchList();

}
