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
	    EvolutionVO evolution = petDao.selectEvolutionByNum(growth.getGr_ev_num());
	    growth.setGr_ev_num(evolution.getEv_num());
	    return petDao.insertChoosePet(growth);
	}

	@Override
	public EvolutionVO selectEvolutionByNum(int gr_ev_num) {
		// TODO Auto-generated method stub
		return null;
	}



	

}
