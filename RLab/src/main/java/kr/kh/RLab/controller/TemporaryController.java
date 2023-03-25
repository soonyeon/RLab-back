package kr.kh.RLab.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.RLab.service.TemporaryService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.TemporaryVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/temporary")
public class TemporaryController {
	
	private final TemporaryService temporaryService;
	
	@PostMapping("/save")
	@ResponseBody
	public String saveTemporary(@RequestBody TemporaryVO temporaryVO) {
			if(temporaryService.saveTemporary(temporaryVO)) {
				return "success";	
			}else {
				return "error";				
			}
	}
	
	@GetMapping("/list")
	@ResponseBody
	public ArrayList<TemporaryVO> ListTemporary() {
	    MemberVO member = new MemberVO("qwe123", "김돌탕", "asdf1234", "a@a", 1, 0);
	    ArrayList<TemporaryVO> tempList = temporaryService.getTemporaryList(member.getMe_id());
	    return tempList;
	}

}
