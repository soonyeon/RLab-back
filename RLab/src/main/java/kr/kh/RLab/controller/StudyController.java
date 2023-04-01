package kr.kh.RLab.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyVO;
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
		StudyVO study = StudyServcie.getStudyByMemberId(member.getMe_id());
		model.addAttribute("memberId", member);
		model.addAttribute("ptList", phototypeList );
		return "/study/certification_board";
	}
	
	@PostMapping("/insertCB")
	@ResponseBody
	public String insertCB(@RequestParam("photo") MultipartFile[] files,
	                       @RequestParam("content") String content,
	                       @RequestParam("ph_pt_num") String ph_pt_num,
	                       HttpServletRequest request) {
	    MemberVO member = (MemberVO) request.getSession().getAttribute("user");
	    StudyVO study = StudyServcie.getStudyByMemberId(member.getMe_id());
	    PhotoVO photoVO = new PhotoVO();
	    photoVO.setPh_content(content);
	    photoVO.setPh_pt_num(Integer.parseInt(ph_pt_num));
	    photoVO.setPh_st_num(study.getSt_num()); //스터디 번호 가져오기
	    
	    
	    if (StudyServcie.insertCB(photoVO, files, member)) {
	        return "success";
	    } else {
	        return "error";
	    }
	}
	
	

}
