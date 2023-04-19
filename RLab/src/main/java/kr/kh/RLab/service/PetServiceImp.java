package kr.kh.RLab.service;



import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.PetDAO;
import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.PetVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PetServiceImp implements PetService{
	private final PetDAO petDao;
	
	@Override
	public ArrayList<PetVO> selectPetList() {
		return petDao.selectPetList();
	}

	@Override
	public  ArrayList<EvolutionVO> selectPetFile() {
		return petDao.selectPetFile();
	}

	@Override
	public int choosePet(GrowthVO growth) {
	    return petDao.insertChoosePet(growth);
	}

	@Override
	public EvolutionVO selectEvolutionByNum(int gr_ev_num) {
		return petDao.selectEvolutionByNum(gr_ev_num);
	}





	

}
