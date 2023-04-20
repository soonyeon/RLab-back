package kr.kh.RLab.service;



import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.PetDAO;
import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.MemberVO;
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
	public int insertChoosePet(GrowthVO growth) {
	    return petDao.insertChoosePet(growth);
	}

	@Override
	public int deletePet(String gr_me_id) {
		return petDao.deletePet(gr_me_id);
	}

	
	@Override
	public void getPrize(int gr_pe_num, String gr_me_id) {
		petDao.deletePet(gr_me_id);
		System.out.println(gr_pe_num);
		switch(gr_pe_num){
	    case 1 : 
	    	petDao.insertPointPetPrize(gr_me_id);
	    	petDao.updateMyPoint(gr_me_id);
	    	
	        break;
	    case 2 : 
	    	petDao.insertPayPrize(gr_me_id);
	    	petDao.insertTicektOwnPetPrize(gr_me_id);
	    	petDao.updateMyTicket(gr_me_id);
	        ; 
	        break; 
	    case 3:
	    	petDao.insertPayPrize(gr_me_id);
	    	petDao.insertTicektOwnPetPrize2(gr_me_id);
	    	petDao.updateMyTicket2(gr_me_id);
	    	break;
	    default :
	       ;    
	}
		
	}
	





	

}
