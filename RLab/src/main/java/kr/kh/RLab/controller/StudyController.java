package kr.kh.RLab.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/study")
public class StudyController {
	
	private final StudyService StudyServcie;
	
	@GetMapping("/certificationBoard")
	public String certificationBoard(HttpServletRequest request,Model model) {
		ArrayList<PhotoTypeVO> phototypeList = StudyServcie.getListPhotoType();
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		model.addAttribute("memberId", member);
		model.addAttribute("ptList", phototypeList );
		return "/study/certification_board";
	}
	
	@PostMapping("/insertCB")
	@ResponseBody
	public String insertCB(@RequestBody PhotoVO photo,HttpServletRequest request,MultipartFile [] files,
			FileVO file) {
			MemberVO member = (MemberVO)request.getSession().getAttribute("user");
			
			if(StudyServcie.insertCB(photo,member,files,file)) {
				return "success";	
			}else {
				return "error";				
			}
	}
	
	
	

}
