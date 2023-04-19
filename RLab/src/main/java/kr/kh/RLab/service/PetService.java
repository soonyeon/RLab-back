package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.PetVO;

public interface PetService {

	ArrayList<PetVO> selectPetList();

	 ArrayList<EvolutionVO> selectPetFile();

	int insertChoosePet(GrowthVO growth);


	


}
