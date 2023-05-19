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
	
	//펫상점에 펫 리스트 가져오기
	@Override
	public ArrayList<PetVO> selectPetList() {
		return petDao.selectPetList();
	}
	
	//펫 사진 가져오기
	@Override
	public  ArrayList<EvolutionVO> selectPetFile() {
		return petDao.selectPetFile();
	}
	
	//펫 데려오기
	@Override
	public int insertChoosePet(GrowthVO growth) {
	    return petDao.insertChoosePet(growth);
	}
	
	//펫 보내기(삭제)
	@Override
	public int deletePet(String gr_me_id) {
		return petDao.deletePet(gr_me_id);
	}

	
	//펫 보상
	@Override
	public void getPrize(int gr_pe_num, String gr_me_id) {
		petDao.deletePet(gr_me_id);
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
