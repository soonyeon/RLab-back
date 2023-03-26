package kr.kh.RLab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
//@RequiredArgsConstructor
@RequestMapping("/gather")
public class GatherController {
	
	@GetMapping("/list")
	public String gatherList() {
		return "/gather/list";
	}
	
	
}
