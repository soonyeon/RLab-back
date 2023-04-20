package kr.kh.RLab.dao;

import java.util.ArrayList;

import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.PetVO;

public interface PetDAO {

	ArrayList<PetVO> selectPetList();

	 ArrayList<EvolutionVO> selectPetFile();

	int insertChoosePet(GrowthVO growth);

	int deletePet(String gr_me_id);

	void insertPointPetPrize(String gr_me_id);

	void updateMyPoint(String gr_me_id);

	void insertPayPrize(String gr_me_id);

	void insertTicektOwnPetPrize(String gr_me_id);

	void updateMyTicket(String gr_me_id);

	void insertTicektOwnPetPrize2(String gr_me_id);

	void updateMyTicket2(String gr_me_id);





}
