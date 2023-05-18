package kr.kh.RLab.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.service.WantService;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.WantVO;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@RestController
public class WantController {
	private final WantService wantService;
	
	//[모집글 상세보기 - 모집글 좋아요]
	 @PostMapping("/want")
	    public Map<String, Object> want(@RequestBody WantVO wantVO,HttpServletRequest request) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
	     return wantService.toggleWant(wantVO,member);
	 }
	 
	//[모집글게시판 메인 & 홈 모집글부분 - 모집글 좋아요]
	 @PostMapping("/wantst")
	    public Map<String, Object> wantst(@RequestBody WantVO wantVO,HttpServletRequest request) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		//wantVO.getSt_num()에 해당하는 값에 대한 결과를 gaNum 변수에 할당
		int gaNum =  wantService.selectGaNumByStNum(wantVO.getSt_num());
		//wantVO 객체의 wa_ga_num을 gaNum으로 설정
		wantVO.setWa_ga_num(gaNum);
	     return wantService.toggleWant(wantVO,member);
	 }
	
}
