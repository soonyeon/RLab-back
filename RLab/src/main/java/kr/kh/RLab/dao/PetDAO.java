package kr.kh.RLab.dao;

import java.util.ArrayList;

import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.PetVO;

public interface PetDAO {

	ArrayList<PetVO> selectPetList();

	 ArrayList<EvolutionVO> selectPetFile();

	int insertChoosePet(GrowthVO growth);

	int deletePet(GrowthVO growth);


}
