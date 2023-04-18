package kr.kh.RLab.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.service.PetService;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.PetVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("")
public class PetContorller {

	private final PetService petService;

	@PostMapping("/choosePet")
	public Map<String, Object> choosePet(@RequestBody GrowthVO growth) {
	    EvolutionVO evolution = petService.selectEvolutionByNum(growth.getGr_ev_num());
	    growth.setGr_ev_num(evolution.getEv_num());
	    petService.choosePet(growth);
	    Map<String, Object> map = new HashMap<>();
	    return map;
	}

}
