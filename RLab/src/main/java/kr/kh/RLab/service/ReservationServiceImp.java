package kr.kh.RLab.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.ReservationDAO;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.TicketOwnVO;

@Service
public class ReservationServiceImp implements ReservationService {
	
	@Autowired
	ReservationDAO reservationDao;

	@Override
	public int getUserPoint(String me_id) {
		return reservationDao.selectAllPointById(me_id);
	}

	@Override
	public ArrayList<BranchVO> getAllBranchList() {
		return reservationDao.selectAllBranch();
	}

	@Override
	public ArrayList<BranchVO> searchBranchList(BranchVO br) {
		String search = "%"+br.getBr_name()+"%";
		return reservationDao.selectBranchBySearchName(search, br.getBr_re_name());
	}

	@Override
	public BranchVO getBranchByBrNum(int br_num) {
		return reservationDao.selectBranchByBr_num(br_num);
	}

	@Override
	public ArrayList<TicketOwnVO> getTicketOwnListById(String me_id) {
		return reservationDao.selectAllTicketOwnById(me_id);
	}

}
