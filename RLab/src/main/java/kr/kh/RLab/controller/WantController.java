package kr.kh.RLab.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import kr.kh.RLab.service.WantService;

import kr.kh.RLab.vo.WantVO;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RestController
public class WantController {
	private final WantService wantService;
	
	 @PostMapping("/want")
	    public Map<String, Object> want(@RequestBody WantVO wantVO) {
	        return wantService.toggleWant(wantVO);
	 }
}
