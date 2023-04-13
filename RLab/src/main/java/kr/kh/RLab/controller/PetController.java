package kr.kh.RLab.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.PetService;
import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.PetVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class PetController {
	private final PetService petService;
	
	@GetMapping("/mypage")
	public ModelAndView ListPet(ModelAndView mv,HttpServletRequest request) {
	    ArrayList<PetVO> petList = petService.selectPetList();
	    ArrayList<EvolutionVO> petFile = petService.selectPetFile();
	    System.out.println(petList);
	    mv.addObject("petList",petList);
	    mv.addObject("petFile",petFile);
	    mv.setViewName("/mypage");
	    return mv;
	}
}
