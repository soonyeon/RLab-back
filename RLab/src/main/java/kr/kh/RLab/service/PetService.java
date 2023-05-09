package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PetVO;

public interface PetService {

	ArrayList<PetVO> selectPetList();

	 ArrayList<EvolutionVO> selectPetFile();

	int insertChoosePet(GrowthVO growth);

	int deletePet(String gr_me_id);

	void getPrize(int gr_pe_num, String gr_me_id);


	


}
