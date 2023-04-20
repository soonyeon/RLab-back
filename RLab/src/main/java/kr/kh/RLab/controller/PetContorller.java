package kr.kh.RLab.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.service.PetService;

import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("")
public class PetContorller {

	private final PetService petService;

	@PostMapping("/choosePet")
	public Map<String, Object> choosePet(@RequestBody GrowthVO growth) {
	   int rs = petService.insertChoosePet(growth);
	    Map<String, Object> map = new HashMap<>();
	    return map;
	}
	
	@PostMapping("/deletePet")
	public Map<String, Object> deletePet(@RequestBody GrowthVO growth) {
	   int rs =  petService.deletePet(growth.getGr_me_id());
	    Map<String, Object> map = new HashMap<>();
	    return map;
	}

	@PostMapping("/getPrize")
	public Map<String, Object> getPrize(@RequestBody GrowthVO growth) {
	   Map<String, Object> map = new HashMap<>();
	   System.out.println(growth);
	   petService.getPrize(growth.getGr_pe_num(),growth.getGr_me_id());   
	    return map;
	}
}
