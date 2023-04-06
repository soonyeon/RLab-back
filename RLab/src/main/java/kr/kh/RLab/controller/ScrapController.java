package kr.kh.RLab.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.service.ScrapService;
import kr.kh.RLab.vo.ScrapVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ScrapController {
	
	private final ScrapService scrapService;
	
	 @PostMapping("/scrap")
	    public Map<String, Object> scrap(@RequestBody ScrapVO scrapVO) {
	        return scrapService.toggleScrap(scrapVO);
	 }
	 
	 

}
