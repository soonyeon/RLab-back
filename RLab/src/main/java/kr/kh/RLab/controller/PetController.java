package kr.kh.RLab.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.service.PetService;
import kr.kh.RLab.vo.PetVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class PetController {
	private final PetService petService;
	
	@GetMapping("/pet")
	@ResponseBody
	public ArrayList<PetVO> ListPet(HttpServletRequest request) {
	    ArrayList<PetVO> petList = petService.selectPetList();
	    return petList;
	}
}
